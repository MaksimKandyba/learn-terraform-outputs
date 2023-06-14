output "cpus" {
  value = fly_machine.web.cpus
}

output "cputype" {
  value = fly_machine.web.cputype
}

output "memorymb" {
  value = fly_machine.web.memorymb
}

output "db_cpus" {
  value = fly_machine.db.cpus
}

output "db_cputype" {
  value = fly_machine.db.cputype
}

output "db_memorymb" {
  value = fly_machine.db.memorymb
}

output "db_volume_size_gb" {
  value = fly_volume.databaseVolume.size
}

output "db_connect_string" {
  description = "MySQL database connection string"
  value = join(" ",
    [
      "Server=${fly_app.databaseApp.name}.internal;",
      "Database=${var.db_name};",
      "Uid=${var.db_username};",
      "Pwd=${var.db_password};"
    ]
  )
  sensitive = true
}

output "lap_url" {
  description = "URL of Linux Apache PHP"
  value       = "https://${fly_machine.web.app}.fly.dev/"
}
