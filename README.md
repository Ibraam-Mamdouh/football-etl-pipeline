# ⚽ International Football Matches - ETL Pipeline

## 📌 Project Overview
This project demonstrates an end-to-end Data Engineering (ETL) pipeline. It extracts historical international football matches data, cleans and transforms it using **Python (Pandas)**, and loads it into a **Microsoft SQL Server** database. Finally, advanced SQL queries and Stored Procedures are utilized to extract meaningful statistics and insights.

## 🛠️ Tools & Technologies
* **Language:** Python, SQL
* **Libraries:** Pandas, SQLAlchemy, pyodbc
* **Database:** Microsoft SQL Server (SSMS)
* **Environment:** Jupyter Notebook

## ⚙️ ETL Workflow

### 1. Extract & Transform (Python/Pandas)
* Performed data profiling to identify missing values and duplicates.
* Ensured data integrity by casting data types appropriately (e.g., converting dates to `Datetime`).
* Applied Feature Engineering to create new analytical columns: `year`, `month`, `day`, `total_goals`, `goal_difference`, and `result`.

### 2. Load (SQLAlchemy & pyodbc)
* Established a seamless connection between the Jupyter Notebook environment and **MS SQL Server** using `SQLAlchemy`.
* Automated the loading process to push the cleaned Pandas DataFrame directly into a dedicated SQL database table.

### 3. Querying & Analysis (MS SQL Server)
* Designed complex SQL queries to analyze team performance and tournament statistics.
* Utilized **Common Table Expressions (CTEs)** and `UNION ALL` for advanced data aggregation.
* Implemented **Window Functions** (`ROW_NUMBER()`, `PARTITION BY`) to rank matches based on yearly goals.
* Built dynamic **Stored Procedures** to automate querying and parameterize team-specific statistics.

## 📂 Repository Structure
```text
football-etl-pipeline/
│
├── data/
│   ├── raw/                     # Original dataset before processing
│   └── processed/               # Cleaned data ready for SQL loading
│
├── notebooks/
│   └── etl_pipeline.ipynb       # Jupyter Notebook containing Extract, Transform, and Load scripts
│
├── sql/
│   └── queries_and_procedures.sql # Advanced SQL queries, Window Functions, and Stored Procedures
│
├── requirements.txt             # Project dependencies
└── README.md                    # Project documentation
