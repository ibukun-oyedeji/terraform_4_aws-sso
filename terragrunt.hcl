terraform {
    source  = "."

}

input = {
    permissions_list = [
        {
            name                = "AdministratorAccess"
            description         = "AdministratorAccess"
            managed_policies    = []
            aws_accounts        = []
            sso_grounps         = []
        },
        {
           name                 = "ViewOnlyAccess"
            description         = "ViewOnlyAccess"
            managed_policies    = []
            aws_accounts        = []
            sso_grounps         = []  
        }
    ]

}

 