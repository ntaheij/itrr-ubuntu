#!/bin/sh

### BEGIN INIT INFO
# Provides:          itrr
# Required-Start: $ local_fs $ remote_fs $ syslog $ network $ time
# Required-Stop: $ local_fs $ remote_fs $ syslog $ network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: itrr network services
### END INIT INFO

cd /var/itrr && sudo nohup node itrr.js </dev/null >/dev/null 2>&1 &