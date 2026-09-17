terraform {
	required_providers {
		aws = {
				source = "hashicorp/aws"
				version = "~> 6.0"  # 5.0 ~ 6.0 (5.0 이상, 6.0 미만의 최신버전)
		}
	}

	backend "s3" {
		bucket						= "std19-ex7-bucket"	# 테라폼 상태파일을 저장할 버킷 이름
		key								= "TerraformState/Ex/ex7-terraform-cicd/terraform.tfstate"	# 버킷에서 테라폼 상태파일 저장 경로
		region						= "us-west-2"
		dynamodb_table		= "std19-ex7-lock-table"	# 락온 상태를 저장할 DynamoDB Table 이름
		encrypt						= true	# 파일 암호화
	}
}

provider "aws" {
	region = "us-west-2"
}
