\# Medallion Architecture with dbt Core using DuckDB



\## Overview

This project implements a Medallion Architecture (Bronze → Silver → Gold) using dbt Core and DuckDB. The goal is to transform raw transactional data into clean, analytics-ready datasets with enforced data quality.



\## Architecture



\### Bronze Layer (Raw Data)

Source tables ingested from the Source OLTP system with no transformations (select \*). Acts as a raw data snapshot. This also serves as mapping tool.



\*\*Models:\*\*

\- br\_customer

\- br\_supplier

\- br\_product

\- br\_orders

\- br\_order\_item



\### Silver Layer (Cleaned Data)

Data is cleansed. Data types are corrected, duplicates are removed, and calculated fields are created.



\*\*Applied transformations:\*\*

\- Casting IDs to integers

\- Trimming string fields

\- Creating full\_name

\- Deduplicating using business keys



\*\*Models:\*\*

\- stg\_customer

\- stg\_supplier

\- stg\_product

\- stg\_orders

\- stg\_order\_item



\### Gold Layer (Business Layer)

Final dimensional model for analytics using a star schema design.



\*\*Dimensions:\*\*

\- dim\_customer

\- dim\_supplier

\- dim\_product

\- dim\_date



\*\*Fact Table:\*\*

\- fact\_sales (grain: one row per order item)



\## Data Flow

Sources → Bronze → Silver → Gold



\## Data Quality

Data quality is enforced using dbt tests including not\_null, unique, and relationships between fact and dimensions.



\## How to Run

1\. Install dependencies:  

&#x20;  `pip install dbt-core dbt-duckdb`

2\. Configure `profiles.yml` with DuckDB path

3\. Run models:  

&#x20;  `dbt run`

4\. Run tests:  

&#x20;  `dbt test`

5\. Generate docs:  

&#x20;  `dbt docs generate \&\& dbt docs serve`



\## Key Design Decisions

\- Duplicates handled in Silver layer

\- Fact table grain: one row per order\_item

\- Standard macro, `generate\_schema\_name.sql`, used to enforce schemas (bronze, silver, gold)

