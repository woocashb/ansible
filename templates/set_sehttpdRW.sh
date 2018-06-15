#!/usr/bin/bash

args=$(find /var/www/html/vhost? -maxdepth 2 -type d -a \( -iname '*logs' -o -iname '*cache' -o -iname '*files*' -o -iname '*sql' \))

for arg in $args;do
semanage fcontext -a -t httpd_sys_rw_content_t "$arg(/.*)?";
restorecon -R $arg;
done

echo $?

