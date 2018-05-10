variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "tenancy_ocid" {}
variable "availability_domain" {}
variable "SubnetOCID" {}

# DBSystem specific 
variable "DBNodeShape" {}
variable "DBAdminPassword" {}
variable "DBName" {}
variable "DBNodeDisplayName" {}
variable "DBNodeDomainName" {}
variable "PDBName" {}

variable "ssh_private_key" {}

variable "DBEdition" {
    default = "ENTERPRISE_EDITION"
}
variable "DBVersion" {
    default = "12.1.0.2"
}
variable "DataStorageSizeInGB" {
  default = "256"
}
variable "NodeCount" {
  default = "1"
}

