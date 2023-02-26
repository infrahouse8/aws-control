provider "aws" {
  profile = "infrahouse8"
  region  = "us-west-1"
}

provider "aws" {
  profile = "infrahouse8"
  region  = "us-west-1"
  alias   = "uw1"
}

provider "aws" {
  profile = "infrahouse8"
  region  = "us-west-2"
  alias   = "uw2"
}
