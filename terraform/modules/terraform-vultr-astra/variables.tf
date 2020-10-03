variable "region" {
  type = string
  default = "New Jersey"
}

variable "machine_type" {
  type = number
  default = 204
}

variable "snapshot" {
  type = string
  default = "astra-node"
}

variable "flight_count" {
  type = string
  default = 1
}
