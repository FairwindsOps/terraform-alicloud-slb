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

variable "alicloud_access_key" {}
variable "alicloud_secret_key" {}
variable "alicloud_region" {
  description = "region to deploy to, default is China East 1 (cn-hangzhou)"
  default = "cn-hangzhou"
}
variable "alicloud_azs" {
  description = "comma separated string of availability zones in order of precedence, defaults are all zones for cn-hangzhou"
  default = "cn-hangzhou-b, cn-hangzhou-c, cn-hangzhou-d"

}

variable "slb_name" {
  description = "name of the SLB to create"
  default     = "tf-slb"
}

variable "slb_internet" {
  description = "true/false indicating if the slb is internet facing"
  default     = true
}

variable "slb_charge_type" {
  description = "method of charging for the slb"
  default     = "paybytraffic"
}
