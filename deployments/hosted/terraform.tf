terraform {
  required_providers {
    xenorchestra = {
      source  = "terra-farm/xenorchestra"
      version = "~> 0.24.0"
    }
  }

  backend "pg" {
    config = {
      schema_name = "hosted"
    }
  }
}
