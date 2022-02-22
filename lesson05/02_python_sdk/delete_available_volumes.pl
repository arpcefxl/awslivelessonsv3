#!/usr/bin/python
import boto3
regionid = "ap-southeast-1"
ec2 = boto3.resource("ec2", region_name=regionid)
available_volumes = ec2.volumes.filter(
  Filters=[{'Name': 'status', 'Values': ['available']}]
)

for volume in available_volumes:
  print(volume.id)
  volume.delete()
