#!/usr/bin/env bash

# establish an ssh tunnel
ssh -f -o ExitOnForwardFailure=yes -L 3333:localhost:5432 deploy@46.101.101.140 sleep 10

# run server with custom environment file
CUSTOM_ENV_FILE=application_production_local.yml rails s
