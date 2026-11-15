# 🐘 PostgreSQL Database IaaS Setup on Azure VM, Networking & Data Ingestion

> **Session Date:** 15-11-2026  
> **Session Context:** Step 1 of deploying NextOps Industrial: Setting up PostgreSQL on Azure Linux VM (IaaS), Database fundamentals (Excel vs. RDBMS analogy), port networking (22 vs. 5432), remote GUI connection via pgAdmin/DBeaver, schema creation, enterprise ETL data ingestion pipelines, and automation strategy.  
> **Reference Diagram:** [`diagram.pdf`](file:///c:/DevOpsInsiders/Batch18/azure-aws-gcp-devsecops-mlops-batch-18/ClassNotes/105.PostgresIAASSetup-15-11-2026/diagram.pdf)

---

## 📌 Architectural Rule: Database First

> In every 3-tier application deployment, **the database tier must be provisioned and validated first**. Backend services cannot start or pass health checks without a reachable database, schema, and initialized data.

```
                    [ 1. Deploy Database Tier (IaaS / PaaS) ]
                                      |
                                      v
                    [ 2. Deploy Backend Business Logic Tier ]
                                      |
                                      v
                    [ 3. Deploy Frontend Presentation Tier ]
```

---

## 1. Database Hosting Options in Enterprise Architecture

When architects choose where to host relational databases like PostgreSQL, they evaluate four models:

```
+---------------------------------------------------------------------------------------------------+
| DATABASE HOSTING OPTIONS                                                                          |
+--------------------------+------------------------------------------------------------------------+
| Model                    | Details & Characteristics                                              |
+--------------------------+------------------------------------------------------------------------+
| 1. On-Premises VM        | Hosted inside corporate datacenter (VMware ESXi, Hyper-V, Nutanix).    |
| 2. Cloud IaaS (VM)       | Hosted on Azure VM / AWS EC2. Full OS access, custom tuning & storage. |
| 3. Cloud PaaS            | Azure Database for PostgreSQL Flexible Server, AWS RDS, GCP Cloud SQL. |
|                          | Managed backups, automated patching, built-in HA, no OS access.        |
| 4. Inside Kubernetes     | Containerized PostgreSQL using StatefulSets & CloudNativePG/CrunchyDB. |
+--------------------------+------------------------------------------------------------------------+
```

---

## 2. Database Fundamentals: The Microsoft Excel vs. PostgreSQL Analogy

To understand relational database concepts without unnecessary complexity, compare PostgreSQL to Microsoft Excel:

```
+-----------------------------------+------------------------------------------------------------------+
| Microsoft Excel                   | PostgreSQL Database Server                                       |
+-----------------------------------+------------------------------------------------------------------+
| Excel Desktop Application (.exe)  | PostgreSQL Server Daemon (Background service listening on 5432)  |
| Workbook 1, Workbook 2            | Database 1, Database 2 (e.g., nextopsdb, postgres)               |
| Sheet 1, Sheet 2                  | Table 1, Table 2 (organized under Schemas)                       |
| Rows and Columns                  | Rows (Records / Tuples) and Columns (Typed Fields / Attributes)  |
| Manual Cell Editing & Mouse Clicks| Executed strictly via SQL Queries (DDL & DML)                    |
+-----------------------------------+------------------------------------------------------------------+
```

> 💡 **Core Insight:** In Microsoft Excel, you manually click and type into cells. In a production PostgreSQL server, every administrative action, table creation, and data modification is performed by executing **SQL (Structured Query Language)** commands.

---

## 3. Network Architecture & Port Fundamentals

```
+---------------------------------------------------------------------------------------------------+
| Virtual Network: vnet-nextops-industrial (10.124.0.0/16)                                          |
|                                                                                                   |
|  +-------------------------------------------------------+                                        |
|  | Subnet: Frontend Subnet (10.124.1.0/24)               |                                        |
|  | (Reserved for nextops-dashboard Web UI)               |                                        |
|  +-------------------------------------------------------+                                        |
|                                                                                                   |
|  +-------------------------------------------------------+                                        |
|  | Subnet: Backend Subnet (10.124.2.0/24)                |                                        |
|  | (Reserved for nextops-query-service Backend API)       |                                        |
|  +-------------------------------------------------------+                                        |
|                                                                                                   |
|  +-------------------------------------------------------+                                        |
|  | Subnet: Database Subnet (10.124.3.0/24)                |                                        |
|  |                                                       |                                        |
|  |   +-----------------------------------------------+   |                                        |
|  |   | Virtual Machine: postgresql-db-vm             |   |                                        |
|  |   | Public IP:  40.80.93.190                      |   |                                        |
|  |   | Private IP: 10.124.3.4                        |   |                                        |
|  |   |                                               |   |                                        |
|  |   |   [ Port 22: OpenSSH Server ] <---------------+---|--- Management (SSH Terminal / CLI)     |
|  |   |                                               |   |                                        |
|  |   |   [ Port 5432: PostgreSQL Server ] <----------+---|--- Client Queries (pgAdmin / DBeaver)  |
|  |   +-----------------------------------------------+   |                                        |
|  +-------------------------------------------------------+                                        |
+---------------------------------------------------------------------------------------------------+
```

### Port Distinction:
* **Port 22 (SSH):** Used by system administrators and DevOps engineers to manage the underlying Ubuntu Linux operating system.
* **Port 5432 (PostgreSQL):** Used by database clients, backend applications, and DBAs to execute SQL queries and transfer data.
* **Security & Hardening:** Production database VMs should use **CIS Hardened Images** and restrict Port 22 and Port 5432 to internal subnets or Azure Bastion.

---

## 4. The 7-Step Hands-On PostgreSQL IaaS Setup Guide

Follow these steps to deploy and configure the PostgreSQL database server:

```
[ Step 1: Create Resource Group ]
         |
         v
[ Step 2: Create VNet & Subnets (Frontend, Backend, Database) ]
         |
         v
[ Step 3: Launch Ubuntu Linux VM in Database Subnet ]
         |
         v
[ Step 4: SSH into VM via Port 22 ]
         |
         v
[ Step 5: Install & Configure PostgreSQL Server (Set Password, Listen Addresses, pg_hba.conf) ]
         |
         v
[ Step 6: Connect from Local Laptop via GUI Tool (pgAdmin 4 / DBeaver) ]
         |
         v
[ Step 7: Create Database `nextopsdb` & Execute DDL Table Queries from Developer Repo ]
```

### Command Walkthrough:

#### 1. SSH into the Ubuntu VM
```bash
ssh azureuser@40.80.93.190
```

#### 2. Install PostgreSQL Server
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib -y

# Verify service is running
sudo systemctl status postgresql
```

#### 3. Set Master `postgres` User Password
```bash
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'Strong123';"
```

#### 4. Configure Remote Access (`postgresql.conf` and `pg_hba.conf`)
By default, PostgreSQL only listens on `localhost` (`127.0.0.1`). To allow remote connections from backend services and GUI tools:

```bash
# Edit postgresql.conf to listen on all network interfaces
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/*/main/postgresql.conf

# Edit pg_hba.conf to allow md5/scram password authentication
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf

# Restart PostgreSQL to apply changes
sudo systemctl restart postgresql
```

#### 5. Connect via GUI (pgAdmin 4 or DBeaver)
* **Host name / Address:** `40.80.93.190`
* **Port:** `5432`
* **Maintenance Database:** `postgres`
* **Username:** `postgres`
* **Password:** `Strong123`

#### 6. Create Database & Apply Schemas
* In pgAdmin, create database: `nextopsdb`.
* Open Query Tool and execute table creation DDL scripts from:
  [`https://github.com/devopsinsiders/nextops-database`](https://github.com/devopsinsiders/nextops-database)

---

## 5. Enterprise Data Ingestion & ETL Pipelines

In real-world enterprise architectures, data does not arrive manually—it flows through automated ETL (Extract, Transform, Load) pipelines:

```
+---------------------------------------------------------------------------------------------------+
| ENTERPRISE DATA INGESTION LIFECYCLE (MEDALLION ARCHITECTURE)                                      |
+---------------------------------------------------------------------------------------------------+
|                                                                                                   |
|  [ Data Sources ] (JSON APIs, CSVs, Sensor Streams, External ERP / SQL DBs)                      |
|         |                                                                                         |
|         v                                                                                         |
|  [ Bronze Layer (Raw Ingestion) ]                                                                 |
|    - Unprocessed raw telemetry ingested in real-time or batch                                     |
|         |                                                                                         |
|         v                                                                                         |
|  [ Silver Layer (Data Quality & Transformation) ]                                                 |
|    - Validation, deduplication, schema validation, anomaly filtering                             |
|    - Technologies: Azure Data Factory (ADF), Azure Databricks, Apache Airflow, PySpark            |
|         |                                                                                         |
|         v                                                                                         |
|  [ Gold Layer (Target Production Database) ]                                                      |
|    - Cleaned, validated, structured data loaded into PostgreSQL (`nextopsdb`) & Data Warehouses   |
+---------------------------------------------------------------------------------------------------+
```

---

## 6. Database Setup Automation Strategy

In upcoming sessions, this manual process will be replaced with complete Infrastructure as Code (IaC) and Configuration Automation:

```
[ Step 1: Infrastructure Provisioning ]
  - Terraform code provisions Azure Resource Group, VNet, Subnet, NSG (Ports 22 & 5432), and VM.
      |
      v
[ Step 2: Configuration Management & Automation ]
  - Ansible Playbook / Cloud-Init script automatically installs PostgreSQL, configures auth, and creates users.
      |
      v
[ Step 3: CI/CD Pipeline Execution ]
  - Azure DevOps pipeline runs database migration scripts (.sql) directly against `nextopsdb`.
```

---

## 💡 Key Architectural Takeaways

1. **Port Isolation:** Never expose port 5432 to `0.0.0.0/0` in production environments. Restrict NSG inbound security rules strictly to the `Backend Subnet` and authorized admin bastion hosts.
2. **Two Files Dictate PostgreSQL Remote Networking:** `postgresql.conf` (controls which IP interfaces PostgreSQL binds to) and `pg_hba.conf` (controls who can authenticate, from where, and using what method).
3. **Repository Reference:** All database schemas, seed data, and table creation scripts for the NextOps Industrial application are maintained at:
   [`https://github.com/devopsinsiders/nextops-database`](https://github.com/devopsinsiders/nextops-database)
