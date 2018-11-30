############################# User Configuration ####################################

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ssh_public_key" {}
variable "ssh_public_key_path" {}
variable "ssh_authorized_private_key" {}
variable "compartment_ocid" {}
variable "paas_compartment_ocid" {}

variable "subscription_id" {}
variable "user" {}
variable "password" {}
variable "domain" {}
variable "tenancy" {}
variable "object_storage_user" {}

variable "swift_password" {}

variable "env_prefix" {
  default = "lab1"
}

############################### Compute Configuration #################################

variable "compute_name" {
  default="DevOps-Instance"
}
variable "instance_shape" {
  default="VM.Standard2.2"
}


variable "config_src_dir" {
  default="/app"
}

variable "DBShape" {
  default="VM.Standard1.2"
}
variable "JCSShape" {
  default="VM.Standard1.4"
}
variable "SOAShape" {
  default="VM.Standard1.4"
}
variable "SOADBShape" {
  default="VM.Standard1.2"
}
variable "OTDShape" {
  default="VM.Standard1.1"
}

############################ VCN Configuration #######################################

variable "dns_vcn" {
  default="tfvcn"
}
variable "vcn_display" {
  default="DevOpsVCN"
}

############################ Object Storage and Swift Password ##############################

variable "bucket_names" {
  default = ["jcs_backup", "jcs_dbcs_backup", "soacs_backup", "soacs_dbcs_backup" ]
}

############################## Database Configuration ####################################

variable "DBNodeShape" {
    default = "VM.Standard2.1"
}
variable "DBAdminPassword" {
    default = "STateinsurance12#_"
}

# OracleDB SID 
variable "DBName" {
    default = "TFDB"
}
variable "PDBName" {
  default = "pdbName"
}
