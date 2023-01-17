## Terraform and Kubernetes assignment for DevOps candidates DANIEL ZOLO EXPLAININGS!!

#### 1. reduce variable count
I've been asked to reduce the var count so i've made the whole 3 apps to loop around 1 var called "apps" with a for_each loop and make the code alot shorter and easier to understand.

#### 2. remove duplicate code
Whoever wrote this code did not had time to understand that duplicates could brake the code. 
while i was looping i've notice alot of the same code but in different writing such as in network it used to be really messy but i fixed it with the loops (basically rewrote the whole script)

#### 3. change network acl
I've made a loadBalancer that will redirect the incoming traffic to from port 80 to target_port 8080

#### 4. implement resource management 
 i've added in the deployment section resource that will reduce the cpu and memory usage to  limit cpu = "500m" and memory = "512Mi"

#### 5. make scaling possible
Obviously, scaling wasent avaliable in this code so i've created 3 replicas of the code and active ReplicaSet on the deployment

#### 6. prepare for multi-environment
I've made 3 workspaces for DEV/TEST/PROD and pushed the variables to the workspace so they could make individual changes 

#### 7. add environment variable to service
I've made a random_password resource and implant it on deployment under template container 

for any questions i would be more then happy to discuss about what was my POV on the code and what i tried to achive by the parameters i've recieved :)
thank you very much for this project it was really fun doing it and learning alot of new services while troubleshooting alot of docker and kubernetes services aswell.
