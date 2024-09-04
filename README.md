# EDA on Netflix Data

In this project, I utilized Python Pandas and Matplotlib to analyze and answer key business questions based on 12 months of sales data from an electronics store. The dataset, comprising hundreds of thousands of purchases, is broken down by month, product type, cost, purchase address, and more.

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
* Top 10 Movie Genre
* Top 10 TV Show Genre
* Top 10 Movie Ratings
* Top 10 TV Show Ratings
* Total Movies and TV Shows
* Movies Distribution by Countries
* TV Show Distribution by Countries
* For each director count the no of movies and tv shows created by them in separate columns.
* List of directors who have created both movies and TV shows.
* Which country has highest number of comedy movies?
* Which director has maximum number of movies released(on Netflix which is date added) for each year?
* What is average duration of movies in each genre?
* Find the list of director who have created horror and comedy movies both,
* display director names along with number of comedy and horror movies directed by them.

## Data Visualization
After the analysis was done I created a Power BI dashboard to present the insights effectively.

![image](https://github.com/user-attachments/assets/1b4c20a4-9874-49ca-abc0-8a58958ae79e)
