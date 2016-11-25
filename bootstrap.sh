#!/bin/bash
pids=apps.pid

pushd scalatra_app
sbt package
cp target/scala-2.11/scalatra_app_2.11-0.1.0.war \
  tomcat/webapps/scalatra_app.war
./tomcat/bin/startup.sh
popd

pushd snap_app
cabal install
snapapp -p 3003 &
echo $! >> "../$pids"
popd

pushd django_app
mkdir -p tmp
django_pid=tmp/server.pid
uwsgi \
  --http-socket :3002 \
  --daemonize tmp/server.log \
  --pidfile $django_pid \
  --module django_app.wsgi \
  --processes 1 \
  --threads 1
echo $(cat "$django_pid") >> "../$pids"
popd

pushd rails_app
bundle install
rake db:migrate
rake assets:precompile
rails server -d -e development -p 3001 -b 0.0.0.0
echo $(cat tmp/pids/server.pid) >> "../$pids"
popd
