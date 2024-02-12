## Data Warehouse: NYC Green Taxi Insights with BigQuery
This repository details an ETL pipeline and Data Warehouse built for the NYC Green Taxi Trip Record Data (2022), designed to unlock valuable insights through BigQuery on Google Cloud Platform.

**Project Background:**

This project emerged from Week 3 of Data Engineering Zoomcamp 2024, focusing on Data Warehouses and their application to real-world scenarios. The primary objectives were:

Establish an ETL pipeline on Mage to process and export TLC trip data.

<img width="671" alt="Screenshot 2024-02-11 at 11 44 52 PM" src="https://github.com/rtilwalia/DataEngineerZoomcamp_2024/assets/32938713/3b76c53f-beb3-4a93-b5d4-81ea924ec7a9">


Create a scalable Data Warehouse on GCP using BigQuery.
Explore the benefits and internal workings of BigQuery.
Implement partitioning and clustering for query optimization.
Analyze query execution time and identify potential improvements.

**Technical Components:**
1. Data Source: NYC Green Taxi Trip Record Data (2022) - https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
2. ETL Pipeline: Mage
3. Data Warehouse: BigQuery
4. Data Processing & Transformation: Python scripts
5. Querying: SQL within BigQuery

**Key Achievements:**
1. Successful creation of an ETL pipeline to load green taxi data into BigQuery.
2. Implementation of external table connections in BigQuery.
3. Design of partitioned tables based on pickup date for efficient data retrieval.
4. Utilization of locationID-based clustering to optimize query performance.
5. Analysis of query execution time to identify and address performance bottlenecks.


**Further Exploration:**
This project serves as a springboard for further investigation into Data Warehousing and BigQuery:
1. Advanced BigQuery features (materialized views, custom UDFs)
2. Integration with BI tools for visualization and reporting
3. Real-world application of insights derived from taxi data


**Additional Resources:**
1. Google BigQuery Documentation: https://cloud.google.com/bigquery/docs/
2. NYC TLC Trip Record Data: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page





