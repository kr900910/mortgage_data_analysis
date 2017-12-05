#!/bin/sh

# for unzipping, moving, and HDFS loading Fannie Mae & Freddie Mac files
# Freddie Acquisition_$1.txt has no headings
# Freddie Performance__$1.txt has no headings
# if unzip not installed, $ sudo apt-get install unzip

# $1 is YEAR
# $2 is QUARTER 

# Fannie MUST BE in format <year>Q<quarter>  example: 2013Q1
# Freddie MUST BE in the format Q<quarter><year> example Q12013

######
## UNZIP FILES ##
######

#unzip Fannie
unzip $1Q$2.zip ~/W205/mortgage-data-analysis/temp_data

# unzip Freddie
unzip *Q$2$1.zip ~/W205/mortgage-data-analysis/temp_data

# deletes zip files after unzipping it
rm *.zip

######
## load Fannie data to HDFS
######

# FANNIE MAE performance data
hdfs dfs -put ~/W205/mortgage-data-analysis/temp_data/Performance_*.txt /user/w205/mortgage-data-analysis/data/fannie-mae/perf

# FREDDIE MAC performance data
hdfs dfs -put ~/W205/mortgage-data-analysis/data/freddie-mac/perf/historical_data1_*.txt /user/w205/mortgage-data-analysis/data/freddie-mac/perf

# FANNIE MAE acquisition data
hdfs dfs -put ~/W205/mortgage-data-analysis/data/fannie-mae/acq/Acquisition_*.txt /user/w205/mortgage-data-analysis/data/fannie-mae/acq

# FREDDIE MAC acquisition data
hdfs dfs -put ~/W205/mortgage-data-analysis/data/freddie-mac/acq/historical_data1_time_*.txt /user/w205/mortgage-data-analysis/data/freddie-mac/acq

# once loaded, wipe from folder

rm Performance_$1Q$2.txt
rm Acquisition_$1Q$2.txt

rm *_data1_Q$2$1.txt
rm *_data1_time_Q$2$1.txt
