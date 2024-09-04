# EDA on Netflix Data
Exploratory Data Analysis on Netflix Movies and TV Shows data utilizing ELT Concepts Python, SQL and Power BI.

## Data Extraction

The project begins with data extraction, where I:
* Utilized Kaggle API and Python to extract data from Kaggle.

## Data Loading
Following data extraction, I Loaded the data in SQL Server using the SQLAlchemy library in Python.

## Data Transformation
After the data was loaded in the SQL Server I performed the data cleaning/transformation using SQL
* Removed duplicate entries and cleaned data types.
* Used ```STRING_SPLIT``` in SQL to create new tables for multi-value columns like Director, Country, and Genre.
* Filled missing data using data mapping techniques.

## Data Analysis
After data cleaning I conducted data analysis in SQL to uncover meaningful insights. I analyzed following questions:
1. For each director count the no of movies and tv shows created by them in separate columns.
2. List of directors who have created both movies and TV shows.
3. Which country has highest number of comedy movies?
4. Which director has maximum number of movies released(on Netflix which is date added) for each year?
5. What is average duration of movies in each genre?
6. Find the list of director who have created horror and comedy movies both,
display director names along with number of comedy and horror movies directed by them.

## Data Visualization
After the analysis was done I created a Power BI dashboard to present the insights effectively.
