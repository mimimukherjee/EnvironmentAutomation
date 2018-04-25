![](images/101/header101.png)  
Updated: Date

## Introduction

Introductory Text

**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- Objective 1
- Objective 2

## Required Artifacts

- List of Prerequisites

# Main Heading 1

## Sub Heading 1

### **STEP 1**: Title of Step 1

- Instructions for Step 1

### **STEP 2**: Title of Step 2

- To Review the terraform plan to see all the resources terraform will provision in this lab, first initialize the terraform providers and modules needed and then generate the terraform plan and review the resources that terraform will create. In this lab, terraform will create a total of 21 resources. Type the below commands to verify the plan as shown in below screenshots.

  `terraform init`
  
  `terraform plan -out plan.out`
  
  ![](images/101/18.png)
  
  ![](images/101/19.png)
  
  ![](images/101/20.png)
  
  ![](images/101/22.png)
  
  ![](images/101/23.png)
  
  ![](images/101/24.png)
  
  ![](images/101/25.png)
  
  ![](images/101/26.png)
  
  ![](images/101/27.png)
  
### **STEP 3**: Provisioning Resources

- Now to provision the environment and all the resources, run the following command as shown in the screenshots.

  `terraform apply "plan.out"`
  
  ![](images/101/28.png)
  
  ![](images/101/29.png)
  
  ![](images/101/30.png)
  
  ![](images/101/31.png)
  
  ![](images/101/32.png)
  
  ![](images/101/33.png)
  
  ![](images/101/34.png)
  
  ![](images/101/35.png)
  
  ![](images/101/36.png)
  
  ![](images/101/37.png)
  
  ![](images/101/38.png)
  
  ![](images/101/39.png)
  
  ![](images/101/40.png)
  
  ![](images/101/41.png)
  
  ![](images/101/42.png)
  
  ![](images/101/43.png)
  
  ![](images/101/43ab.png)
  
- Terraform is now running.  YOU HAVE SUCCESSFULLY COMPLETED LAB1.  This may take several hours to complete.  DO NOT WAIT FOR this to complete.  We will continue to Lab2. 

- You can login to OCI Console to see that VCN and all the network resource and a compute instance has already been created.  Other resources such as OCI DB System, JCS and SOACS are still being provisioned.  When terraform completes, you will see the following.  Please do not wait for this to complete.

  ![](images/101/99.png)

  
  
  
  
  
  
