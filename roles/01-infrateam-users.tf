resource "azuread_group" "infra_group" {
  display_name = "CDLAPP-DHL-Parcel-NL-InfraTeam-Users"
  description  = "Usergroup for Infra Team Users"
  owners = [
    for owners in data.azuread_user.infra_admins : owners.object_id
  ]
  members = [
    for users in data.azuread_user.infra_admins : users.object_id
  ]
  prevent_duplicate_names = true
}

variable "infra_admins" {
  type = list(any)
  default = [
    "jpost@dhlp.io",
    "dglasbergen@dhlp.io"
    
  ]
}

# Query the Principal ID for each user in infra_admins
data "azuread_user" "infra_admins" {
  for_each            = toset(var.infra_admins)
  user_principal_name = format("%s", each.key)
}