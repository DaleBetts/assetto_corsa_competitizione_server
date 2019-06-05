# Main role for the Assetto Server
resource "aws_iam_role" "assetto_role" {
  name = "${var.project_name}-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "assetto_profile" {
  name = "${var.project_name}-iam-profile"
  role = "${var.project_name}-iam-role"
}

resource "aws_iam_role_policy" "assetto_iam_role_policy" {
  name = "${var.project_name}-assetto-role-policy"
  role = "${aws_iam_role.assetto_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
