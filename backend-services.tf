resource "aws_db_subnet_group" "dev-rds-subgrp" {
  name       = "main"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Subnet group for RDS"
  }
}


resource "aws_elasticache_subnet_group" "dev-ecache-subgrp" {
  name       = "dev-ecache-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
}


resource "aws_db_instance" "dev-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.23"
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.dbuser
  password               = var.dbpass
  parameter_group_name   = "default.mysql8.0"
  multi_az               = "false"
  publicly_accessible    = "false"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.dev-rds-subgrp.name
  vpc_security_group_ids = [aws_security_group.dev-backend-sg.id]
}

resource "aws_elasticache_cluster" "dev-cache" {
  cluster_id           = "dev-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  subnet_group_name    = aws_elasticache_subnet_group.dev-ecache-subgrp.name
  security_group_ids   = [aws_security_group.dev-backend-sg.id]
}

resource "aws_mq_broker" "dev-rmq" {
  broker_name        = "dev-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.17.2"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.dev-backend-sg.id]
  subnet_ids         = [module.vpc.private_subnets[0]]

  user {
    username = var.rmquser
    password = var.rmqpass

  }

}
