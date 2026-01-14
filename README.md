# Library-Management-System

# Library Management System using SQL & Excel

## 📌 Project Overview
Developed a comprehensive Library Management System to manage books, members, and transactions. This project demonstrates the full data lifecycle: from database schema design and data population to extracting business insights using Excel.

## 🛠️ Tech Stack
* **Database:** MySQL (Server: Mandar)
* **Integration:** ODBC 9.0 Unicode Driver
* **Reporting:** Microsoft Excel (Pivot Tables & Dashboards)

## 📊 Database Schema
The project consists of 6 core tables:
1. **Branch**: Library location details.
2. **Employee**: Staff management and branch assignment.
3. **Books**: Inventory tracking with status (Available/Issued).
4. **Customer**: Member registration data.
5. **IssueStatus**: Records of borrowed books.
6. **ReturnStatus**: History of returned items.

## 🚀 Key Features & Queries
* **Inventory Analysis:** Identified available books and high-value rentals.
* **Customer Engagement:** Found inactive members who haven't borrowed since 2022.
* **Branch Performance:** Calculated staffing levels and workload per branch.
* **Live Reporting:** Established a live ODBC connection to push SQL data into Excel for real-time analysis.

