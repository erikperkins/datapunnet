#!/bin/bash
scp -i backpasture.pem -r \
  rails_app/public/assets/ \
  ubuntu@www.backpasture.net:/home/ubuntu/docker/ecosystem/rails_app/public
