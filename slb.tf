#Copyright 2017 Reactive Ops Inc.
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
  name                 = "${var.slb_name}"
  internet             = "${var.slb_internet}"
  internet_charge_type = "${var.slb_charge_type}"

  listener = [
    {
      "instance_port" = "80"
      "lb_port"       = "80"
      "lb_protocol"   = "http"
      "bandwidth"     = "-1"

      "health_check_type" = "http"
      "persistence_timeout" = 3600
      "healthy_threshold" = 8
      "unhealthy_threshold" = 8
      "health_check_timeout" = 8
      "health_check_interval" = 5
      "health_check_http_code" = "http_2xx,http_3xx"
      "health_check_timeout" = 8
    },
#    {
#      "instance_port" = "443"
#      "lb_port"       = "443"
#      "lb_protocol"   = "https"
#      "bandwidth"     = "-1"
#    },
  ]
}

output "id" {
  value = "${alicloud_slb.slb.id}"
}
