# 📘 Batch 18 – Onboarding, Azure RBAC & DevOps Foundations

### Comprehensive Notes

---

## 1️⃣ Batch 18 Registration & Timeline

* **Batch 18 registration is closing tomorrow at midnight**.
* Students must complete **initial formalities and onboarding steps** before proceeding further.
* **Mid Break (Holiday)** announced for tomorrow.
* All participants are required to **fill the shared form** during this break.

---

## 2️⃣ Group Formation & Leadership Model

* Participants will be divided into **multiple groups**.
* **Each group will have one assigned Lead**.
* ✨ **Special initiative:**

  * **Girls will lead the groups this time**, promoting leadership and inclusivity.
* Group-based work is mandatory for assignments, Azure access, and collaboration.

---

## 3️⃣ Onboarding Process Overview

### 🔐 Access & Meetings

* A **Private Google Meet** will be created.
* Access will be provided **only via registered Gmail IDs**.
* Once everyone is onboarded:

  * ❌ **YouTube recordings will stop**
  * ✅ Sessions will move fully to **private meetings**

### ⏳ Onboarding Duration

* Complete onboarding (accounts, access, groups, setup) will take **15–25 days**.
* During this phase:

  * Focus is on **classes + assignments**
  * No pressure regarding payments

---

## 4️⃣ Fee Collection Policy

* **Fees will be collected only after initial setup**
* There is **no urgency for payment right now**
* Priority order:

  1. Learning
  2. Assignments
  3. Hands-on practice
  4. Fee collection (later)

---

## 5️⃣ Roles & Characters (Conceptual Users)

The PDF uses **fictional names** to explain Azure role-based access clearly.

### 👤 Key Personas

| Name           | Role                            |
| -------------- | ------------------------------- |
| **Bhakua**     | Product Owner, Future Architect |
| **Mr. Bill**   | Contributor                     |
| **Mr. Billu**  | Architect                       |
| **Mr. Tillu**  | Manager                         |
| **Mr. Lillu**  | Architect 2                     |
| **Mr. Killu**  | DevOps Engineer                 |
| **Mr. Pillu**  | Intern                          |
| **Mr. Rillu**  | Intern                          |
| **Mr. Dhillu** | Lead                            |

---

## 6️⃣ Azure Tenant & Subscription Structure

### 🌐 Azure Hierarchy

1. **Tenant Root Group**
2. **Subscription** (example: `dhondhu-subscription`)
3. **Resource Groups**

   * `rg-dev`
   * `rg-qa`
   * `rg-uat`
   * `rg-prod`

---

## 7️⃣ Azure Entra ID (Azure AD) & Identity Management

### 🔑 Entra ID Concepts

* **Entra ID** is used for:

  * User management
  * Group management
  * Role-Based Access Control (RBAC)

### 🔐 Global Administrator

* **Bhakua** is assigned:

  * **Global Administrator**
  * **Subscription Owner**
* This role is **extremely powerful** and should be assigned to **very few people only**.

---

## 8️⃣ Group-Based RBAC (Very Important 🔥)

### 🚫 What NOT to Do

* ❌ **Do NOT assign Owner role to individuals**
* ❌ Avoid direct role assignments to users

### ✅ What TO Do

* ✅ **Use Group-Based RBAC**
* ✅ Assign roles to **Entra ID Security Groups**
* ✅ Add users to groups, not roles

---

### 🔐 Example: Proper RBAC Design

* Create a **Security Group**:

  * `rg-dev-contributors`
* Assign **Contributor role** to this group on:

  * `rg-dev`
* Add users (DevOps, Architects, Interns) into this group

➡️ Result:
Users inherit access automatically and securely.

---

## 9️⃣ Principle of Least Privilege (POLP)

* Every user should have **minimum required permissions**
* Example:

  * Intern → Contributor
  * Reader → Read-only access
* **Never over-assign permissions**

📌 Quote implied in PDF:

> “Kisi ko Owner nahi dena hai – sirf Contributor role dena hai.”

---

## 🔍 Azure Executive Control Board (Concept)

* Represents **governance & oversight**
* Controls:

  * Who gets access
  * What role they get
  * At what scope (Subscription / RG)

---

## 🔄 Onboarding & Offboarding

### 🧾 Onboarding Includes:

* Subscription creation
* Management group creation
* User creation
* Group association
* Role assignment

### 🚪 Offboarding Includes:

* Removing user from groups
* Access automatically revoked
* No manual cleanup required

---

## 1️⃣1️⃣ Ways of Working: Manual vs Automation

### ❌ Manual (Not Recommended)

* Using Azure Portal manually
* Zero industry value
* High risk of mistakes
* Poor scalability

> ⚠️ “Manual kaam karne walon ki naukri jaa rahi hai”

---

### ✅ Automation (Recommended)

#### Types:

* **Imperative**

  * Azure CLI
  * Azure PowerShell

* **Declarative**

  * ARM Templates
  * Bicep
  * Terraform
  * Pulumi
  * CloudFormation (AWS reference)

---

## 1️⃣2️⃣ Infrastructure as Code (IaC) Focus

### 📌 Tools Mentioned

| Tool          | Type                      |
| ------------- | ------------------------- |
| ARM Templates | Declarative               |
| Bicep         | Declarative               |
| Terraform     | Declarative (Multi-cloud) |
| Pulumi        | Declarative via code      |

📍 **Terraform will be the main focus in the next class**

📍 **Pulumi will start after 2 classes**

---

## 1️⃣3️⃣ Key Learning Outcomes from This PDF

* Real-world **Azure RBAC design**
* Enterprise-style **group-based access control**
* Strong foundation in **Entra ID**
* Understanding **onboarding/offboarding workflows**
* Clear shift from **manual work to automation**
* Preparation for **industry DevOps practices**

---

## ✅ Summary (Exam / Interview Ready)

* Use **group-based RBAC**
* Avoid **Owner role**
* Follow **least privilege**
* Automate everything
* Prefer **Terraform & declarative IaC**
* Azure Portal ≠ DevOps skill
