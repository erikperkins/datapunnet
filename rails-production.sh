#!/bin/bash
docker-compose -f docker-compose-production.yml run rails bash \
  rake db:migrate assets:clobber assets:precompile
