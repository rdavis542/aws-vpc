#! /bin/bash

cd  /home/runner/work/aws-vpc/aws-vpc/terraform/
ls -lahtr .

terraform init 

echo "Init complete"

echo ""
echo "******************************************************************"

terraform fmt

echo "******************************************************************"
echo ""
echo "Format complete"
echo ""
echo "******************************************************************"

terraform plan --var-file=/home/runner/work/aws-vpc/aws-vpc/terraform/terraform-vpc.tfvars

echo "******************************************************************"
echo ""
echo "Plan complete"
echo ""
echo "******************************************************************"