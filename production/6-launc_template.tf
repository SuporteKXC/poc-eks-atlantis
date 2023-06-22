resource "aws_launch_template" "freterapido-prod" {
  name = "freterapido-prod"

  instance_type = "m5.large"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "freterapido-prod"
    }
  }


}


resource "aws_launch_template" "database" {
  name = "database"

  instance_type = "m5.large"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "database"
    }
  }


}


resource "aws_launch_template" "application" {
  name = "application"

  instance_type = "m5.large"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "application"
    }
  }


}


resource "aws_launch_template" "quote" {
  name = "quote"

  instance_type = "t3.medium"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "application"
    }
  }


}

resource "aws_launch_template" "workers" {
  name = "workers"

  instance_type = "t3.medium"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "application"
    }
  }


}

resource "aws_launch_template" "web" {
  name = "web"

  instance_type = "t3.medium"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web"
    }
  }


}

resource "aws_launch_template" "worker-import-quote-table" {
  name = "worker-import-quote-table"

  instance_type = "t3.medium"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web"
    }
  }


}
