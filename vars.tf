# @author: Alejandro Galue <agalue@opennms.org>

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "us-west-2" # For testing purposes only
}

variable "aws_key_name" {
  description = "AWS Key Name, to access EC2 instances through SSH"
  default     = "agalue" # For testing purposes only
}

variable "aws_private_key" {
  description = "AWS Private Key Full Path"
  default     = "/Users/agalue/.ssh/agalue.private.aws.us-west-2.pem" # For testing purposes only
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "172.17.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "172.17.1.0/24"
}

variable "scylladb_ip_addresses" {
  description = "ScyllaDB IP Addresses"
  type        = "list"

  default = [
    "172.17.1.21",
    "172.17.1.22",
    "172.17.1.23"
  ]
}

variable "settings" {
  description = "Common settings"
  type        = "map"

  default = {
    scylladb_ami_id              = "ami-92dc8aea" # ScyllaDB Custom AMI for us-west-2
    scylladb_instance_type       = "i3.8xlarge"
    scylladb_ec2_user            = "centos"
    scylladb_cluster_name        = "Cassandra-Cluster"
    scylladb_replication_factor  = 2
    opennms_ami_id               = "ami-6cd6f714" # Amazon Linux 2 for us-west-2
    opennms_instance_type        = "c5.9xlarge"
    opennms_ec2_user             = "ec2-user"
    opennms_ip_address           = "172.17.1.100"
    opennms_cache_max_entries    = 2000000 # for 50000 samples per second
    opennms_ring_buffer_size     = 4194304 # for 50000 samples per second
  }
}
