data "oci_core_instances" "jcs_instances" {
        #Required
        compartment_id = "${var.paas_compartment_id}"

        #Optional
        #availability_domain = "${var.instance_availability_domain}"
        display_name = "${var.jcs_display_name}"
        state = "RUNNING"
        depends_on = ["oraclepaas_java_service_instance.JCSDBCSStackJCS"]
}

data "oci_core_vnic_attachments" "jcs_vnic_attachments" {
        #Required
        compartment_id = "${var.paas_compartment_id}"

        #Optional
        availability_domain = "${lookup(data.oci_core_instances.jcs_instances.instances[0],"availability_domain")}"
        instance_id = "${lookup(data.oci_core_instances.jcs_instances.instances[0],"id")}"
        #vnic_id = "${var.vnic_attachment_vnic_id}"
}

data "oci_core_vnic" "jcs_vnic" {
        #Required
        vnic_id = "${lookup(data.oci_core_vnic_attachments.jcs_vnic_attachments.vnic_attachments[count.index], "vnic_id")}"
        count=2
}

data "oci_core_instances" "soa_instances" {
        #Required
        compartment_id = "${var.paas_compartment_id}"

        #Optional
        #availability_domain = "${var.instance_availability_domain}"
        display_name = "${var.soa_display_name}"
        state = "RUNNING"
        depends_on = ["null_resource.stack-manager-soa"]
}

data "oci_core_vnic_attachments" "soa_vnic_attachments" {
        #Required
        compartment_id = "${var.paas_compartment_id}"

        #Optional
        availability_domain = "${lookup(data.oci_core_instances.soa_instances.instances[0],"availability_domain")}"
        instance_id = "${lookup(data.oci_core_instances.soa_instances.instances[0],"id")}"
        #vnic_id = "${var.vnic_attachment_vnic_id}"
}

data "oci_core_vnic" "soa_vnic" {
        #Required
        vnic_id = "${lookup(data.oci_core_vnic_attachments.soa_vnic_attachments.vnic_attachments[count.index], "vnic_id")}"
        count=2
}

