#!/bin/bash
pids=apps.pid

pushd scalatra_app
export SCALATRA_PORT=3004
sbt assembly
java -jar target/scala-2.11/scalatra_app-assembly-0.1.0.jar &
echo $! >> "../$pids"
popd

pushd snap_app
cabal install
snapapp -p 3003 &
echo $! >> "../$pids"
popd

pushd django_app
django_pid=tmp/server.pid
uwsgi --http :3002 --daemonize tmp/server.log --pidfile $django_pid --module django_app.wsgi
echo $(cat "$django_pid") >> "../$pids"
popd

pushd rails_app
bundle install
rake db:migrate
rake assets:precompile
rails server -d -e development -p 3001 -b 0.0.0.0
echo $(cat tmp/pids/server.pid) >> "../$pids"
popd
