## Mortgage Data Analysis

# Inital Setup
1. Register for Fannie Mae: https://loanperformancedata.fanniemae.com/lppub/index.html#.
2. Register for Freddie Mac: https://freddiemac.embs.com/FLoan/Bin/loginrequest.php.
3. Pull mortgage-data-analysis repository in EC2 instance (`git clone https://github.com/kr900910/mortgage-data-analysis.git`).
4. Create temp_download directory inside mortgage-data-analysis (`mkdir temp_download`).

# Download the data
5. Go to mortgage-data-analysis/loading_and_modeling, and `pip install requests==2.5.3`.
6. Type `python download_freddie_mac.py`. Enter credentials and quarters to download when prompted. This downloads zip files into the current folder for each quarter.
7. Type `python download_fannie_mae.py`. Enter credentials and quarters to download when prompted. This downloads zip files into the current folder for each quarter.

# Move the data into HDFS directory
8. Start Hadoop, postgres, and Hive in EC2 instance.
10. If this is your first time, type `. create_hdfs_dir.sh`. This creates necessary HDFS folders.
11. Type `. unzip_to_HDFS.sh`. This unzips the zipped files into mortgage-data-analysis/temp_download, removes the zipped files, loads unzipped files to HDFS, and removes the unzipped files. Note that this step can take 15-30 minutes depending on number of quarters being loaded.

# Create Hive tables
14. Go to mortgage-data-analysis/transforming and type `. create_hive_tables.sh`. This creates Hive metadata for base Fannie and Freddie data in hdfs and for the combined data sets.