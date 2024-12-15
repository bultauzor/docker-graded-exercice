#!/usr/bin/env sh

if [ ! -e /app/config.yml ]; then
    cp /default/config.yml /app/config.yml
fi

if [ ! -e /app/statping.db ]; then
    cp /default/statping.db /app/statping.db
fi

statping --port $PORT
