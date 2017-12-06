DROP TABLE acq_perf_data;
CREATE TABLE acq_perf_data AS
SELECT acq.*, perf.* from loan_acq_data acq
JOIN loan_perf_data perf on acq.LOAN_ID = perf.LOAN_ID
