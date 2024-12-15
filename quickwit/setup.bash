#!/usr/bin/env bash

quickwit run &

sleep 10

quickwit index create --index-config config/index.yml || true

exit 0
