# devopsChallenge

This project configuration must be separated into three parts, each one with its git repository
- Terraform configuration 
- Application configuration, including HELM Charts
- Application, including source code and Dockerfile

## Terraform EKS
- I define Modules for abstract components, like EKS Cluster and IAM Roles; this would allow us to create as many environments as we need.
- By defining VPC and subnets as variables, we allow you to choose the best strategy for separating environments.
- Target VPC and subnet for each environment are defined as local variables instead of input variables; this has the objective of controlling the destination for staging and production environments
- I included the Calico Provider installation to enable the use of network policies and enhance app security.

## HELM Charts
- My application has two components: an API and a DB microservice. Because they are closely related, I defined an Umbrella Chart to manage global variables easily.
- Each component has its child Chart, allowing me to update each independently.
- The DB service is of type ClusterIP, which will achieve the requirement that the DB should not be accessible from outside.
- Additionally, I included a Network policy to protect access to the DB, allowing access only from the API microservice
