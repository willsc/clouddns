variable "dns_zone_name" {
  description = "Name of Zone"
  type        = string
}


variable "record_names" {
  description = "List of records to create"
  default     = []
  type        = list (
          object ({
             name = string,
             type = string,
             ttl  = number,
            records = list(string) }
       )
     )

}

