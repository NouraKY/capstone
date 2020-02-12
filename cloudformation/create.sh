aws cloudformation create-stack  \
--stack-name $1 \
--capabilities CAPABILITY_IAM \
--template-body file://$2 \
--region=us-west-2
