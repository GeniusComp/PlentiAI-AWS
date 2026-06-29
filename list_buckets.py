import boto3

# Connect to AWS S3
s3 = boto3.client('s3')

# Get list of all buckets
response = s3.list_buckets()

# Print each bucket name
print("S3 Buckets in your AWS account:")
print("-" * 40)
for bucket in response['Buckets']:
    print(f"Bucket Name: {bucket['Name']}")
    print(f"Created: {bucket['CreationDate']}")
    print("-" * 40)
