# @author: Alejandro Galue <agalue@opennms.org>

variable "aws_region" {
  description = "EC2 Region for the VPC. For testing purposes only, please use your own."
  default     = "us-east-1"
}

variable "aws_key_name" {
  description = "AWS Key Name, to access EC2 instances through SSH. For testing purposes only, please use your own."
  default     = "jesse@noise"
}

variable "aws_private_key" {
  description = "AWS Private Key Full Path. For testing purposes only, please use your own."
  default     = "/home/jesse/.ssh/id_rsa.pub"
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
  description = "ScyllaDB IP Addresses. This also determines the size of the cluster."
  type        = "list"

  default = [
    "172.17.1.21",
    "172.17.1.22"
  ]
}

variable "settings" {
  description = "Common settings"
  type        = "map"

  default = {
    scylladb_ami_id              = "ami-0990366cdafebaa01" # ScyllaDB Custom AMI for us-east-1
    scylladb_instance_type       = "i3.4xlarge" # May require to request a limit increase on the chosen region
    scylladb_ec2_user            = "centos"
    scylladb_cluster_name        = "OpenNMS-Cluster"
    scylladb_replication_factor  = 1 # It should be consistent with the cluster size. Check scylladb_ip_addresses
    opennms_ami_id               = "ami-013be31976ca2c322" # Amazon Linux 2 for us-east-1
    opennms_instance_type        = "m5.4xlarge"
    opennms_ec2_user             = "ec2-user"
    opennms_ip_address           = "172.17.1.100"
    opennms_cache_max_entries    = 2000000 # for 50000 samples per second
    opennms_ring_buffer_size     = 4194304 # for 50000 samples per second
  }
}
