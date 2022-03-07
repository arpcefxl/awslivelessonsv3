#!/bin/bash
REGION=$1

aws firehose create-delivery-stream --region $REGION \
--delivery-stream-name test-delivery-stream \
--delivery-stream-type DirectPut \
--s3-destination-configuration file://s3_config.json
