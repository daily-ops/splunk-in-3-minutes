#!/bin/bash

rm -f /var/log/secure /var/log/access_log
python3 /app/log_generator.py -a /var/log/access_log -s /var/log/secure


