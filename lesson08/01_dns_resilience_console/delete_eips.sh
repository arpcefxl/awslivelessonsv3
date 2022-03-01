#!/bin/bash

REGION1=$1
REGION2=$2

EIP1=`aws ec2 describe-addresses --region $REGION1 --filters "Name=tag-key,Values=route53demo" --query Addresses[].AllocationId --output text`
echo $EIP1
aws ec2 release-address --allocation-id $EIP1 --region $REGION1

EIP2=`aws ec2 describe-addresses --region $REGION2 --filters "Name=tag-key,Values=route53demo" --query Addresses[].AllocationId --output text`
echo $EIP2
aws ec2 release-address --allocation-id $EIP2 --region $REGION2
