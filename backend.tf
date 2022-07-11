terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "ibk"

        workspaces {
            prefix = "ps-sso-"
        }
    }

}