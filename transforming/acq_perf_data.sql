DROP TABLE acq_perf_data;
CREATE TABLE acq_perf_data AS
SELECT acq.*, 
	perf.RPT_PRD_MTH,
	perf.RPT_PRD_YR,
	perf.LAST_RT,
	perf.LAST_UPB,
	perf.LOAN_AGE, 
	perf.MONS_TO_LEGAL_MAT,
	perf.DELQ_STATUS, 
	perf.MOD_FLAG,
	perf.ZERO_BAL_CODE, 
	perf.ZB_DTE_MTH,
	perf.ZB_DTE_YR, 
	perf.LPI_DTE_MTH,
	perf.LPI_DTE_YR,
	perf.NS_PROCS, 
	perf.AGENCY as PERF_AGENCY
from loan_acq_data acq
JOIN loan_perf_data perf 
	on acq.LOAN_ID = perf.LOAN_ID
