Google Data Analytics Capstone: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
The rise of urban mobility solutions has placed bike-share programs at the forefront of sustainable transportation. This case study explores the strategic challenges and opportunities faced by a bike-share company seeking to optimize its customer base. We delve into the analysis of Cyclistic, a Chicago-based bike-share service committed to providing diverse and accessible transportation options.  While Cyclistic enjoys a robust presence in the city, maximizing profitability hinges on converting casual riders into loyal annual members.  This report details an analysis of Cyclistic's trip data for the first quarter of 2024, aiming to uncover key usage patterns and inform targeted marketing strategies.  It will outline the data sources, cleaning process, analysis, visualizations, and recommendations derived from this analysis.
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 03/28/25]  

SQL Queries:  
[01. Data Combining](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/1.%20Data%20Combining.sql)  
[02. Data Exploration](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/2.%20Data%20Exploration.sql)  
[03. Data Cleaning](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/3.%20Data%20Cleaning.sql)  
[04. Data Analysis](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/4.%20Data%20Analysis.sql)

Data Visualizations: [Tableau](https://public.tableau.com/app/profile/bhaskar.kasbekar/viz/CyclisticCaseStudyDashboard_17432724171050/Dashboard1)
## Background
### Cyclistic
Cyclistic launched its successful bike-share program in 2016 and has since grown to encompass a substantial fleet of bicycles and a widespread network of stations across Chicago.  Cyclistic distinguishes itself by offering a range of bike options, including reclining bikes, hand tricycles, and cargo bikes, catering to a diverse range of riders.  While a significant portion of Cyclistic users ride for leisure, a notable percentage utilize the bikes for daily commuting.    

Currently, Cyclistic employs a flexible pricing strategy, offering single-ride passes, full-day passes, and annual memberships.  Riders using single-ride or full-day passes are classified as casual riders, while those with annual memberships are considered members.  The company's marketing team is keen to leverage data analysis to optimize its strategies, with a particular focus on converting casual riders into annual members, who are deemed more profitable.  This initiative is driven by the understanding that casual riders are already familiar with the Cyclistic service and have demonstrated a need for its mobility solutions.

## Ask
### Business Task
To inform effective marketing strategies, a deeper understanding of Cyclistic's user base is crucial. This analysis seeks to answer the following key question:

How do annual members and casual riders use Cyclistic bikes differently?    
Answering this question will enable the marketing team to develop targeted campaigns and initiatives aimed at converting casual riders into annual members.

## Prepare
### Data Source
This analysis utilizes Cyclistic's historical trip data to identify trends and patterns in rider behavior.  The data has been made available by Motivate International Inc. and provides valuable insights into how different customer types use Cyclistic bikes.  It's important to note that data-privacy considerations restrict the use of riders' personally identifiable information. Therefore, the analysis focuses on aggregate usage patterns and does not include individual rider data.   

The data for this analysis is limited to the first quarter of 2024 (January - March 2024). This timeframe was chosen as I was limited by Google's BigQuery storage space. Further analysis with a more comprehensive dataset would be needed to draw definitive conclusions about annual trends.

The data is organized in a tabular format, with each row representing a single bike trip and columns containing attributes such as trip duration, start and end times, user type (member or casual rider), and bike type.
### Data Organization
There are 3 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
BigQuery is used to combine the various datasets into one dataset and clean it.
### Combining the Data
SQL Query: [Data Combining](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/1.%20Data%20Combining.sql)
3 csv files are uploaded as tables in the dataset '2024_tripdata'. Another table named "combined_data" is created, containing 512910 rows of data for the first 3 months. 
### Data Exploration
SQL Query: [Data Exploration](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/2.%20Data%20Exploration.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. The table below shows the all column names and their data types. The __ride_id__ column is our primary key.  

<img width="287" alt="Table schema" src="https://github.com/user-attachments/assets/5cb49402-d58c-46c2-ab00-af61d67c69b8" />













