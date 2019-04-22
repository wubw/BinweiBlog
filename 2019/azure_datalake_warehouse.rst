
Azure_Datalake_Warehouse
========================

.. post:: Apr 21, 2019
   :tags:
   :category:

Datalake
============

Analyzing Big Data in Azure

* Data Lake Store: No limits data Lake
* Data Lake Aanlytics: Analytics job service
* HDInsight: Managed clusters

Azure Data Lake Store 

* WebHDFS compatible 
* Any size 
* Any format as-is 
* Write-once-read-many 
* Enterprise-grade security 
* The big data store in Azure 

Characteristics 
Data Warehousing vs Data Lakes 

* Data Warehousing 

- Structured data 
- Defined set of schemas 
- Requires Extract-Transform- Load (ET L) before storing 
- Known for some of us 
- Exploratory analysis is hard because of transforming the data 

* Data Lakes 

- Raw data (unstructured/semi-structured/structured) 
- "Dump" all your data in the lake 
- Data scientists will interpret data from the lake 
- Without metadata, turns in a data swamp pretty fast 

.. image:: images/azure_datalake_warehouse_analytics.png

Azure Data Lake Store vs Blob Storage 

* No Limitations Store whatever you want in any format 
* Redundancy It's there but no control over it 
* Security Built-in Azure Active Directory support 
* Built for Scale Optimized for high- scale reads 
* Pricing More expensive than Storage GRS 
* Integration With Data Factory, Data Catalog & HDlnsight 

Full comparison on https://bit.ly/ads-vs-storage 

Azure Data Lake Analytics 

* Run analytics jobs on managed clusters: No maintenance Serverless 
* Written in U-SQL: SQL Syntax and Extensibility in C# 
* Easily scaled with Analytics Units 
* Pay for processing time only 

Data Sources 

* Built-in partitioned tables 
* Query data where it lives, No need to prepare data 
* One query that runs on multiple data stores 
* Use the correct data store for the job 

.. image:: images/usql.png

Learn more! 
Azure Data Architecture Guide 
https://docs.microsoft.com/en-us/azure/architecture/data-guide/

"Mastering Azure Analytics" by Zoiner Tejada 
http://shop.oreilly.com/product/0636920050568.do

Azure Data Lake GitHub Repo 
(https://azure.github.io/AzureDataLake/) 

U-SQL Documentation 
https://usql.io

MVA "Introducing Azure Data Lake"
https://bit.ly/intro-to-azure-data-lake
Retired course?

Azure Data Lake (ADL) makes processing Big Data simpler and more accessible by providing several key technologies. The U-SQL language is a powerful combination of SQL and C# that supports parallel execution.
Azure Data Factory (ADF) is a cloud-based data integration service that orchestrates and automate the movement and transformation of data.

The ADL-ADF integration allows you to:

* Move data from a given source to the ADL store
* Create BigData ADF pipelines that run U-SQL as a processing step on the ADL Analytics service

Data lake store: 

* For cold data
* Data lake analytics + data lake store

Azure data lake analytics
HDInsight the developers need to care about the clusters
Azure data lake analytics developers just like Uber
USQL
Very good support from Visual studio compared to hadoop, hive directly
Vs can support playback the execution

Transform and Analyze

* Stream analytics
* HDInsight (spark, storm, Hive, Pig, HBase)
* Azure data lake analytics and U-SQL
* Azure SQL Data Warehouse


Data Lake Analytics (Analytics)
Run big data analysis jobs that scale to massive data sets.

Basic Data Lake Analytics process:

* Create a Data Lake Analytics account.
* Prepare the source data. Data Lake Analytics jobs can read data from either Azure Data Lake Store accounts or Azure Blob storage accounts. In this example, we will read from Azure Data Lake Store.
* Develop a U-SQL script.
* Submit a job (U-SQL script) to the Data Lake Analytics account. The job reads from the source data, process the data as instructed in the U-SQL script, and then save the output to either a Data Lake Store account or a Blob storage account.
	
U-SQL is a language that unifies the benefits of SQL with the expressive power of your own code to process all data at any scale. U-SQL’s scalable distributed query capability enables you to efficiently analyze data in the store and across relational stores such as Azure SQL Database. It enables you to process unstructured data by applying schema on read, insert custom logic and UDF's, and includes extensibility to enable fine grained control over how to execute at scale. 

Code example:

.. code::

	@searchlog =
    EXTRACT UserId          int,
            Start           DateTime,
            Region          string,
            Query           string,
            Duration        int?,
            Urls            string,
            ClickedUrls     string
    FROM "/Samples/Data/SearchLog.tsv"
    USING Extractors.Tsv();
	OUTPUT @searchlog   
    TO "/Output/SearchLog-from-Data-Lake.csv"
    USING Outputters.Csv();

Data Lake Store (Analytics)
Hyper-scale repository for your big data analytics
What is the benefit to use Data Lake Store?

SQL Data Warehouse
====================

Fast provisioning and scale
Storage and compute service is separated

PolyBase technology: simplfy and enable distributed analytics
Polybase allows you to leverage your data from different sources by using familiar T-SQL commands. Polybase enables you to query non-relational data held in Azure Blob storage as though it is a regular table. Use Polybase to query non-relational data, or to import non-relational data into SQL Data Warehouse.

Pricing - DWU (Data Warehouse Units) What the hell is DWU calculated?
MMP (Massively parallel processing)
Built on SQL server engine. It is SQL on SQL
Distribution mode: round_robin(random), or on a key using hash. (check the row count to see whether the distribution is even)

Unsuitable workloads 
Operational workloads (OLTP) 

* High frequency reads & writes 
* Large numbers of singleton selects 
* High volumes of single row inserts 

Procedural ETC 

* Row by row processing needs 
* Incompatible formats (JSON, XML) 

Guidance 
Keep column definitions strongly typed 
Distribution key is read only: Aim for a not null definition for distribution key 
Ensure columns are defined consistently: Especially true for the distribution key 
Hash distribution optimises data layout: JOIN and GROUP BY columns are often the best candidates 
Partition for data management: Consider columns used in the WHERE clause, Evaluate query date ranges (month, quarter) as part of the partitioning strategy 

Loading compressed text 
Guidance  
Evenly split the data into multiple files 
One file per reader 
    
Good links: 
https://azure.microsoft.com/en-us/documentation/articles/sql-data-warehouse-overview-what-is/#data-warehouse-units
https://azure.microsoft.com/en-us/documentation/articles/sql-data-warehouse-load-polybase-guide/

.. image:: images/sql-data-warehouse-diagram.png

When create a new data warehouse, it is necessary to specify database name and server.
Setup firewall rule for connection from the local computer (On SQL servers blade rather than on SQL databases)
Request and sessions are logically represented by their respective identifiers

Visual Studio has: 1. Server Explorer, 2. SQL Server Object Explorer

Data Factory:

* create linked services, datasets, pipelines for source (blob), target (datawarehouse)
* table and columns need to be setup in datawarehouse

https://www.talend.com/resources/data-lake-vs-data-warehouse/

SQL Data Warehouse (Data & Storage)
Azure SQL Data Warehouse is a scale out database service designed to answer your ad hoc queries and questions. By spreading your data across distributions SQL Data Warehouse is designed for analytics at scale. To make the most of your database there are opportunities to tailor your table design and optimize for performance.
SQL on SQL

Azure Data Warehouse
If the data is less than 1 TB, it is not a big data problem. Use SQL server directly.
Can pause the data warehouse, then not charge anymore
Polybase
