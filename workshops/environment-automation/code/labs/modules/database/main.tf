resource "oci_database_db_system" "TFDBNode" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_ocid}"
  cpu_core_count = "${substr(var.DBNodeShape, 13, -1)}"
  database_edition = "${var.DBEdition}"
  db_home {
    database {
      "admin_password" = "${var.DBAdminPassword}"
      "db_name" = "${var.DBName}"
      #optional
      "pdb_name" = "${var.PDBName}"
    }
    db_version = "${var.DBVersion}"
  }
  shape = "${var.DBNodeShape}"
  subnet_id = "${var.SubnetOCID}"
  ssh_public_keys = ["${var.ssh_public_key}"]
  hostname = "${var.DBName}"
  data_storage_size_in_gb = "${var.DataStorageSizeInGB}"
  node_count = "${var.NodeCount}"
  #optional
  display_name = "${var.DBNodeDisplayName}"
}
