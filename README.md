# clouddns

Ensure that GOOGLE_PROJECT=<project_name> is set.

## Example 

```

locals {
  test = "192.168.1.5"
}


module "cloud" {
  source = "./modules/clouddns"


  dns_zone_name = "sandbox"
  record_names = [
    {
      name = "foo"
      type = "A"
      ttl = 300
      records = [
          "127.0.0.1",
          ]
    },
    {
        name = "foobar"
        type = "A"
        ttl = 300
        records = [
          "${local.test}",
        ]

      }
    ]



}

```
