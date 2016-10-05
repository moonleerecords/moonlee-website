#!/usr/bin/env bash

# Setup local environment - db recreate, fetch events
rails db:drop db:create db:migrate db:seed db:songkick:fetch_upcoming_events
