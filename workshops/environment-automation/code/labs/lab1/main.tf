
module "object_storage" {
  source = "../modules/storage-swift"
  bucket_names = "${var.bucket_names}"
  env_prefix = "${var.env_prefix}"
  compartment_id = "${var.compartment_ocid}"
}

module "vcn" {
  source = "../modules/vcn"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  dns_vcn = "${var.env_prefix}${var.dns_vcn}"
  vcn_display = "${var.env_prefix}${var.vcn_display}"
}

module "compute" {
  source = "../modules/compute-instance"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  ssh_private_key = "${var.ssh_authorized_private_key}"
  instance_shape = "${var.instance_shape}"
  subnet = "${module.vcn.subnet3_ocid}"
  name = "${var.env_prefix}${var.compute_name}"
  availability_domain = "${module.vcn.subnet3_ad}"
}

module "database" {
  source = "../modules/database"
  tenancy_ocid = "${var.tenancy_ocid}"
  compartment_ocid = "${var.compartment_ocid}"
  availability_domain = "${module.vcn.subnet3_ad}"
  SubnetOCID = "${module.vcn.subnet3_ocid}"
  ssh_public_key = "${var.ssh_public_key}"
  DBNodeDomainName = "${module.vcn.subnet3_label}.${var.env_prefix}${var.dns_vcn}.oraclevcn.com"
  DBNodeShape = "${var.DBNodeShape}"
  DBAdminPassword = "${var.DBAdminPassword}"
  DBName = "${var.DBName}"
  DBNodeDisplayName = "${var.env_prefix}${var.DBName}"
  PDBName = "${var.PDBName}"
  ssh_private_key = "${var.ssh_authorized_private_key}"
}

module "paas" {
  source = "../modules/paas-config"
  user = "${var.user}"
  db_password = "${var.DBAdminPassword}"
  password = "${var.password}"
  domain = "${var.domain}"
  jcs_subnet = "${module.vcn.subnet1_ocid}"
  soacs_subnet = "${module.vcn.subnet2_ocid}"
  region = "${var.region}"
  tenancy_ocid = "${var.tenancy_ocid}"
  ssh_public_key_path = "${var.ssh_public_key_path}"
  ssh_public_key = "${var.ssh_public_key}"
  object_storage_user = "${var.object_storage_user}"
  swift_password = "${var.swift_password}"
  OTDShape = "${var.OTDShape}"
  SOAShape = "${var.SOAShape}"
  SOADBShape = "${var.SOADBShape}"
  JCSShape = "${var.JCSShape}"
  DBShape = "${var.DBShape}"
  tenancy = "${var.tenancy}"
  buckets = "${module.object_storage.names}"
  jcs_ad = "${module.vcn.subnet1_ad}"
  soacs_ad = "${module.vcn.subnet2_ad}"
  env_prefix = "${var.env_prefix}"
  paas_compartment_id = "${var.paas_compartment_ocid}"
  jcs_display_name = "${var.subscription_id}|JaaS|${var.env_prefix}JCSDBCSStackJCS|wls|vm-1"
  soa_display_name = "${var.subscription_id}|SOA|${var.env_prefix}SOAStackSOACS|wls|vm-1"
}



output "Compute Public IP" {
  value = "${module.compute.public-ip}"
}

output "DB Public IP" {
  value = "${module.database.DBNodePublicIP}"
}			

output "jcs_ip" {
  value = "${module.paas.jcs_public_ip}"
}

output "soa_ip" {
  value = "${module.paas.soa_public_ip}"
}
