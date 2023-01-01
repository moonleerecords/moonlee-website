#!/usr/bin/env bash

# Setup local environment - db recreate, fetch events
rails RAILS_ENV=development db:drop db:create db:migrate db:seed db:songkick:fetch_upcoming_events
