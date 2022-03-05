#!/bin/bash

PARAMGROUP=$1
REGION=$2

aws rds describe-db-parameters \
--region $REGION \
--db-parameter-group-name $PARAMGROUP \
--output text \
--query Parameters[].[Source,ParameterName,ParameterValue] | grep ^user
