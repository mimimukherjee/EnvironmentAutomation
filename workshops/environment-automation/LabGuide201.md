![](images/201/header201.png)  
Updated: 04/24/2018

## Introduction

In this Lab, you are provided with an already provisioned environment as shown in Lab 101.

  ![](images/201/1.png)

Leveraging this environment, you will configure applications to run in each of the 3 stacks.  

  ![](images/201/2.png)
  
**_To log issues_**, click here to go to the [github oracle](https://github.com/oracle/learning-library/issues/new) repository issue submission form.

## Objectives

- The terraform module in this lab will configure the following:
  
  * In the Liberty Insurance stack, a WebLogic JDBCS Connection Pool and Data Source is configured on the WebLogic server and the Liberty Insurance application is then deployed on the WebLogic server using the JDBC Data Source to retrieve and insert applicant information from the OCI database
  
  * In the SOACS stack, service bus project configuration is then imported into service bus.
  
  * In the JCS stack, the HHS application is deployed into the JCS.


## Required Artifacts

- No other Prerequisites are required for this lab other than the Prerequisites specified in Lab 101.

# Environment Provisioning

## Using Terraform to provision the required environment

### **STEP 1**: Login to Putty

- Start a new putty or ssh session to the workshop vm as shown below.

- Go to directory lab2 using the below command

### **STEP 2**: Title of Step 2

- Instructions for Step 2
