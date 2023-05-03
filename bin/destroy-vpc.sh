#! /bin/bash

cd  /home/runner/work/aws-vpc/aws-vpc/terraform/
ls -lahtr .

terraform init 

echo "Init complete"

echo ""
echo "******************************************************************"
echo "******************************************************************"
echo ""
echo "Destory VPC"
echo ""
echo "******************************************************************"

terraform destroy -auto-approve --var-file=/home/runner/work/aws-vpc/aws-vpc/terraform/terraform-vpc.tfvars

echo "******************************************************************"
echo ""
echo "Destroy complete"
echo ""
echo "******************************************************************"