# MF demo

## Configure terraform
* Set AWS credentials by assigning apriopriate ENV variables \
`export AWS_ACCESS_KEY_ID={your_aws_access_key_id}` \
`export AWS_SECRET_ACCESS_KEY={your_aws_access_secret}`

## Usage

* Clone git repository \
```git clone https://github.com/spolspol/mf_demo```

* Run terraform \
`cd mf_demo/terraform` \
`terraform apply -var-file=input_variables.tfvars`
