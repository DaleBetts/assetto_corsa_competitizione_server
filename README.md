# Dynamic Assetto Corsa Competitizione Game Servers

Built on AWS using Packer and Terraform

# Getting Started

## Requirements

* packer version
* terraform version
* s3 bucket with game assets
* IAM role for packer (see below)

## Upload game files to S3 bucket

Login to aws console, s3, create a bucket, upload assetto bundle to s3 bucket

## Create an IAM role for Packer

Packer will need access to pull in the s3 artifacts so we need to create a role to do this up front.

Go to IAM -> Create role -> AWS Services -> EC2 Service role -> Create a policy, add s3 list/read to s3 bucket name this `packer-assetto`

# Packer build

```
cd packer 
packer build
```