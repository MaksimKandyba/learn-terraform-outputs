provider "fly" {
  fly_http_endpoint = "api.machines.dev"
}

provider "random" {}

resource "random_pet" "name" {}

#resource "fly_app" "exampleApp" {
#  name = "kandyba-flyiac"
#  org  = "personal"
#}

resource "fly_ip" "exampleIp" {
  app  = "kandyba-flyiac"
  type = "v4"
  #depends_on = [fly_app.exampleApp]
}

resource "fly_ip" "exampleIpv6" {
  app  = "kandyba-flyiac"
  type = "v6"
  #depends_on = [fly_app.exampleApp]
}

resource "fly_machine" "web" {
  app    = "kandyba-flyiac"
  region = var.fly_region
  name   = random_pet.name.id
  image  = "registry.fly.io/kandyba-flyiac"
  services = [
    {
      ports = [
        {
          port     = 443
          handlers = ["tls", "http"]
        },
        {
          port     = var.external_port
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : 80
    }
  ]
  cpus     = 1
  memorymb = 256
  env      = var.env_vars
  cmd = [
    "/bin/${var.interpreter}",
    "-c",
    join(
      " ",
      concat(
        ["service httpd start && chkconfig httpd on && echo"],
        slice(var.phrase, 0, var.word_count),
        ["> /var/www/html/tobe.$EXT"]
      )
    )
  ]
}
