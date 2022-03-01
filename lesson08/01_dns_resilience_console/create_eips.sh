#!/bin/bash

REGION1=$1
REGION2=$2

aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=route53demo,Value=true}]' --region $REGION1 --output text --query [PublicIp,NetworkBorderGroup]
aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=route53demo,Value=true}]' --region $REGION2 --output text --query [PublicIp,NetworkBorderGroup]
