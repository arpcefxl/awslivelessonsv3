#!/bin/bash

MAINREGION=$1

REGIONS=`aws ec2 describe-regions --output text --query Regions[].RegionName |tr -s '\t' '\n'`

for i in $REGIONS; do
  if [[ $i == $MAINREGION ]]; then
    echo "Ignoring main region $i"
  else
    echo "Importing keypair to $i"
    aws ec2 import-key-pair --region $i --key-name demo-key-pair2 \
    --public-key-material file://key-pair.pub
  fi 
done
