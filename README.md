## Overview
This project implements an end-to-end analytics pipeline for Airbnb-style data using dbt and Snowflake, following a Medallion Architecture (Bronze / Silver / Gold) and Star Schema design principles.

## Tech Stack
- Warehous: Snowflake
- Transformation: dbt
- Language: SQL (Jinja)
- Configuration: Python (uv)
- Version Control: Git/Github

## Data Architechture
1. Staging
- Raw data is loaded from S3 into Snowflake staging tables.

2. Bronze Layer
- Incremental append based on staging data.

3. Silver Layer
- Data transformation 
- Incremental upsert based on unique keys

4. Gold Layer
- Implemented STAR schema fact + dim tables
- Also built OBT for analysis purpose, using metadata-driven pipeline

## Project Structure
```text
.
├── airbnb_project/              # dbt project root
│   ├── models/
│   │   ├── bronze/
│   │   ├── silver/
│   │   └── gold/
│   ├── snapshots/
│   ├── macros/
│   ├── analyses/
│   ├── tests/
│   └── dbt_project.yml
├── pyproject.toml               # Python dependencies (uv)
├── uv.lock
├── .gitignore
└── README.md


