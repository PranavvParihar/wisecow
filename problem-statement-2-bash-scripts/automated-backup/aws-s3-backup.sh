#!/bin/bash

# Step 1: Check if AWS CLI is installed, install if not
if ! command -v aws &> /dev/null
then
    echo "AWS CLI not found, installing..."
    sudo apt update
    sudo apt install -y awscli
else
    echo "AWS CLI is already installed."
fi

# Step 2: Configure AWS CLI (if not already configured)
# Pre-define your AWS credentials here (You can set your AWS Access Key and Secret Key as environment variables)
AWS_ACCESS_KEY="your-access-key"
AWS_SECRET_KEY="your-secret-key"
AWS_DEFAULT_REGION="us-east-1"  # Change to your preferred region

# Check if AWS CLI is configured (check for access key)
if ! aws sts get-caller-identity &> /dev/null; then
    echo "Configuring AWS CLI with environment variables..."
    aws configure set aws_access_key_id "$AWS_ACCESS_KEY"
    aws configure set aws_secret_access_key "$AWS_SECRET_KEY"
    aws configure set region "$AWS_DEFAULT_REGION"
else
    echo "AWS CLI is already configured."
fi

# Step 3: Set source directory and S3 bucket name
SOURCE_DIR="/path/to/local/directory"
S3_BUCKET="s3://my-backup-bucket"

# Step 4: Run aws s3 sync to copy files to the S3 bucket
echo "Starting backup to S3..."
aws s3 sync $SOURCE_DIR $S3_BUCKET --delete

# Step 5: Check if the AWS CLI command was successful
if [ $? -eq 0 ]; then
    echo "Backup to S3 Successful: $(date)" >> /var/log/backup.log
else
    echo "Backup to S3 Failed: $(date)" >> /var/log/backup.log
fi
