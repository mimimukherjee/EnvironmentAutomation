resource "oci_core_instance" "devops" {
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  #image               = "${var.image_ocid}"
  shape               = "${var.instance_shape}"
  display_name = "${var.name}"

  create_vnic_details {
    subnet_id = "${var.subnet}"
    hostname_label = "${var.name}"
  }
 
  source_details {
    source_type = "image"
    source_id = "${var.image_ocid}"
  }
  
  metadata = {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data           = "${base64encode(file("${path.module}/userdata/bootstrap"))}"
  }

  timeouts = {
    "create" = "60m"
  }
}

