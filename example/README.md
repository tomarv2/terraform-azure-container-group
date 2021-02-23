## module usage:

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_msi | Do you want to add MSI(Note: this is a feature flag) | `bool` | `false` | no |
| add\_resourcegroup | Do you want to add a new Resource Group(Note: this is a feature flag) | `bool` | `false` | no |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| cmd | n/a | `list` | `[]` | no |
| container\_port | n/a | `list` | <pre>[<br>  80<br>]</pre> | no |
| cpu\_allocation | n/a | `string` | `"0.5"` | no |
| docker\_image | n/a | `any` | n/a | yes |
| email | email address to be used for tagging (suggestion: use group email address) | `any` | n/a | yes |
| env\_variables | n/a | `any` | n/a | yes |
| ip\_address\_type | n/a | `string` | `"Public"` | no |
| mem\_allocation | n/a | `string` | `"1.0"` | no |
| mount\_path | VOLUME | `string` | `"/mnt"` | no |
| msi\_name | n/a | `any` | `null` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| probe\_cmd\_exec | READINESS & LIVENESS PROBE | `list` | <pre>[<br>  "cat",<br>  "/dev/null"<br>]</pre> | no |
| rg\_location | n/a | `string` | `"eastus"` | no |
| rg\_name | n/a | `any` | `null` | no |
| scopes | A list of scopes the role assignment applies to. | `any` | n/a | yes |
| subscription\_id | n/a | `any` | n/a | yes |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| containergroup\_fqdn | The FQDN of the created container group |
| containergroup\_id | The ID of the created container group |
| containergroup\_ip\_address | The IP address of the created container group |
| msi\_id | The MSI id |
| msi\_name | n/a |
| msi\_principal\_id | n/a |
| resourcegroup\_name | Resoure Group name |
