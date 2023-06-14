variable "fly_region" {
  description = "Machine region"
  type        = string
  default     = "ams"
}

variable "external_port" {
  description = "Port application listens on externally"
  type        = number
  default     = 80
}

variable "word_count" {
  description = "How many words to echo"
  type        = number
  default     = 6
}

variable "phrase" {
  description = "Phrase to echo"
  type        = list(string)
  default = [
    "To",
    "be,",
    "or",
    "not",
    "to",
    "be"
  ]
}

variable "env_vars" {
  description = "Environment variables"
  type        = map(string)
  default = {
    EXT = "html"
  }
}

variable "interpreter" {
  description = "Command interpreter"
  type        = string
  default     = "bash"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "some_db"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "db_root_password" {
  description = "Database root password"
  type        = string
  sensitive   = true
}
