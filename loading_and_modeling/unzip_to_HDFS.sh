#!/bin/sh

# for unzipping, moving, and HDFS loading Fannie Mae & Freddie Mac files
# Freddie Acquisition_$1.txt has no headings
# Freddie Performance__$1.txt has no headings
# if unzip not installed, $ sudo apt-get install unzip

# Fannie MUST BE in format <year>Q<quarter>  example: 2013Q1
# Freddie MUST BE in the format Q<quarter><year> example Q12013

######
## UNZIP FILES ##
######

#unzip all files
unzip '*.zip' -d ../temp_download

# deletes zip files after unzipping it
rm *.zip

# move to temp_download directory
cd ../temp_download

######
## load Fannie data to HDFS
######

# FANNIE MAE performance data
sudo -u hdfs hdfs dfs -put Performance_*.txt /user/mortgage-data-analysis/data/fannie-mae/perf

# FREDDIE MAC performance data
sudo -u hdfs hdfs dfs -put historical_data1_time_*.txt /user/mortgage-data-analysis/data/freddie-mac/perf

# FANNIE MAE acquisition data
sudo -u hdfs hdfs dfs -put Acquisition_*.txt /user/mortgage-data-analysis/data/fannie-mae/acq

# FREDDIE MAC acquisition data
sudo -u hdfs hdfs dfs -put historical_data1_Q*.txt /user/mortgage-data-analysis/data/freddie-mac/acq

echo "HDFS data loading complete!"

# once loaded, wipe from folder
rm *.txt

cd ../loading_and_modeling

echo "txt files deleted from temp_download directory"

