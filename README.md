## Terraform code refactoring task

### Please go over the resource manifest in `main.tf` and the variable declarations in `variables.tf` and try to improve code quality.

You can use the Terraform commands `init` and `validate` directly without any provider credentials. Your environment should hold some AWS credentials if you also want to do a `plan` or `apply`. In this case, you will be provided with credentials to do `aws configure`.

It is totally fine to use pseudo code or to describe your suggestions instead of creating real code, this is only about the basic understanding of a generic approach to manage infrastructure in code. You can also use the official documentation at https://registry.terraform.io/providers/hashicorp/aws/latest/docs

total time estimation: 30 - 60 minutes (depending on experience)

#### 1. reduce the total number of declared variables
(hint: instead of using multiple declarations, all variables could be mapped into a single declaration)


#### 2. replace duplicate resource definitions with `DRY`* code
(hint: instead of using multiple resource definitions, multiple instances of the same resource type could be created by a single iteration)


OPTIONAL:<p>
#### 3. the `description` argument is only referencing one key-value pair of the `tags` variable map. try to add the second key-value pair to the argument by using formatting functions. The result could be in the format `"key=value, key=value"` or simply just `"value, value"`

there are really a lot of ways, to do this. It is just important to think of possibilities to look up values.


#### 4. would it be a problem, if we wanted to separate environments by using multiple AWS accounts? If yes, how would you deal with that?


`*DRY` = don't repeat yourself, which just means that code should try to avoid duplications as far as possible
