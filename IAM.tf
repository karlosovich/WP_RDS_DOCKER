# This file is used to create IAM roles and profiles for EC2, RDS instances and Networks.

# EC2 IAM role and policy
resource "aws_iam_role" "ec2_ssh_role" {
    name = "ec2_ssh_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_ssh_profile" {
    name = "ec2_ssh_profile"
    role = aws_iam_role.ec2_ssh_role.name
}

resource "aws_iam_policy" "ec2_ssh_policy" {
    name        = "ec2_ssh_policy"
    description = "Allows SSH access and EC2 instance management"
    policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:RebootInstances",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "ec2:DescribeAddresses",
                "ec2:AssociateAddress",
                "ec2:DisassociateAddress"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:AuthorizeSecurityGroupIngress",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:AuthorizeSecurityGroupEgress",
            "Resource": "arn:aws:ec2:*:*:security-group/*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_ssh_policy_attachment" {
    role       = aws_iam_role.ec2_ssh_role.name
    policy_arn = aws_iam_policy.ec2_ssh_policy.arn
}




# EC2 IAM user
resource "aws_iam_user" "ec2_admin_user" {
    name = "ec2_admin_user"
}

resource "aws_iam_user_policy_attachment" "ec2_admin_user_policy_attachment" {
    user       = aws_iam_user.ec2_admin_user.name
    policy_arn = aws_iam_policy.ec2_ssh_policy.arn
}



#######################################################################################################


# RDS IAM role and policy
resource "aws_iam_role" "rds_access_role" {
    name = "rds_access_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "rds.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "rds_access_policy" {
    name        = "rds_access_policy"
    description = "Allows access and management of RDS database"
    policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "rds:DescribeDBInstances",
                "rds:CreateDBInstance",
                "rds:ModifyDBInstance",
                "rds:DeleteDBInstance",
                "rds:DescribeDBSnapshots",
                "rds:CreateDBSnapshot",
                "rds:DeleteDBSnapshot",
                "rds:RestoreDBInstanceFromDBSnapshot",
                "rds:RebootDBInstance",
                "rds:StartDBInstance",
                "rds:StopDBInstance",
                "rds:DescribeDBClusters",
                "rds:CreateDBCluster",
                "rds:ModifyDBCluster",
                "rds:DeleteDBCluster",
                "rds:DescribeDBClusterSnapshots",
                "rds:CreateDBClusterSnapshot",
                "rds:DeleteDBClusterSnapshot",
                "rds:RestoreDBClusterFromSnapshot",
                "rds:RebootDBInstance",
                "rds:StartDBInstance",
                "rds:StopDBInstance"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "rds_access_policy_attachment" {
    role       = aws_iam_role.rds_access_role.name
    policy_arn = aws_iam_policy.rds_access_policy.arn
}

# RDS IAM user
resource "aws_iam_user" "rds_admin_user" {
    name = "rds_admin_user"
}

resource "aws_iam_user_policy_attachment" "rds_admin_user_policy_attachment" {
    user       = aws_iam_user.rds_admin_user.name
    policy_arn = aws_iam_policy.rds_access_policy.arn
}



#######################################################################################################


# Networking IAM role and policy
resource "aws_iam_role" "networking_role" {
    name = "networking_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "networking_policy" {
    name        = "networking_policy"
    description = "Allows management of networking resources"
    policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateInternetGateway",
                "ec2:DeleteInternetGateway",
                "ec2:AttachInternetGateway",
                "ec2:DetachInternetGateway",
                "ec2:CreateNatGateway",
                "ec2:DeleteNatGateway",
                "ec2:CreateSubnet",
                "ec2:DeleteSubnet",
                "ec2:CreateRouteTable",
                "ec2:DeleteRouteTable",
                "ec2:AssociateRouteTable",
                "ec2:DisassociateRouteTable",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupEgress"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "networking_policy_attachment" {
    role       = aws_iam_role.networking_role.name
    policy_arn = aws_iam_policy.networking_policy.arn
}


# Networking IAM user
resource "aws_iam_user" "networking_admin_user" {
    name = "networking_admin_user"
}

resource "aws_iam_user_policy_attachment" "networking_admin_user_policy_attachment" {
    user       = aws_iam_user.networking_admin_user.name
    policy_arn = aws_iam_policy.networking_policy.arn
}


#######################################################################################################