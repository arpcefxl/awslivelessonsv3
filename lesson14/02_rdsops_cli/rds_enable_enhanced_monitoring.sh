#!/bin/bash

REGION=$1
DBNAME=$2
ROLEARN=$3

aws rds modify-db-instance --region $REGION \
--db-instance-identifier $DBNAME \
--monitoring-interval 60 \
--monitoring-role-arn $ROLEARN
