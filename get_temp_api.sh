#!/bin/bash


# Simulates getting a temperature reading from an API
echo "$(date +'%Y-%m-%d %H:%M:%S') - $((RANDOM % 15 + 20)).$((RANDOM % 10))°C"
