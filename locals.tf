locals {
   managed_policies = flatten([
    for permission in var.permissions_list : [
        for policy in permission.managed.policies : {
            permission_set_name =   permission.name
            policy_arn  = policy
        }
    ]
   ]) 

   managed_policy_arns = {
    for polocy in local.managed_policies :
    "${polic.permission_set_name}.${policy.policy_arn}" => policy
   }

    sso_instance_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
    identity_store_id = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]

account_groups  =   [
    for permission in var.permission_list:  [
        for account_group in setproduct(permission.aws_accounts, permission.sso_groups) : {
            permission_set_name     =   permission.name
            account                 =   account_group[0]
            group                   =   account_group[1]
        }
    ]
 ]
    account_group_assignments   = {
        for account_group in local.account_groups:
        "${account_group.permission_set_name}.${account_group.group}" => account_group
    }


    groups  =  distinct([for account_group in local.account_grooups : account_group.group])
}

