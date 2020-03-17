resource "aws_s3_bucket" "log_bucket" {
  bucket = "log-acces-flaconi"
  acl = "private"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1584326247536",
    "Statement": [
        {
            "Sid": "AWSConsoleStmt-1584326247536",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::156460612806:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::log-acces-flaconi/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::log-acces-flaconi/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::log-acces-flaconi"
        }
    ]
}
POLICY
  tags = {
    Name        = "Log_acces_bucket_flaconi"
    Environment = "Assignment"
  }
}