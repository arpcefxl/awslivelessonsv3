#!/bin/bash
BUCKET=$1
REGION=$2

#Create the bucket
aws s3api create-bucket --bucket $BUCKET --region $REGION

