# run from local Mac terminal

aws iam create-role --role-name ADN-Viewer-CodeDeploy-Role --assume-role-policy-document file://ADN-Viewer-CodeDeploy-Trust.json

aws iam put-role-policy --role-name ADN-Viewer-CodeDeploy-Role --policy-name ADN-Viewer-CodeDeploy-Permissions --policy-document file://ADN-Viewer-CodeDeploy-Permissions.json

aws iam get-role --role-name ADN-Viewer-CodeDeploy-Role --query "Role.Arn" --output text

aws iam create-instance-profile --instance-profile-name ADN-Viewer-CodeDeploy-Role-Profile

aws iam add-role-to-instance-profile --instance-profile-name ADN-Viewer-CodeDeploy-Role-Profile --role-name ADN-Viewer-CodeDeploy-Role

aws ec2 run-instances --image-id ami-1ecae776 --iam-instance-profile Name="ADN-Viewer-CodeDeploy-Role-Profile" --key-name aws-devtech-us-east1 --security-groups "web server" 
