variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "instance_shape" {}
variable "subnet" {}
variable "ssh_private_key" {}

variable "name" {}
variable "availability_domain" {}

variable "image_ocid" {
  default="ocid1.image.oc1.iad.aaaaaaaaafmyat7i5s7ae3aylwtvmt7v4dw4yy2thgzaqlbjzoxngrjg54xq"
}
