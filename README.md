**Three-Tier AWS Architecture with Terraform**

This project demonstrates the deployment of a production-grade Three-Tier Web Application Architecture on AWS using 100% Infrastructure as Code (IaC) with Terraform.

The architecture includes:
 - Public Tier → Load Balancer
 - Private Application Tier → Auto Scaling EC2 Instances
 - Private Database Tier → Amazon RDS MySQL
 - VPC with 6 Subnets, NAT Gateways, Route Tables, and strict IAM + SG rules

The entire environment can be deployed or destroyed in under 5 minutes using Terraform.


**What This Project Deploys**

1️⃣ Custom VPC (CIDR: 192.168.0.0/16 Example)
 - 2× Public Subnets
 - 2× Private App Subnets
 - 2× Private DB Subnets
 - Route Tables, NAT Gateways, IGW — all fully automated

2️⃣ Auto Scaling EC2 Tier
 - Launch Template with user data
 - Installs Apache + index.html
 - Auto scales based on CPU
 - Private subnets only
 - Security group restricts SSH & ALB access

3️⃣ Application Load Balancer (ALB)
 - Public entry point
 - Health checks
 - Targets the EC2 ASG
 - Distributes traffic evenly

4️⃣ Amazon RDS MySQL
 - Private subnets
 - No public access
 - SG allows traffic only from EC2 app tier
 - Terraform outputs DB endpoint

**⚙️ How to Deploy (Step-by-Step)**
1. Clone the repo
<img width="488" height="74" alt="image" src="https://github.com/user-attachments/assets/306890fc-5212-4149-b1d4-63126f278a4a" />

2. Initialize Terraform
<img width="487" height="57" alt="image" src="https://github.com/user-attachments/assets/be6c8017-6a4a-47cf-a309-7bfea1c4b5ce" />

3. Validate
<img width="486" height="57" alt="image" src="https://github.com/user-attachments/assets/b0a08845-3584-422f-bb55-aab9f98916d4" />

4. Preview changes
<img width="488" height="55" alt="image" src="https://github.com/user-attachments/assets/00e249c9-bb0b-4892-af8a-d3768592055f" />

5. Deploy
<img width="485" height="63" alt="image" src="https://github.com/user-attachments/assets/90a9c99f-4625-4055-b85e-0eba3d08d348" />

6. Get the ALB DNS Name (option for any necessary use)
<img width="485" height="56" alt="image" src="https://github.com/user-attachments/assets/02ab2305-faa5-41d4-9d74-47899970bfe8" />


**🧪 Testing Auto Scaling**
You can manually trigger scaling by putting load on the EC2 instances.
1. SSH into instance
<img width="483" height="60" alt="image" src="https://github.com/user-attachments/assets/c8961362-4b92-4daa-b660-0adf9bdcb692" />


2. Trigger high CPU load
<img width="489" height="54" alt="image" src="https://github.com/user-attachments/assets/2ae384cc-33c5-452f-b8e9-724462a4291c" />

**Expected Results**
 - CPU hits 90%+
 - Auto Scaling Group automatically launches new EC2 instances
 - ALB forwards traffic to new instances
 - Scaling-in happens after cooldown when load drops

**Screenshots**

VPC
<img width="1649" height="820" alt="image" src="https://github.com/user-attachments/assets/52ffafa6-5e11-4424-aaea-bef936bc5666" />


Subnets
<img width="1909" height="583" alt="image" src="https://github.com/user-attachments/assets/0f16c6ba-f189-48e2-9525-fca746c3c7ee" />


Route Tables
<img width="1679" height="771" alt="image" src="https://github.com/user-attachments/assets/e8dfb046-a3cf-47e5-a41f-74dacadaa988" />


NAT Gateways
<img width="1690" height="602" alt="image" src="https://github.com/user-attachments/assets/f7cba291-996c-4c47-8163-e0e86ff99df6" />


Internet Gateway
<img width="1691" height="262" alt="image" src="https://github.com/user-attachments/assets/0ce746b0-a43f-42a5-be3d-38ee9be9657c" />


Auto Scaling Group
<img width="1668" height="827" alt="image" src="https://github.com/user-attachments/assets/8be5b99c-dbe4-441f-964a-c7da6f68ec9f" />


Launch Template
<img width="1688" height="789" alt="image" src="https://github.com/user-attachments/assets/98c6c99f-b321-4e5d-b6ef-124adefad8df" />


Application Load Balancer
<img width="1420" height="773" alt="image" src="https://github.com/user-attachments/assets/78155a34-9896-40fd-8242-98e0751c330e" />


Target Group Health Checks
<img width="1374" height="313" alt="image" src="https://github.com/user-attachments/assets/09f04a74-2add-4816-9382-c9148147b0ec" />

EC2 Instances + Scaling events (Max number of instances after 90% CPU usage)
<img width="1703" height="491" alt="image" src="https://github.com/user-attachments/assets/93eeab98-14d7-48cb-8126-0316ccf4f79e" />


RDS Dashboard
<img width="1788" height="713" alt="image" src="https://github.com/user-attachments/assets/2fab26f0-8c02-4c27-ae2b-1518c3f0b954" />


**🧹 Destroy Resources**
Avoid charges by cleaning up:
<img width="484" height="62" alt="image" src="https://github.com/user-attachments/assets/e2cb3122-6af2-4992-abc4-8a50dad1effb" />



**Conclusion** 
This project was designed to simulate a real production AWS environment using Terraform.
It demonstrates skills in:
 ✔ Infrastructure-as-Code
 ✔ AWS Cloud Architecture
 ✔ Networking
 ✔ Automation
 ✔ Scaling & Load Balancing
 ✔ Multi-tier system design



