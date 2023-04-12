variable AWS_REGION {
  default = "us-east-1"
}


variable AMIS {
  type = map(any)
  default = {
    us-east-1 = "ami-0557a15b87f6559cf"
    us-east-2 = "ami-00eeedc4036573771"

  }

}

variable PRIV_KEY_PATH {
  default = "devkey"
}


variable PUB_KEY_PATH {
  default = "devkey.pub"
}


variable USERNAME {
  default = "ubuntu"
}

variable MYIP {
  default = "49.204.179.25/32"
}


variable rmquser {
  default = "rabbit"
}


variable rmqpass {
  default = "rmqpass@9959942622"
}


variable dbuser {
  default = "admin"
}

variable dbpass {
  default = "admin123"
}

variable db_name {
  default = "accounts"
}

variable instance_count {
  default = "1"
}

variable VPC_NAME {
  default = "dev-VPC"
}

variable Zone1 {
  default = "us-east-1a"
}


variable Zone2 {
  default = "us-east-1b"
}


variable Zone3 {
  default = "us-east-1c"
}

variable VpcCIDR {
  default = "10.1.0.0/16"
}


variable PubSub1CIDR {
  default = "10.1.1.0/24"
}


variable PubSub2CIDR {
  default = "10.1.2.0/24"
}

variable PubSub3CIDR {
  default = "10.1.3.0/24"
}


variable PrivSub1CIDR {
  default = "10.1.10.0/24"
}


variable PrivSub2CIDR {
  default = "10.1.20.0/24"
}


variable PrivSub3CIDR {
  default = "10.1.30.0/24"
}
