# Sample repo for Null Provider with Count
See more information about [Null provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs) and [the count Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count).

# Prerequisite
Install and configure Terraform as per [official documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

# How To

## Clone the repository

```
git clone https://github.com/dmitryuchuvatov/null-count.git
```

## Go into the directory

```
cd null-count
```

## Initialize Terraform

```
terraform init
```
You should see the following output:

```
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.2.1...
- Installed hashicorp/null v3.2.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Run Terraform Apply

```
terraform apply
```
Enter **yes** and hit **Enter** to apply the changes:

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # null_resource.test[0] will be created
  + resource "null_resource" "test" {
      + id = (known after apply)
    }

  # null_resource.test[1] will be created
  + resource "null_resource" "test" {
      + id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.test[1]: Creating...
null_resource.test[0]: Creating...
null_resource.test[0]: Provisioning with 'local-exec'...
null_resource.test[1]: Provisioning with 'local-exec'...
null_resource.test[1] (local-exec): Executing: ["/bin/sh" "-c" "echo 'Test 1'"]
null_resource.test[0] (local-exec): Executing: ["/bin/sh" "-c" "echo 'Test 0'"]
null_resource.test[1] (local-exec): Test 1
null_resource.test[1]: Creation complete after 0s [id=7625613104316200228]
null_resource.test[0] (local-exec): Test 0
null_resource.test[0]: Creation complete after 0s [id=8144001649468814708]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## Clean Up

```
terraform destroy
```
Enter **yes** and hit **Enter** to destroy the resources:

```
null_resource.test[0]: Refreshing state... [id=8144001649468814708]
null_resource.test[1]: Refreshing state... [id=7625613104316200228]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.test[0] will be destroyed
  - resource "null_resource" "test" {
      - id = "8144001649468814708" -> null
    }

  # null_resource.test[1] will be destroyed
  - resource "null_resource" "test" {
      - id = "7625613104316200228" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.test[1]: Destroying... [id=7625613104316200228]
null_resource.test[0]: Destroying... [id=8144001649468814708]
null_resource.test[0]: Destruction complete after 0s
null_resource.test[1]: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```
