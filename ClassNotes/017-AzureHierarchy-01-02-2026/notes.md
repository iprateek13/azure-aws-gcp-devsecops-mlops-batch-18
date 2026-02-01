## 📘 Azure Fundamentals – Comprehensive Notes (Based on Diagram)

### 1️⃣ What is an Azure Account?

An **Azure Account** is the starting point to use Microsoft Azure services.

* You log in using:

  * **Username**
  * **Password**
  * **OTP / MFA**
* Login URL: **portal.azure.com**
* Entry into Azure = **Authentication** 

💡 *Authentication = “Andar ghusna”*

---

### 2️⃣ Entra ID (Azure Active Directory)

Earlier called **Azure AD**, now **Microsoft Entra ID**.

* Automatically created when you create an Azure account
* Acts as the **identity system**
* Stores:

  * Users
  * Groups
  * Roles
  * Permissions
* Comes with **Free License** by default 

#### Example:

Allowed users:

* Bhakua Engineer
* Dhondhu
* Tondu
* Tinki

Login is validated using **username + password + OTP**.

---

### 3️⃣ Authentication vs Authorization (Very Important)

#### 🔐 Authentication

* Confirms **who you are**
* Example:

  * KGF gate security checking **Aadhaar / KYC**
* “Andar ghusna” 

#### 🔑 Authorization

* Confirms **what you are allowed to do**
* Example:

  * Which area inside KGF mine you can access:

    * Sector 1
    * Sector 2
    * Weapon Room 

---

### 4️⃣ Azure Hierarchy (Most Important Concept)

Azure follows a **hierarchical structure** for governance.

```
Management Group
   ↓
Subscription
   ↓
Resource Group
   ↓
Resources
```

This hierarchy helps manage:

* 🔐 Security
* 💰 Cost
* 📜 Governance & Compliance 

---

### 5️⃣ Management Group (MG)

* **Top-level container** in Azure
* Used to **group multiple subscriptions**
* Helps apply:

  * Policies
  * Role-based access (RBAC)
* A management group can have:

  * Multiple **child management groups** 

#### Tenant Root Group

* Created **automatically**
* Highest level management group
* Parent of all other management groups

---

### 6️⃣ Example Management Group Structure

```
Tenant Root Group
│
├── HR Management Group
│    ├── Recruitment Sub
│    │    └── Resource Groups
│
├── Sales Management Group
│    ├── Sales Subscription
│    ├── Ads Subscription
│
└── Dev / QA / UAT / Prod
```

* Each department gets **separate control**
* Easy cost tracking
* Strong security boundaries 

---

### 7️⃣ Subscription

* A **billing boundary**
* Contains:

  * Resource Groups
  * Azure services
* Example:

  * Rangoli Subscription
  * Sales Subscription
  * Ads Subscription 

💡 **Policies & budgets** are usually applied at subscription level.

---

### 8️⃣ Resource Group (RG)

* Logical container for Azure resources
* Resources inside RG:

  * VM
  * Storage
  * Database
  * Network
* RG helps in:

  * Easy deletion
  * Environment separation (dev/prod) 

---

### 9️⃣ Why This Hierarchy Exists?

Azure hierarchy is designed to:

* Maintain **security**
* Control **cost**
* Enforce **governance & compliance**
* Separate teams and environments 

---

### 🔟 Azure Free Tier & Meters

* Azure provides **free usage meters**
* Example:

  * Meter1: 100 units free
  * Meter2: 100 units free
  * Meter3: 100 units free 

⚠️ Warning:

> “Azure account banao, lekin credit card bigaadna mat” 😄

---

### 1️⃣1️⃣ Real-Life Analogy (KGF Example)

| Azure Concept    | KGF Analogy    |
| ---------------- | -------------- |
| Entra ID         | Aadhaar / KYC  |
| Authentication   | Entry gate     |
| Authorization    | Area access    |
| Management Group | Mine sections  |
| Subscription     | Land ownership |
| Resource Group   | Work area      |



---

### 1️⃣2️⃣ Career Roles You Can Mention on LinkedIn

* Cloud Migration & Transformation Architect
* Infrastructure Architect
* DevSecOps Architect
* FinOps Architect
* DevSecOps Specialist
* DevSecOps Consultant
* MLOps Engineer
* Build & Release Engineer
* Junior DevSecOps Engineer (Freshers)
* Network Engineer → Azure Cloud Engineer 

---

### 📌 Homework / Practice

* Create an Azure account
* Understand:

  * Entra ID
  * Management Group
  * Subscription
  * Resource Group
* Ask ChatGPT:

> “Explain Azure Management Group, Subscription and Resource Group hierarchy”

