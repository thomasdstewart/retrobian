# Retrobian Infra

```
aws sso login --sso-session tomplat
aws --profile AWSAdministratorAccess-Retrobian --region eu-west-2 cloudformation create-stack --stack-name terraform-state-bucket --template-body file://terraform-state-bucket.yaml
aws --profile AWSAdministratorAccess-Retrobian --region eu-west-2 s3 ls

export AWS_PROFILE=AWSAdministratorAccess-Retrobian
tfall

aws  --profile AWSAdministratorAccess-Retrobian s3 ls s3://retrobian-ouquejei
```
