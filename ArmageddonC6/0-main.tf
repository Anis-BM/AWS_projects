provider "aws" {
  region = "ap-northeast-1" # Tokyo
  alias  = "Tokyo"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1" # New York
  alias  = "New_York"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "eu-west-2" # London
  alias  = "London"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "sa-east-1" # Sao Paulo
  alias  = "Sao_Paulo"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2" # Australia
  alias  = "Australia"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "ap-east-1" # Hong Kong
  alias  = "Hong_Kong"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}

provider "aws" {
  region = "us-west-1" # California
  alias  = "California"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "BlackMuslim"
      Created     = "Terraform"
    }
  }
}
