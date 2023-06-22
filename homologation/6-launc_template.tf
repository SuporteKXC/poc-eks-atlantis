resource "aws_launch_template" "poc-atlantis" {
  name = "poc-atlantis"

  instance_type = var.node-instance-type

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "poc-atlantis"
    }
  }


}
