# 📝 Examination System (Database + Desktop Application)

## 📌 Project Description
This project is an **automated examination system** designed to manage online exams efficiently.  
It includes both the **SQL Database** and a **Desktop Application** for ITI staff and students.  
The system covers exam creation, student answers, automatic correction, and multiple reporting features.

---

## 🎯 Features
- **Entity Relationship Diagram (ERD)** for the database design.
- **Database Dictionary** to describe all tables, attributes, and relationships.
- **Stored Procedures** for:
  - `SELECT`, `INSERT`, `UPDATE`, `DELETE` operations.
  - Exam generation.
  - Handling exam answers.
  - Automatic exam correction.
- **Reports** for ITI staff:
  1. Students information by department number.
  2. Student grades across all courses (by Student ID).
  3. Instructor courses and number of students per course (by Instructor ID).
  4. Course topics (by Course ID).
  5. Exam questions and choices (by Exam Number).
  6. Student answers in a specific exam (by Exam Number + Student ID).
- **Desktop Application** integrated with the database.
- **Reporting Tools**: Crystal Reports or Report Builder.

---

## 🛠️ Technologies Used
- SQL Server / MySQL for Database.
- Stored Procedures for business logic.
- Crystal Reports / Report Builder for reporting.
- Desktop Application (C# / .NET Framework or similar).

---

## 📊 Database Structure
The system database includes:
- Students
- Courses
- Instructors
- Exams
- Questions
- Answers
- Departments

---

## 🚀 How to Run
1. Import the provided SQL script (`ExaminationSystem.sql`) into your SQL environment.
2. Execute the script to create the database schema, tables, and stored procedures.
3. Connect the database to the desktop application.
4. Run the application to perform exam operations and generate reports.

---

## 🎓 Certification
This project was developed as part of the **ITI (Information Technology Institute) Database Training Program**.

---

## 📂 Repository Structure
