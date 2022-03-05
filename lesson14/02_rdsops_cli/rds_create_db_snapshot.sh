#!/bin/bash

REGION=$1
DBNAME=$2
SNAPSHOTNAME=$3

aws rds create-db-snapshot --region $REGION \
--db-instance-identifier $DBNAME \
--db-snapshot-identifier $SNAPSHOTNAME
