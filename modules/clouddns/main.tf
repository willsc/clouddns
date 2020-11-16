data "google_dns_managed_zone" "dns_zone" {
  project = "sandbox-284419"
  name = var.dns_zone_name

}


resource "google_dns_record_set" "cloud-static-records" {

  managed_zone = data.google_dns_managed_zone.dns_zone.name

    for_each = {for record in var.record_names : join("/", [record.name, record.type]) => record }
    name = (
    "${each.value.name}.${data.google_dns_managed_zone.dns_zone.dns_name}"
     )
     type = each.value.type
     ttl  = each.value.ttl
     rrdatas = each.value.records

 }

output "cloud_records" {

   value = { for google_dns_record_set in google_dns_record_set.cloud-static-records : google_dns_record_set.name => google_dns_record_set.rrdatas
         }


 }