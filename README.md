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

You can use the Terraform commands `init`, `validate` and `plan` directly without any provider configuration. If you want to `apply` the code, the `providers.tf` file is required and should have the correct value for the `config_path` attribute to point to your local `KUBECONFIG`.
It is totally fine to use pseudo code or to describe your suggestions instead of creating real code, this is only about the basic understanding of a general approach to manage infrastructure in code. You can also use the official Hashicorp documentation from the link above. Feel free to change whatever you like and implement different methods or functions however you feel appropriate.  

#### 1. reduce variable count
The total number of declared variables has grown a bit. We think that it should be reduced to make it easier to maintain. How would you do this? (hint: instead of using multiple declarations, we might just have one)

#### 2. remove duplicate code
Whoever wrote this code did not follow the `DRY`* principle, most of the resource definitions are redundant. (hint: instead of using multiple resource definitions, multiple instances of the same resource type could be created by a single iteration).

#### 3. change network acl
The backend developers have changed their framework and the exposed API service port. What change would allow the frontend service to access the new API? (hint: it is all about numbers )

#### 4. implement resource management 
You were asked to make sure no application will consume too many resources like CPU and memory of the cluster. How would you implement this? (hint: Kubernetes provides a simple method to do this when dealing with pod definitions)

#### 5. make scaling possible
Obviously, this setup does not scale well, as we only have a single instance per frontend and backend tier. How would you enable scaling up to multiple instances? (hint: a Kubernetes object type that is missing in this scenario might be helpful)

#### 6. prepare for multi-environment
We would like to deploy, run and maintain all services in different environments like `dev`, `test` and `production` where we can set parameters individually, depending on the requirements. What would you suggest to make this possible? (hint: we have a fuzzy feeling that we need to do something about the variables here)

#### 7. add environment variable to service
Let's assume, we want to add a specific variable with a random sensitive value for all services, it could be a new database password. How would you implement this? (hint: there are potentially lots of possibilities, but can we do this using the existing setup with Kubernetes and Terraform only?)


#### Please provide your solutions, comments and corrections in code (you can use any language or framework of your preference if you don't want to use Terraform HCL). Answers and solutions in text form can also be inserted or added to this document or another text file.

*`DRY` = "don't repeat yourself", which basically means that code should try to avoid duplications whenever possible. It is the opposite of `WET` coding, which probably means something like "write everything twice", "we enjoy typing" or "waste everyone's time".
