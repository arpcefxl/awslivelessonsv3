#!/bin/bash

#REGIONS=("us-west-1" "us-west-2" "us-east-1" "us-east-2" "eu-central-1" "ap-southeast-1")
REGIONS=("us-east-1")

for REGION in "${REGIONS[@]}"; do

aws ssm send-command --document-name "AWS-RunShellScript" --document-version "1" --targets '[{"Key":"tag-key","Values":["Name"]}]' --parameters '{"workingDirectory":[""],"executionTimeout":["3600"],"commands":["yum upgrade"]}' --timeout-seconds 600 --max-concurrency "50" --max-errors "50%" --region $REGION

done

