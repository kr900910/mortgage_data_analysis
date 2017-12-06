# shell script to run hive queries to create base and hive tables and transform them

# Switch to folder with base hive ddl script
cd ../loading_and_modeling

# This creates Hive metadata for fannie_mae_acq, fannie_mae_perf, freddie_mac_acq, and freddie_mac_perf
hive -f hive_base_ddl.sql

# Switch back to transformations folder for manipulating the base hdfs data
cd ../transforming

# This create Hive metadata for loan_acq_data which combines fannie_mae_acq and freddie_mae_acq
hive -f loan_acq_data.sql

# This create Hive metadata for loan_perf_data which combines fannie_mae_perf and freddie_mae_perf
hive -f loan_perf_data.sql

# This merges the acquisitions and performance data into a single table
hive -f acq_perf_data.sql