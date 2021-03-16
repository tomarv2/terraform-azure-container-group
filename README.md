<p align="center">
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-azure-role-assignment" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-role-assignment/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-role-assignment" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-role-assignment/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-azure-role-assignment" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to Azure Container Instance (ACI)

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest 
        <a href="https://github.com/tomarv2/terraform-azure-role-assignment/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-role-assignment" /></a>
  in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```  

- Update:
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud azure plan -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to deploy:
```
tf -cloud azure apply -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to destroy:
```
tf -cloud azure destroy -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - Using `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

##### ACI with MSI and Resource Group

```
module "aci" {
  source = "../"

  client_id         = var.client_id
  client_secret     = var.client_secret
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  add_msi           = true
  add_resourcegroup = true
  rg_name           = "demo-rg"
  docker_image      = "nginx"
  container_port    = "80"
  scopes            = "scopes"
  env_variables = {
    DEMO_ENV_VAR = "1"
  }
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aci\_depends\_on | n/a | `any` | `null` | no |
| add\_msi | Do you want to add MSI(Note: this is a feature flag) | `bool` | `false` | no |
| add\_resourcegroup | Do you want to add a new Resource Group(Note: this is a feature flag) | `bool` | `false` | no |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| cmd | n/a | `list` | `[]` | no |
| container\_port | n/a | `string` | `"443"` | no |
| container\_protocol | n/a | `string` | `"TCP"` | no |
| cpu\_allocation | n/a | `string` | `"0.5"` | no |
| docker\_image | n/a | `any` | n/a | yes |
| env\_variables | n/a | `any` | n/a | yes |
| failure\_threshold | n/a | `string` | `"5"` | no |
| identity\_type | n/a | `string` | `"UserAssigned"` | no |
| initial\_delay\_seconds | n/a | `string` | `"30"` | no |
| ip\_address\_type | n/a | `string` | `"Public"` | no |
| mem\_allocation | n/a | `string` | `"1.0"` | no |
| mount\_path | VOLUME | `string` | `"/mnt"` | no |
| msi\_name | n/a | `any` | `null` | no |
| num\_of\_containers | n/a | `number` | `1` | no |
| os\_type | n/a | `string` | `"Linux"` | no |
| period\_seconds | n/a | `string` | `"30"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| restart\_policy | n/a | `string` | `"OnFailure"` | no |
| rg\_location | n/a | `string` | `"eastus"` | no |
| rg\_name | n/a | `any` | n/a | yes |
| subscription\_id | n/a | `any` | n/a | yes |
| success\_threshold | n/a | `string` | `"3"` | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |
| timeout\_seconds | n/a | `string` | `"30"` | no |

## Outputs

| Name | Description |
|------|-------------|
| containergroup\_fqdn | The FQDN of the created container group |
| containergroup\_id | The ID of the created container group |
| containergroup\_ip\_address | The IP address of the created container group |
| msi\_id | The MSI id |
| resource\_group | Resoure Group name |
