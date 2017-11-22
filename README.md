## Mortgage Data Analysis

1. Download the latest quarter data from Fannie Mae and Freddie Mac.
2. Open EC2 instance, and run all necessary items (Hadoop, postgres, Hive).
3. Transfer the downloaded files to EC2 instance using the below command. Make sure you change PEM file name/location, local directory which has data, 
EC2 machine name, and target directory in EC2. 
```
scp -i foo.pem ~/data/Performance_2016Q3.txt root@ec2-54-211-52-45.compute-1.amazonaws.com:~/data/
```

4. Pull W205/mortgage-data-analysis repository in EC2 instance.

5. Store transferred data as below:
* W205/mortgage-data-analysis/data/fannie-mae/acq/Acquisition_2016Q3.txt
* W205/mortgage-data-analysis/data/fannie-mae/perf/Performance_2016Q3.txt
* W205/mortgage-data-analysis/data/freddie-mac/acq/historical_data1_Q32016.txt
* W205/mortgage-data-analysis/data/freddie-mac/perf/historical_data1_time_Q32016.txt

6. Go to loading_and_modeling folder, and type `. create_hdfs_dir.sh`. This creates necessary HDFS folders.

7. Type `. load_data_lake.sh`. This loads data into HDFS.

8. Type `hive -f hive_base_ddl.sql`. This create Hive metadata for fannie_mae_acq, fannie_mae_perf, freddie_mac_acq, and freddie_mac_perf.

9. Go to transforming folder, and type `hive -f loan_acq_data.sql`. This creates Hive metadata for loan_acq_data which
combines fannie_mae_acq and freddie_mac_acq.

10. Type `hive -f loan_perf_data.sql`. This creates Hive metadata for loan_perf_data which combines fannie_mae_perf and freddie_mac_perf.
