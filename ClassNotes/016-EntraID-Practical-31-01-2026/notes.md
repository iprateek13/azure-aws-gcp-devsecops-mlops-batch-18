# 🌩️ Cloud & Azure Fundamentals – Diagram Notes

## 1️⃣ What is Cloud?

Cloud means using **someone else’s computer (server)** over the internet instead of buying and maintaining your own.

* No upfront hardware cost
* Pay only for what you use
* Accessible from anywhere

👉 Example: Azure, AWS, GCP

---

## 2️⃣ Azure Account & Entry Point

### 🔹 Azure Portal

* Azure’s official website (dashboard):

```
https://portal.azure.com
```

* This is where **everything is created & managed**:

  * VMs
  * Databases
  * Storage
  * Networking
  * Security

### 🔹 Account Creation

* First step: create an Azure account
* Once account is created:

  * **Microsoft Entra ID (Azure Active Directory)** is created automatically
  * A **Subscription** is also created

---

## 3️⃣ Microsoft Entra ID (Azure Active Directory)

### 🛡️ Guard Room Concept

Think of **Entra ID as the Guard Room** of a secured area (KGF example):

| Real World        | Azure Term          |
| ----------------- | ------------------- |
| Guard Room        | Entra ID            |
| Guard Room Number | Tenant ID           |
| Aadhaar / ID      | Username & Password |
| Entry Check       | Authentication      |
| Area Access       | Authorization       |

---

### 🔹 Tenant ID

* Unique ID of Entra ID
* Identifies **your organization**
* Example:

```
0f7010fd-209e-4344-8457-043ffb37143b
```

➡️ **Entra ID ki ID = Tenant ID**

---

## 4️⃣ Authentication vs Authorization

### ✅ Authentication (Who are you?)

* Identity verification
* Example:

  * Aadhaar check
  * Username + Password
  * OTP / MFA

👉 *“Tum andar aa sakte ho ya nahi?”*

---

### ✅ Authorization (What can you access?)

* Decides **permission level**
* Example:

  * Sector 1 allowed
  * Weapon room not allowed

👉 *“Andar aa gaye, par kaha tak ja sakte ho?”*

---

## 5️⃣ Users in Entra ID

### 🔹 Example Users

* Ravi Sharma → Global Admin
* Bhakua Engineer
* Sonam Bewafaa

Each user has:

* Email ID
* Role
* Permissions

Example login flow:

```
https://login.microsoftonline.com/
→ Token Generated
→ Access portal.azure.com
```

---

## 6️⃣ Token-Based Access

### 🔐 What is a Token?

* Temporary proof of authentication
* Generated after successful login
* Used to access Azure services securely

Flow:

```
User → login.microsoftonline.com
→ Token issued
→ portal.azure.com
```

Without token ❌ no access.

---

## 7️⃣ Subscription (KGF Zameen Example)

### 🏞️ Subscription = Zameen (Land)

* Logical billing container
* All resources live inside a subscription
* Example:

  * ₹14,000 free credits (trial)

Hierarchy:

```
Azure Account
 └── Entra ID (Tenant)
     └── Subscription
         └── Resources
```

---

## 8️⃣ Resources & Resource Access

Examples of resources:

* Virtual Machines
* Storage Accounts
* Databases
* Networking

Access depends on:

* Role
* Group
* Subscription permissions

---

## 9️⃣ Groups (Important Rule ⚠️)

❌ **Never assign permissions directly to users**

✅ **Best Practice**:

```
User → Group → Role → Resource
```

Reason:

* Easy management
* Better security
* Scalable

---

## 🔟 Cost & Security – Golden Rule 🏆

> 🌍 **Duniya me do hi cheezein important hai:**

### 💰 Cost

### 🔐 Security

* Meter-based billing
* Free tier available
* Track usage carefully

---

## 1️⃣1️⃣ Meter & Free Tier Concept

### 🔹 Meter

* Measures usage
* Example:

  * 100 units free
  * After that → chargeable

Examples:

* Meter1 – 100 units free
* Meter2 – 100 units free
* Meter3 – 100 units free

---

## 1️⃣2️⃣ Cloud 1-Tier Architecture (Basic)

* Single tier application
* Everything hosted on cloud
* Example:

  * One VM
  * One storage
  * One application

Used for:

* Learning
* Small demos
* Proof of concept

---

## 1️⃣3️⃣ Real-Life Analogy Summary (KGF Model)

| KGF Example   | Azure             |
| ------------- | ----------------- |
| Gate          | Azure Login       |
| Guard Room    | Entra ID          |
| Guard Number  | Tenant ID         |
| ID Card       | Credentials       |
| Zameen        | Subscription      |
| Sector Access | Authorization     |
| Chor          | Unauthorized User |

---

## ✅ Final Summary

* Azure starts with **Account**
* Entra ID handles **identity & security**
* Subscription handles **billing**
* Authentication = entry
* Authorization = access control
* Cost & Security are top priorities
* Always use **Groups**, not direct users
