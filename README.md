## Custom VM
is example

## Usage 
~~~
module "custom_vm_module" {
  source ="git@gitlab.com:faisal2.0/infrastructure-module/custom-vm-module.git"

  region = asia-southeast1
  project_services = ["cloudresourcemanager.googleapis.com", "compute.googleapis.com"]
  project_id = <Your project id>
}
~~~

## tutorial
https://www.youtube.com/watch?v=POM73N3Vgw0&list=PLCo2qyjyBlAS29BP4RdkaH7suCeGnRhcg&index=5