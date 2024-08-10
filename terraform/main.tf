/*
 * Copyright 2017 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Terraform main configuration file (with provider definitions).
 */

terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "4.10.0"
      }
      google = {
          source = "hashicorp/google"
            version = "4.18.0"
      }
  }
}

provider "google" {

  credentials = file(var.gcp_credentials_file_path)

  # Should be able to parse project from credentials file but cannot.
  # Cannot convert string to map and cannot interpolate within variables.
  project = var.gcp_project_id

  region = var.gcp_region
}

provider "aws" {

  shared_credentials_files = [pathexpand(var.aws_credentials_file_path)]

  region = var.aws_region
}