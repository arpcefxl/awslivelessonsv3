#!/bin/bash

aws secretsmanager create-secret \
--name "aws/livelessons/secret" \
--description "test secret created as part of a demo" \
--secret-string "{\"username\":\"randallflagg\",\"password\":\"TheDarkT0wer!\"}" \
--region us-east-1
