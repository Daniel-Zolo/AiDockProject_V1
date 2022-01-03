## Terraform and Kubernetes assignment for DevOps candidates

### Requirements:
- any Kubernetes environment, e.g. 
  - Docker Desktop with activated Kubernetes cluster (https://www.docker.com/products/docker-desktop)
  - minikube (https://minikube.sigs.k8s.io/docs/start/)
  - k3s/k3d (https://k3d.io/v5.2.2/)
  - kind - Kubernetes IN Docker (https://kind.sigs.k8s.io)
- access to Kubernetes configured in ~/.kube/config  (in case your path is different, please set it in the `providers.tf` accordingly)
- Terraform in any version >1.0 (https://www.terraform.io/downloads)
- Terraform documentation https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

### Story

You have been provided some Terraform manifests for Kubernetes resources that are supposed to mock a simple 3-tier application scenario. The setup is expected to create these resources:
- 3 namespaces (named after each application)
- 3 deployments (`stream-frontend, stream-backend, stream-database`)
- 3 network policies (one per namespace)

The provided Terraform code should work as-is, but is not using any method or function to avoid redundancy, so one goal is to identify the potential for optimization and improvement. You are not expected to completely replace everything (you can, of course, if you prefer to). Instead, we would like to see your approach to the tasks in general.

### Please go over the resource manifests `deployments.tf, network.tf, namespaces.tf` and the variable declarations in `variables.tf` to get an understanding of the scenario.

You can use the Terraform commands `init`, `validate` and `plan` directly without any provider configuration. If you want to `apply` the code, 
It is totally fine to use pseudo code or to describe your suggestions instead of creating real code, this is only about the basic understanding of a general approach to manage infrastructure in code. You can also use the official Hashicorp documentation from the link above. Feel free to change whatever you like and implement different methods or functions however you feel appropriate.  

#### 1. reduce variable count
The total number of declared variables can be reduced (hint: instead of using multiple declarations, all variables could be mapped into a single declaration)

#### 2. remove duplicate code
Whoever wrote this code did not follow the `DRY`* principle, most of the resource definitions are redundant. (hint: instead of using multiple resource definitions, multiple instances of the same resource type could be created by a single iteration).

#### 3. network acl
The backend developers have changed their framework and the exposed API service. What change would allow the frontend service to access the new API? (hint: it is all about numbers )

#### 4. resource management 
You were asked to make sure no application will consume too many resources like CPU and memory of the cluster. How would you implement this? (hint: Kubernetes provides a simple method to do this when dealing with pod definitions)

#### 5. scaling
Obviously, this setup does not scale well, as we only have a single instance per frontend and backend tier. How would you enable scaling up to multiple instances? (hint: a Kubernetes object type that is missing in this scenario might be helpful)

#### 6. multi-environment
We would like to deploy, run and maintain all services in different environments like `dev`, `test` and `production` where we can set parameters individually, depending on the requirements. What would you suggest to make this possible? (hint: we have the feeling that we need to do something about the variables here)
 

*`DRY` = "don't repeat yourself", which basically means that code should try to avoid duplications whenever possible. It is the opposite of `WET` coding, which probably means something like "write everything twice", "we enjoy typing" or "waste everyone's time".
