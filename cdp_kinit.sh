#!/bin/sh
# Author : Helmi KHALIFA
# CDP 7 kinit service

# $1 : servcie

service=$1
keytab=`ls -ltr /var/run/cloudera-scm-agent/process/*-$service*/$service.keytab | tail -1 | grep -o -P '(?<=:[0-9][0-9] ).*'`
principal=`klist -kt $keytab | tail -1 | grep -o -P '(?<=:[0-9][0-9] ).*'` 
kinit -kt $keytab $principal