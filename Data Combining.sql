{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Bold;\f1\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red196\green255\blue139;\red255\green255\blue255;\red167\green0\blue95;
\red255\green255\blue255;\red24\green25\blue27;\red22\green80\blue200;\red24\green111\blue42;\red46\green49\blue51;
\red167\green0\blue95;\red0\green0\blue0;\red0\green0\blue0;\red24\green111\blue41;\red158\green76\blue4;
\red22\green80\blue200;\red24\green25\blue27;\red46\green49\blue51;\red24\green111\blue42;}
{\*\expandedcolortbl;;\cssrgb\c80504\c100000\c61376;\cssrgb\c100000\c100000\c99985\c0;\cssrgb\c72269\c2443\c44759;
\cssrgb\c100000\c100000\c100000\c0;\cssrgb\c12570\c12963\c14124;\cssrgb\c10100\c40746\c82694;\cssrgb\c9319\c50113\c21831;\cssrgb\c23565\c25135\c26282;
\cssrgb\c72269\c2443\c44759;\cssrgb\c0\c0\c0;\cssrgb\c0\c1\c1;\cssrgb\c8945\c49779\c21309;\cssrgb\c68834\c37406\c0;
\cssrgb\c10100\c40746\c82694;\cssrgb\c12570\c12963\c14125;\cssrgb\c23564\c25135\c26283;\cssrgb\c9319\c50113\c21831;}
\margl1440\margr1440\vieww16040\viewh11520\viewkind0
\deftab720
\pard\pardeftab720\qc\partightenfactor0

\f0\b\fs48 \cf2 \cb3 \expnd0\expndtw0\kerning0
\ul \ulc2 Data Combining\

\f1\b0\fs24 \cf4 \cb5 \ulnone \outl0\strokewidth0 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \
-- combining the 3 months data tables into a single table containing data from Jan 2024 to Mar 2024.\cf6 \strokec6 \
\
\pard\pardeftab720\partightenfactor0
\cf7 \strokec7 CREATE\cf6 \strokec6  \cf7 \strokec7 TABLE\cf6 \strokec6  \cf7 \strokec7 IF\cf6 \strokec6  \cf7 \strokec7 NOT\cf6 \strokec6  \cf7 \strokec7 EXISTS\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.combined_data`\cf6 \strokec6  \cf7 \strokec7 AS\cf6 \strokec6 \
 \cf9 \strokec9 (\cf6 \strokec6 \
  \cf7 \strokec7 SELECT\cf6 \strokec6  \cf9 \strokec9 *\cf6 \strokec6  \cf7 \strokec7 FROM\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.202401_tripdata`\cf6 \strokec6 \
  \cf7 \strokec7 UNION\cf6 \strokec6  \cf7 \strokec7 ALL\cf6 \strokec6 \
  \cf7 \strokec7 SELECT\cf6 \strokec6  \cf9 \strokec9 *\cf6 \strokec6  \cf7 \strokec7 FROM\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.202402_tripdata`\cf6 \strokec6 \
  \cf7 \strokec7 UNION\cf6 \strokec6  \cf7 \strokec7 ALL\cf6 \strokec6 \
  \cf7 \strokec7 SELECT\cf6 \strokec6  \cf9 \strokec9 *\cf6 \strokec6  \cf7 \strokec7 FROM\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.202401_tripdata`\cf6 \strokec6  \
 \cf9 \strokec9 )\cf6 \strokec6 \
\pard\pardeftab720\partightenfactor0
\cf6 \strokec6 \
\pard\pardeftab720\partightenfactor0
\cf6 \strokec6 \
\pard\pardeftab720\partightenfactor0
\cf10 \outl0\strokewidth0 -- checking for duplicate rows (144873 duplicates)\cf6 \outl0\strokewidth0 \strokec6 \
\pard\pardeftab720\partightenfactor0
\cf6 \strokec6 \
\pard\pardeftab720\partightenfactor0
\cf7 \strokec7 SELECT\cf6 \strokec6  \cf7 \strokec7 COUNT\cf9 \strokec9 (\cf6 \strokec11 ride_id\cf9 \strokec9 )\cf6 \strokec6  \cf9 \strokec9 -\cf6 \strokec6  \cf7 \strokec7 COUNT\cf6 \strokec6  \cf9 \strokec9 (\cf7 \strokec7 DISTINCT\cf6 \strokec6  \cf6 \strokec11 ride_id\cf9 \strokec9 )\cf6 \strokec6  \cf7 \strokec7 AS\cf6 \strokec6  \cf6 \strokec11 duplicate_rows\cf6 \strokec6 \
\cf7 \strokec7 FROM\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.combined_data`\
\
\pard\pardeftab720\partightenfactor0
\cf8 {{\NeXTGraphic Total duplicate rows.png \width3840 \height1140 \appleattachmentpadding0 \appleembedtype0 \appleaqc
}¬}\
\pard\pardeftab720\partightenfactor0
\cf8 \
\cf12 \strokec13 There are 144873 duplicate rows\
\cf8 \strokec8 \
\
\pard\pardeftab720\partightenfactor0
\cf10 \outl0\strokewidth0 -- Creating new table with DISTINCT rows\
\pard\pardeftab720\partightenfactor0
\cf6 \outl0\strokewidth0 \strokec6 \
\cf7 \strokec7 CREATE\cf6 \strokec6  \cf7 \strokec7 TABLE\cf6 \strokec6  \cf7 \strokec7 IF\cf6 \strokec6  \cf7 \strokec7 NOT\cf6 \strokec6  \cf7 \strokec7 EXISTS\cf6 \strokec6  \cf8 \strokec8 `industrial silo-450608.2024_tripdata.combined_data_distinct`\cf6 \strokec6  \cf7 \strokec7 AS\cf6 \strokec6  \
\cf7 \strokec7 WITH\cf6 \strokec6  \cf6 \strokec11 RankedRows\cf6 \strokec6  \cf7 \strokec7 AS\cf6 \strokec6  \
\cf9 \strokec9 (\cf6 \strokec6 \
  \cf7 \strokec7 SELECT\cf6 \strokec6  \cf9 \strokec9 *\cf6 \strokec6 , \cf7 \strokec7 ROW_NUMBER\cf9 \strokec9 ()\cf6 \strokec6  \cf7 \strokec7 OVER\cf6 \strokec6  \cf9 \strokec9 (\cf7 \strokec7 PARTITION\cf6 \strokec6  \cf7 \strokec7 BY\cf6 \strokec6  \cf6 \strokec11 ride_id\cf6 \strokec6  \cf7 \strokec7 ORDER\cf6 \strokec6  \cf7 \strokec7 BY\cf6 \strokec6  \cf6 \strokec11 started_at\cf9 \strokec9 )\cf6 \strokec6  \cf7 \strokec7 AS\cf6 \strokec6  \cf6 \strokec11 row_num\cf6 \strokec6 \
  \cf7 \strokec7 FROM\cf6 \strokec6  \cf8 \strokec8 `industrial-silo-450608.2024_tripdata.combined_data`\cf6 \strokec6 \
\cf9 \strokec9 )\cf6 \strokec6 \
\cf7 \strokec7 SELECT\cf6 \strokec6  \cf9 \strokec9 *\cf6 \strokec6  \
\cf7 \strokec7 FROM\cf6 \strokec6  \cf6 \strokec11 RankedRows\cf6 \strokec6 \
\cf7 \strokec7 WHERE\cf6 \strokec6  \cf6 \strokec11 row_num\cf6 \strokec6  = \cf14 \strokec14 1\cf6 \strokec6 ;\cf10 \outl0\strokewidth0 \
\pard\pardeftab720\partightenfactor0
\cf6 \outl0\strokewidth0 \strokec6 \
\
\pard\pardeftab720\partightenfactor0
\cf10 \outl0\strokewidth0 -- rechecking for duplicate rows (0 duplicates)\
\
\pard\pardeftab720\partightenfactor0
\cf15 SELECT\cf16  \cf15 COUNT\cf17 (\cf16 ride_id\cf17 )\cf16  \cf17 -\cf16  \cf15 COUNT\cf17 (\cf15 DISTINCT\cf16  \cf16 ride_id\cf17 )\cf16  \cf15 AS\cf16  \cf16 duplicate_rows\cf16 \
\cf15 FROM\cf16  \cf18 `industrial-silo-450608.2024_tripdata.combined_data_distinct`}