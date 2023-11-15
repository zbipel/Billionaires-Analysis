# Project Overview

<br>

This is a project demonstrating the process of conducting exploratory data analysis on a given dataset. It is set within a fictional scenario, representing a request from a Business Analysis Manager. 

### Data Source

- **Dataset**: "Billionaires Statistics Dataset" (2023)
- **Provided by**: NIDULA ELGIRIYEWITHANA 
- [Dataset Link](https://www.kaggle.com/datasets/nelgiriyewithana/billionaires-statistics-dataset/data)

### Used Software and Technologies

- Excel (Power Query, Power Pivot)
- SQL Server Management Studio (SSMS)

### Approach

- Analysis was made parallelly using Excel and SQL to provide additional validation to the results and enrich them with visuals.


<br>

## Business Problem

Our Business Analysis Manager has requested assistance with a research project, part of which involves a demographic analysis of billionaires on a global scale. The objective is to gain a better understanding of the demographics of billionaires and the various factors influencing their financial success.

The primary analysis objectives are as follows:

Basic Statistics Analysis: We aim to derive basic statistics, such as the mean net worth, average age of billionaires, and a distribution of billionaires in various industries and countries.

Identifying Demographic Trends: We intend to explore the impact of age, gender, source of wealth, taxes, and countries of residence on the financial success of billionaires.

Self-Made Wealth Analysis: We are keen on determining the percentage of billionaires who have generated their wealth independently, without inheritance.


<br>

### User Stories


| No | As a              | I want                                                         | So that                                       | Acceptance Criteria |
|----|-------------------|----------------------------------------------------------------|-----------------------------------------------|--------------------|
| 1  | Marketing Analyst | To have a better understanding of the billionaires' landscape. | I can profile them as potential clients.      | The analysis should include statistics about billionaires, allowing the identification of their demographic characteristics, such as age ranges, gender distribution, and regions of residence. Additionally, it should provide insights into their primary industries of interest. |
| 2  | Business Analyst   | To know what are the sources of income of the wealthiest people. | I can make informed decisions about their businesses. | The analysis should provide data on the primary sources of wealth for billionaires, including the top industries and sectors contributing to their wealth. |
| 3  | Business Analysis Manager | To analyze billionaires' demographics and understand their financial situation. | I manage a research project about our potential clients. | The analysis should include information on the number of billionaires considering their age groups, gender distribution, and geographic regions. Additionally, it should provide an overview of the most prevalent industries among billionaires. |


<br>


# Steps Applied

<br>
<br>

1. **Data Import (CSV File) to Microsoft Excel**

<br>

   ![Import Data](Resources/Screenshots/PowerQuery_import.png)

<br>
<br>

2. **Data Cleansing & Transformation**

<br>


- Cleaned data
  - promoted headers
  - checked quality of data
  - removed unnecessary / unusable columns
  - renamed column
  - transformed data using "replace values", "split column"
  - changed data types

<br>

 ![Data Cleaning](Resources/Screenshots/PowerQuery_profiling.png)
 ![Data Cleaning](Resources/Screenshots/PowerQuery_cleaning.png)

<br>
    
- Transformed data
	- created new table 'Countries' 
	- created index column 'country_id' to act as a primary key
	- added 'country_id' to 'Billionaires' table as a foreign key using 'merge queries' option
	- added index column 'id' identifying each row to 'Billionaires' table

<br>

![Data Modeling](Resources/Screenshots/PowerQuery_modeling.png)

<br>


- Created data model
	- added two tables to the data model
	- established relationship between tables in datamodel
	- created pivot table

<br>

![Data Relationship](Resources/Screenshots/Power_pivot_relationship.png)
   
<br>
<br>

3. **Import of the .xlsx file into SSMS**

<br>

![Data ImportSSMS](Resources/Screenshots/SQL_import.png)
![Data ImportSSMS](Resources/Screenshots/SQL_import_2.png)
![Data ImportSSMS](Resources/Screenshots/SQL_import_3.png)

<br>
<br>

4. **Conducting the analysis**

<br>

- Potential duplicates:


![SQL_4](Resources/Screenshots/SQL_Analysis_4.png)

<br>
<br>

- Missing data percentage:


![SQL_5](Resources/Screenshots/SQL_Analysis_5.png)

<br>
<br>

- Basic statistics:


![SQL_1](Resources/Screenshots/SQL_Analysis_1.png)
![Excel_1](Resources/Screenshots/Excel_Analysis_1.png)

<br>
<br>

- Count of unique industries:


![SQL_2](Resources/Screenshots/SQL_Analysis_2.png)
![Excel_2](Resources/Screenshots/Excel_Analysis_2.png)

<br>
<br>

- Count of unique countries:


![SQL_3](Resources/Screenshots/SQL_Analysis_3.png)
![Excel_3](Resources/Screenshots/Excel_Analysis_3.png)

<br>
<br>

- Billionaires by country:

![SQL_6](Resources/Screenshots/SQL_Analysis_6.png)
![Excel_6](Resources/Screenshots/Excel_Analysis_6.png)
![Excel_6g](Resources/Screenshots/Excel_Analysis_6g.png)


<br>
<br>

- Billionaires per 1 000 000 residents by country:

![SQL_6](Resources/Screenshots/SQL_Analysis_13.png)
![Excel_6](Resources/Screenshots/Excel_Analysis_13.png)
![Excel_6g](Resources/Screenshots/Excel_Analysis_13g.png)


<br>
<br>

- Billionaires by industry:

![SQL_7](Resources/Screenshots/SQL_Analysis_7.png)
![Excel_7](Resources/Screenshots/Excel_Analysis_7.png)
![Excel_7g](Resources/Screenshots/Excel_Analysis_7g.png)

<br>
<br>

- Top 15 sources of wealth:

![SQL_8](Resources/Screenshots/SQL_Analysis_8.png)
![Excel_8](Resources/Screenshots/Excel_Analysis_8.png)
![Excel_8g](Resources/Screenshots/Excel_Analysis_8g.png)

<br>
<br>

- Billionaires and net worth by gender:

![SQL_9](Resources/Screenshots/SQL_Analysis_9.png)
![Excel_9](Resources/Screenshots/Excel_Analysis_9.png)
![Excel_9g](Resources/Screenshots/Excel_Analysis_9g.png)

<br>
<br>

- Countries' tax rates vs. number of billionaires (excluding tax havens):

![SQL_10](Resources/Screenshots/SQL_Analysis_10.png)
![Excel_10](Resources/Screenshots/Excel_Analysis_10v1.png)
![Excel_10g](Resources/Screenshots/Excel_Analysis_10g1.png)

<br>
<br>

- Billionaires and net worth by age groups:

![SQL_11](Resources/Screenshots/SQL_Analysis_11.png)
![Excel_11](Resources/Screenshots/Excel_Analysis_11.png)

<br>
<br>

- Percentage of self-made billionaires:


![SQL_12](Resources/Screenshots/SQL_Analysis_12.png)
![Excel_12](Resources/Screenshots/Excel_Analysis_12.png)

<br>
<br>

5. **Other activities**

- Created additional DAX measures using:
  - IF()
  - ISBLANK()
  - COUNT()
  - SUM()
  - DIVIDE()

<br>
<br>

# Conclusions and Key Insights

- The dataset comprises information on 2,637 billionaires.

- The average net worth of a billionaire stands at $4.626 billion.

- The age range of billionaires is extensive, with the oldest being 101 years old and the youngest just 18. The average age among them is 65.

- There are 18 industries associated with billionaire business interests, with dominant sectors including Finance & Investments, Manufacturing, Technology, Fashion & Retail, Food & Beverage, Healthcare, and Real Estate.

- The dataset includes billionaires from 78 countries. The countries with the highest number of billionaires are the USA (753), China (521), and India (157), with only four countries having more than 100 billionaires.

- The primary source of wealth for billionaires is the Real Estate industry.

- Of the total billionaires, 2,301 are male, while 336 are female. Although the average net worth is similar for both genders ($4.633 billion for males and $4.580 billion for females), there is significant gender disparity.

- The analysis of provided data shows no evident correlation between the number of billionaires in a country and its tax rate.

- The majority of billionaires fall within the age range of 50-70 years old, accounting for 74% of all billionaires.

- Out of the total number of billionaires, 68.64% have self-made wealth.

<br>
<br>

