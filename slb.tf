#Copyright 2017 FairwindsOps Inc.
#
#Licensed under the Apache License, Version 2.0 (the “License”);
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an “AS IS” BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

resource "alicloud_slb" "slb" {
  provider             = "alicloud.${var.alicloud_region}"
  name                 = "${var.slb_name}"
  internet             = "${var.slb_internet}"
  internet_charge_type = "${var.slb_charge_type}"

  listener = [
    {
      "instance_port" = "80"
      "lb_port"       = "80"
      "lb_protocol"   = "tcp"
      "bandwidth"     = "-1"

      "healthy_threshold" = 8
      "unhealthy_threshold" = 8
      "health_check_timeout" = 8
      "health_check_interval" = 5
    },
    {
      "instance_port" = "443"
      "lb_port"       = "443"
      "lb_protocol"   = "tcp"
      "bandwidth"     = "-1"

      "healthy_threshold" = 8
      "unhealthy_threshold" = 8
      "health_check_timeout" = 8
      "health_check_interval" = 5
    },
  ]
}

output "id" {
  value = "${alicloud_slb.slb.id}"
}
