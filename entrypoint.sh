#!/bin/bash
set -e
 
rm -f /notebook_api/tmp/pids/server.pid
 
exec "$@"