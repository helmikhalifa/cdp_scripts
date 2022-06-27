#!/bin/sh
# Author : Helmi KHALIFA
# CDP 7 kinit service

# How to: 
## Download the file cdp_kinit.sh
## chmod +x cdp_kinit.sh
## e.g., execute to get an hdfs kerberos ticket: ./cdp_kinit.sh hdfs

# $1 : service name (e.g., hdfs, atlas, hbase, hive, solr, impala, kafka, ...)

service=$1
keytab=`ls -ltr /var/run/cloudera-scm-agent/process/*-$service*/$service.keytab | tail -1 | grep -o -P '(?<=:[0-9][0-9] ).*'`
principal=`klist -kt $keytab | grep $service | tail -1 | grep -o -P '(?<=:[0-9][0-9] ).*'` 
kinit -kt $keytab $principal
