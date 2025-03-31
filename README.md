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

2. The following table shows number of __null values__ in each column.

<img width="1151" alt="Checking for null values " src="https://github.com/user-attachments/assets/1c4baeb6-4600-4da0-beee-3cf8c7f1f223" />

3. There are 144873 duplicate rows that need to be removed.

   <img width="192" alt="Total duplicate rows" src="https://github.com/user-attachments/assets/82b7fa0a-8014-49b1-a900-c2d86ab8b1e2" />

5. All ride_id values have length of 16 so no need to clean it.

<img width="390" alt="2 unique types of bikes" src="https://github.com/user-attachments/assets/2fe50f69-0713-4b8e-8cb4-f7f2e5e2b278" />

5. There are 2 unique types of bikes(rideable_type) in our data. - electric and classic

6. The started_at and ended_at shows start and end time of the trip in YYYY-MM DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 697 trips which has duration longer than a day and 8404 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.

7. There are 1129 rows with unique end station names

8. Total of 45900 rows have both end_station_name and end_station_id missing which needs to be removed.

9. Total of 606 rows have both end_lat and end_lng missing which needs to be removed.

10. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/3.%20Data%20Cleaning.sql)  
1. All the rows having missing values are deleted.
2. 3 more columns ride_length for duration of the trip, day_of_week and month are added.
3. Trips with duration less than a minute and longer than a day are excluded.
4. Total 75,113 rows are removed in this step.

## Analyze and Share
SQL Query: [Data Analysis](https://github.com/Bhaski92/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/main/4.%20Data%20Analysis.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/bhaskar.kasbekar/viz/CyclisticCaseStudyDashboard_17432724171050/Dashboard1)  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?

## Inference
Based on the data from the first quarter of 2024, the analysis reveals distinct usage patterns between Cyclistic's annual members and casual riders:

![Dashboard 1](https://github.com/user-attachments/assets/f9a6b9b0-6f73-421b-a12e-e3e178881a86)

Ride Frequency:
Members take significantly more rides than casual riders.
Explanation: The "Ride Count by User Type" bar chart clearly shows a much larger count of rides for members.

Bike Type Preference:
Both members and casual riders primarily use classic bikes.
Members have a larger share of both classic (59.90%) and electric bike usage (21.34%).
Casual riders show a proportionally higher interest in electric bikes relative to their overall ride share, but their overall usage is lower.
Explanation: The "Bike Type Usage by Rider Type" pie charts illustrate the percentage breakdown of bike usage by rider type.

Weekday vs. Weekend Usage:
Members exhibit relatively consistent usage throughout the weekdays, with a slight decrease on weekends.
Casual riders have lower usage during the weekdays and a peak on Saturday.
Explanation: The "Total trips per day of week" line chart shows the number of rides by rider type across the days of the week.

Time of Day Patterns:
Members show peak usage during typical commute hours (around 8 AM and 5 PM).
Casual riders have a more gradual increase in usage, peaking in the afternoon.
Explanation: The "Total trips per hour" line chart displays the number of rides by rider type across the hours of the day.

Conclusion:
Based on the first quarter data, the following key differences in Cyclistic usage patterns between annual members and casual riders are observed:

1. Usage Frequency: Annual members are the primary users of Cyclistic bikes.
2. Usage Purpose: Annual members likely use Cyclistic for commuting, as indicated by weekday consistency and commute-hour peaks.
3. Casual riders likely use Cyclistic for leisure, as shown by weekend peaks and afternoon activity.
4. Bike Preference: While both groups favor classic bikes, casual riders show a proportionally higher interest in electric bikes.

These differences suggest that Cyclistic should pursue targeted marketing strategies to convert casual riders into annual members.







