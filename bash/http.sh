#!/bin/bash

exec 3<>/dev/tcp/example.com/80

echo -e "GET / HTTP/1.1\nHost: example.com\nConnection: close\n" >&3

cat <&3 | head

