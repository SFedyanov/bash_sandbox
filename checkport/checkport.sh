#!/bin/bash

nc -z localhost 8080; status=$?
echo "status=${status}"

[ $status -eq 0 ] && echo "port used" || echo "port unused"

exit 0