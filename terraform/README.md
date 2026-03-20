# Retrobian Infra

```
aws sso login --sso-session tomplat
aws --profile AWSAdministratorAccess-Retrobian-TomPlat --region eu-west-2 cloudformation create-stack --stack-name terraform-state-bucket --template-body file://terraform-state-bucket.yaml
aws --profile AWSAdministratorAccess-Retrobian-TomPlat --region eu-west-2 s3 ls

export AWS_PROFILE=AWSAdministratorAccess-Retrobian-TomPlat
tfall

aws  --profile AWSAdministratorAccess-Retrobian-TomPlat s3 ls s3://retrobian-ouquejei
```
