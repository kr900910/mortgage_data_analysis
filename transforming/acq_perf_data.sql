DROP TABLE acq_perf_data;
CREATE TABLE acq_perf_data AS
SELECT * from loan_perf_data perf
JOIN loan_acq_data acq on perf.LOAN_ID = acq.LOAN_ID
