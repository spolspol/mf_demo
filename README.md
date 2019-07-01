# MF demo

## Configure terraform

* Set AWS credentials by assigning appropriate ENV variables \
`export AWS_ACCESS_KEY_ID={your_aws_access_key_id}` \
`export AWS_SECRET_ACCESS_KEY={your_aws_access_secret}`

## Usage

* Clone git repository \
```git clone https://github.com/spolspol/mf_demo```

* Run terraform \
`# enter terraform folder`
`cd mf_demo/terraform` \
`# initialise terraform` \
`terraform init` \
`# save terraform plan into a file` \
`terraform plan -var-file=input_variables.tfvars -out terraform.plan` \
`# apply terraform from plan file` \
`terraform apply terraform.plan`
