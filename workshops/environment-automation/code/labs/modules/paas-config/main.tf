/*
resource "null_resource" "jcs-manager" {
  provisioner "local-exec" {
    command = "echo '{\"publicKeyText\":\"${join(" ",slice(split(" ",file("${var.ssh_public_key_path}")),0,2))}\", \"commonPwd\":\"${var.db_password}\", \"sRegion\":\"${var.region}\", \"availabilityDomain\":\"${var.jcs_ad}\", \"backupStorageContainer\":\"https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[0]}\", \"dbBackupStorageContainer\":\"https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[1]}\", \"backupStorageUser\":\"${var.object_storage_user}\", \"backupStoragePassword\": \"${var.swift_password}\", \"subnet\":\"${var.jcs_subnet}\", \"dbComputeShape\":\"${var.DBShape}\", \"wlComputeShape\":\"${var.JCSShape}\"}' > jcs.json"
  }
}

resource "null_resource" "stack-manager-jcs" {
  depends_on = ["null_resource.jcs-manager"]

  provisioner "local-exec" {
    command = "python ${path.module}/stackmanager.py create jcs -u ${var.user} -p ${var.password} --debug -dn ${var.domain}  -pa ${path.module} -e ${var.env_prefix}"
  }

  provisioner "local-exec" {
    when = "destroy"
    command = "python ${path.module}/stackmanager.py delete jcs -u ${var.user} -p ${var.password} --debug -dn ${var.domain}  -pa ${path.module} -e ${var.env_prefix}"
  }
}
*/


resource "null_resource" "soa-manager" {
  provisioner "local-exec" {
    command = "echo '{\"publicKeyText\":\"${join(" ",slice(split(" ",file("${var.ssh_public_key_path}")),0,2))}\", \"commonPwd\":\"${var.db_password}\", \"sRegion\":\"${var.region}\", \"availabilityDomain\":\"${var.soacs_ad}\", \"backupStorageContainer\":\"https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[2]}\", \"dbBackupStorageContainer\":\"https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[3]}\", \"backupStorageUser\":\"${var.object_storage_user}\", \"backupStoragePassword\": \"${var.swift_password}\", \"subnet\":\"${var.soacs_subnet}\", \"dbComputeShape\":\"${var.SOADBShape}\", \"wlComputeShape\":\"${var.SOAShape}\", \"wlComputeShape2\":\"${var.OTDShape}\"}' > soa.json"
  }
}

resource "null_resource" "stack-manager-soa" {
  depends_on = ["null_resource.soa-manager"]

  provisioner "local-exec" {
    command = "python ${path.module}/stackmanager.py create soa -u ${var.user} -p ${var.password} --debug -dn ${var.domain} -pa ${path.module} -e ${var.env_prefix}"
  }

  provisioner "local-exec" {
    when = "destroy"
    #command = "python ${path.module}/stackmanager.py delete soa -u ${var.user} -p ${var.password} --debug -dn ${var.domain} -pa ${path.module} -e ${var.env_prefix}"
    command = "${path.module}/stack_delete.sh ${var.user} ${var.password} ${var.domain} ${var.db_password} ${var.env_prefix}"
  }
}


provider "oraclepaas" {
  user = "${var.user}"
  password = "${var.password}"
  identity_domain = "${var.domain}"
  database_endpoint = "https://dbaas.oraclecloud.com"
  java_endpoint = "https://jaas.oraclecloud.com"
}


resource "oraclepaas_database_service_instance" "JCSDBCSStackDBCS" {
  name        = "${var.env_prefix}JCSDBCSStackDBCS"
  description = "Created by Terraform"

  edition           = "EE"
  version           = "12.2.0.1"    
  subscription_type = "HOURLY"
  shape             = "${var.DBShape}"
  region	    = "${var.region}"
  availability_domain = "${var.jcs_ad}"
  subnet = "${var.jcs_subnet}"

  ssh_public_key = "${var.ssh_public_key}"

  database_configuration {
    admin_password     = "${var.db_password}"
    backup_destination = "BOTH"
    sid                = "ORCL"
    usable_storage     = 50
  }

  backups {
    cloud_storage_container = "https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[1]}"
    cloud_storage_username  = "${var.object_storage_user}"
    cloud_storage_password  = "${var.swift_password}"
  }

  timeouts {
    "create" = "150m"
  }
}


output "dbaasmonitor_url" {
  value = "${oraclepaas_database_service_instance.JCSDBCSStackDBCS.dbaas_monitor_url}"
}

output "em_url" {
  value = "${oraclepaas_database_service_instance.JCSDBCSStackDBCS.em_url}"
}


output "dbcs_uri" {
  value = "${oraclepaas_database_service_instance.JCSDBCSStackDBCS.uri}"
}


resource "oraclepaas_java_service_instance" "JCSDBCSStackJCS" {
  name        = "${var.env_prefix}JCSDBCSStackJCS"
  description = "Created by Terraform"

  edition              = "EE"
  service_version      = "12cRelease212"
  metering_frequency   = "HOURLY"
  enable_admin_console = true

  ssh_public_key = "${var.ssh_public_key}"

  region = "${var.region}"
  availability_domain = "${var.jcs_ad}"
  subnet = "${var.jcs_subnet}"

  weblogic_server {
    shape = "${var.JCSShape}"

    managed_servers {
      server_count = 1
    }    

    admin {
      username = "weblogic"
      password = "${var.db_password}"
    }

    database {
      name     = "${oraclepaas_database_service_instance.JCSDBCSStackDBCS.name}"
      username = "sys"
      password = "${oraclepaas_database_service_instance.JCSDBCSStackDBCS.database_configuration.0.admin_password}"
    }
  }

  backups {
    cloud_storage_container = "https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${var.buckets[0]}"
    cloud_storage_username  = "${var.object_storage_user}"
    cloud_storage_password  = "${var.swift_password}"
  }

  timeouts {
    "create" = "150m"
  }
}

output "admin_url" {
  value = "${oraclepaas_java_service_instance.JCSDBCSStackJCS.weblogic_server.0.root_url}"
}

