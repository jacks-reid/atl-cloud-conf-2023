# CloudFormation Guard

This directory contains an example CloudFormation Stack and CloudFormation Guard policy to block any resources with a public EIP association.

[Templates are derived from AWS documentation.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/sample-templates-services-us-west-2.html#w2ab1c35c58c13c17)

```
aws cloudformation create-stack --stack-name=atlcloud --template-body file://path-to-here/ec2-elastic-ip-cloudformation-template.json --parameters ParameterKey=KeyName,ParameterValue=atlcloudconf --region=$AWS_REGION

docker run \
  --mount src=$HOME/projects/atl-cloud-conf-2023/examples/cloudformation-guard,target=/container/guard-files,type=bind \
  -it public.ecr.aws/aws-cloudformation/cloudformation-guard:latest \
  ./cfn-guard validate -d /container/guard-files/ec2-elastic-ip-cloudformation-template.json -r /container/guard-files/ec2-no-public-ips.guard
```

```
ec2-elastic-ip-cloudformation-template.json Status = FAIL
FAILED rules
ec2-no-public-ips.guard/ec2_instances_public_ips    FAIL
---
Evaluating data ec2-elastic-ip-cloudformation-template.json against rules ec2-no-public-ips.guard
Number of non-compliant resources 1
Resource = IPAssoc {
  Type      = AWS::EC2::EIPAssociation
  Rule = ec2_instances_public_ips {
    ALL {
      Check =  %public_ip not EXISTS   {
        ComparisonError {
          Error            = Check was not compliant as property [/Resources/IPAssoc/Properties/EIP[L:203,C:16]] existed.
          PropertyPath    = /Resources/IPAssoc/Properties/EIP[L:203,C:16]
          Operator        = NOT EXISTS
          Code:
              201.      "Type" : "AWS::EC2::EIPAssociation",
              202.      "Properties" : {
              203.        "InstanceId" : { "Ref" : "EC2Instance" },
              204.        "EIP" : { "Ref" : "IPAddress" }
              205.      }
              206.    }

        }
      }
    }
  }
}
```
