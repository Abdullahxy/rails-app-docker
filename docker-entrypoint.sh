#!/bin/sh
set -e

rm -f /web/tmp/pids/server.pid

bundle exec rails server -b "0.0.0.0"
