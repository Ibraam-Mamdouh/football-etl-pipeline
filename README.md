# ⚽ International Football Matches — ETL Pipeline

## 📌 Project Overview

This project demonstrates an **end-to-end Data Engineering (ETL) pipeline** for processing historical international football match data.

The pipeline extracts raw match data from a CSV file, cleans and transforms it using **Python and Pandas**, validates the processed dataset, and loads it into **Microsoft SQL Server**. SQL queries and Stored Procedures are then used to process and analyze the loaded data.

The final dataset contains **25,485 international matches from 2000 to 2026**.

---

## 🛠️ Tools & Technologies

* **Languages:** Python, SQL
* **Libraries:** Pandas, SQLAlchemy, pyodbc
* **Database:** Microsoft SQL Server
* **Database Tool:** SQL Server Management Studio (SSMS)
* **Environment:** Jupyter Notebook

---

## ⚙️ ETL Workflow

### 1. Extract & Transform — Python / Pandas

The raw dataset was loaded from a CSV file and analyzed using Pandas.

Data preparation and transformation included:

* Data profiling and quality checks
* Missing-value validation
* Duplicate detection
* Data type conversion
* Date conversion to `datetime`
* Text cleaning
* Filtering matches from **2000 onwards**
* Feature engineering

Additional analytical columns were created:

* `year`
* `month`
* `day`
* `total_goals`
* `goal_difference`
* `result`

Data quality checks were also performed to validate:

* Missing values
* Duplicate records
* Invalid scores
* Matches where the home and away teams are identical
* Invalid match results
* Consistency between calculated results and match scores

---

### 2. Load — SQLAlchemy & pyodbc

A connection between the Python environment and **Microsoft SQL Server** was established using **SQLAlchemy and pyodbc**.

The transformed Pandas DataFrame was automatically loaded into the `matches` table in the `FootballDB` database, eliminating the need for manual data imports.

---

### 3. SQL Processing & Analysis — T-SQL / SQL Server

After loading the data into SQL Server, T-SQL was used to analyze and process the dataset.

The project includes:

* `GROUP BY` and aggregate functions
* Common Table Expressions (CTEs)
* `UNION ALL`
* Window Functions
* `ROW_NUMBER()`
* `PARTITION BY`
* Parameterized Stored Procedures

Examples include:

* Finding the top tournaments by number of matches
* Calculating the total goals scored by a specific team
* Identifying the highest-scoring match for each year
* Creating Stored Procedures for reusable team and year-based queries

---

## 📊 Data Quality Results

After transformation and validation:

* **Rows:** 25,485
* **Columns:** 15
* **Missing values:** 0
* **Duplicate rows:** 0
* **Invalid scores:** 0
* **Invalid team matches:** 0
* **Invalid results:** 0
* **Incorrect calculated results:** 0

---

## 📂 Repository Structure

```text
football-etl-pipeline/
│
├── data/
│   ├── raw/
│   │   └── results.csv
│   │
│   └── processed/
│       ├── clean_results.csv
│       └── clean_results.parquet
│
├── notebooks/
│   └── etl_pipeline.ipynb
│
├── sql/
│   └── queries_and_procedures.sql
│
├── requirements.txt
└── README.md
```

---

## 🔄 Pipeline Architecture

```text
Raw CSV Dataset
      │
      ▼
Python / Pandas
      │
      ├── Data Profiling
      ├── Data Cleaning
      ├── Type Conversion
      ├── Filtering
      ├── Feature Engineering
      └── Data Validation
      │
      ▼
Processed Dataset
      │
      ├──────────────► CSV / Parquet
      │
      ▼
SQLAlchemy + pyodbc
      │
      ▼
Microsoft SQL Server
      │
      ▼
T-SQL Queries & Stored Procedures
      │
      ▼
Analysis & Statistics
```

---

## 🎯 Project Objective

The main objective of this project was to gain practical experience in building an **end-to-end ETL workflow**, covering data extraction, transformation, validation, automated database loading, and SQL-based data processing.

The project demonstrates how Python-based data engineering workflows can integrate with **Microsoft SQL Server** to create a structured and reusable data pipeline.
