# Olist E-Commerce Analytics — End-to-End Analytics Engineering Project

## Project Overview
This project is an end-to-end Analytics Engineering solution built on the **Olist Brazilian e-commerce dataset**. It demonstrates how raw transactional data is transformed into reliable, analytics-ready models using Snowflake, dbt Cloud, Airflow/Astro, and Power BI.

---

## 🛠️ Technology Stack
* **Cloud Data Warehouse:** Snowflake
* **Data Transformation & Modeling:** dbt Cloud / dbt Studio
* **Orchestration:** Apache Airflow / Astro
* **Data Visualization:** Power BI & Excel
* **Version Control:** Git & GitHub
* **Core Language:** SQL

---

## 🏗️ Data Architecture & Pipeline Flow
```text
                 Olist CSV Dataset
                        │
                        ▼
               ┌─────────────────┐
               │  Snowflake RAW  │  (Raw source tables)
               └─────────────────┘
                        │
                        ▼
               ┌─────────────────┐
               │   dbt STAGING   │  (Data cleaning & type casting)
               └─────────────────┘
                        │
                        ▼
               ┌─────────────────┐
               │ dbt INTERMEDIATE│  (Joins & business logic)
               └─────────────────┘
                        │
                        ▼
               ┌─────────────────┐
               │    dbt MARTS    │  (Fact & Dimension tables)
               └─────────────────┘
                        │
                        ▼
               ┌─────────────────┐
               │    Power BI     │  (Executive Dashboard)
               └─────────────────┘
