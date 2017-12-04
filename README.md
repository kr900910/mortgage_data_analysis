## Mortgage Data Analysis

# Inital Setup
1. Register for Fannie Mae: https://loanperformancedata.fanniemae.com/lppub/index.html#
2. Register for Freddie Mac: https://freddiemac.embs.com/FLoan/Bin/loginrequest.php
3. Pull W205/mortgage-data-analysis repository in EC2 instance.
4. Create directories inside * W205/mortgage-data-analysis:
- /data/fannie-mae/acq/
- /data/fannie-mae/perf/
- /data/freddie-mac/acq/
- /data/freddie-mac/perf/
- /temp_download

# Download the data into the downloading folder
5. Go to * W205/mortgage-data-analysis/downloading, and pip install requests==2.5.3
6. Type `python download_freddie_mac.py`. Enter credentials and quarters to download when prompted. This downloads zip files into the current folder for each quarter
7. Type `python download_fannie_mae.py`. Enter credentials and quarters to download when prompted. This downloads zip files into the current folder for each quarter

# Move the data into HDFS directory
8. Start Hadoop, postgres, Hive in EC2 instance. Type `su - w205`. This changes the user
9. Go to * W205/mortgage-data-analysis/loading_and_modeling
10. If this is your first time, type `. create_hdfs_dir.sh`. This creates necessary HDFS folders.
NOTE: FOR THIS STEP I HAD TO BE w205 USER OR ELSE I HAD PERMISSION ISSUES: Type `su - w205`. This changes the user
11. Move zip files for a particular year and quarter from * W205/mortgage-data-analysis/downloading into * W205/mortgage-data-analysis/temp_download. Return to the loading_and_modeling directory
NOTE:NEED TO CHECK WHETHER THIS WORKS AS w205 USER OR HAVE TO BE ROOT
12. Type `. unzip_to_HDFS.sh $1 $2`, where $1 is the year (e.g., 2015) and $2 is the quarter (e.g., 1). This unzips files, moves them to permanent file location, loads data into HDFS, and removes the zip files.
NOTE: FOR THIS STEP I THINK I HAVE TO BE ROOT TO UNZIP/CREATE FILES
13. Repeat steps 11-12 until you have unzipped and loaded all quarters of data

# Create Hive tables
14. Go to * W205/mortgage-data-analysis/transforming and type `. create_hive_tables.sh`. This creates Hive metadata for base Fannie and Freddie data in hdfs and for the combined data sets
