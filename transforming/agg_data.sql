-- first, create aggregations for acquisitions data at the state and 3-digit zip level

DROP TABLE acq_state_agg_data;
CREATE TABLE acq_state_agg_data AS
SELECT 
	STATE,
	FRST_DTE_MTH,
	FRST_DTE_YR,
	count(*) AS NUM_LOANS,
	sum(ORIG_AMT) AS SUM_ORIG_AMT,
	avg(ORIG_AMT) AS AVG_ORIG_AMT,
	avg(ORIG_RT) AS AVG_ORIG_RT,
	sum(ORIG_AMT*ORIG_RT)/sum(case when ORIG_RT is null THEN 0 ELSE ORIG_AMT END) AS WAVG_ORIG_RT,
	avg(OLTV) AS AVG_OLTV,
	sum(ORIG_AMT*OLTV)/sum(case when OLTV is null THEN 0 ELSE ORIG_AMT END) AS WAVG_OLTV,
	avg(DTI) as AVG_DTI,
	sum(ORIG_AMT*DTI)/sum(case when DTI is null THEN 0 ELSE ORIG_AMT END) AS WAVG_DTI,
	avg(CSCORE_B) as AVG_CSCORE,
	sum(ORIG_AMT*CSCORE_B)/sum(ORIG_AMT) AS WAVG_CSCORE
from loan_acq_data
group by STATE, FRST_DTE_MTH, FRST_DTE_YR;

DROP TABLE acq_3zip_agg_data;
CREATE TABLE acq_3zip_agg_data AS
SELECT 
	ZIP_3,
	FRST_DTE_MTH,
	FRST_DTE_YR,
	count(*) AS NUM_LOANS,
	sum(ORIG_AMT) AS SUM_ORIG_AMT,
	avg(ORIG_AMT) AS AVG_ORIG_AMT,
	avg(ORIG_RT) AS AVG_ORIG_RT,
	sum(ORIG_AMT*ORIG_RT)/sum(case when ORIG_RT is null THEN 0 ELSE ORIG_AMT END) AS WAVG_ORIG_RT,
	avg(OLTV) AS AVG_OLTV,
	sum(ORIG_AMT*OLTV)/sum(case when OLTV is null THEN 0 ELSE ORIG_AMT END) AS WAVG_OLTV,
	avg(DTI) as AVG_DTI,
	sum(ORIG_AMT*DTI)/sum(case when DTI is null THEN 0 ELSE ORIG_AMT END) AS WAVG_DTI,
	avg(CSCORE_B) as AVG_CSCORE,
	sum(ORIG_AMT*CSCORE_B)/sum(ORIG_AMT) AS WAVG_CSCORE
from loan_acq_data
group by ZIP_3, FRST_DTE_MTH, FRST_DTE_YR;


-- next, create aggregations for performance data related to at the state and 3-digit zip level
-- counted as delinquent if over 30 days past due
DROP TABLE perf_state_agg_data;
CREATE TABLE perf_state_agg_data AS
SELECT 
	STATE,
	FRST_DTE_MTH,
	FRST_DTE_YR,
	RPT_PRD_MTH,
	RPT_PRD_YR,
	count(*) AS NUM_LOANS,
	sum(ORIG_AMT) AS SUM_ORIG_AMT,
	sum(LAST_UPB) AS SUM_UPB_AMT,
	avg(LAST_UPB) AS AVG_UPB_AMT,
	avg(LAST_RT) AS AVG_LAST_RT,
	sum(ORIG_AMT*LAST_RT)/sum(case when LAST_RT is null THEN 0 ELSE ORIG_AMT END) AS WORIG_AVG_LAST_RT,
	sum(LAST_UPB*LAST_RT)/sum(case when LAST_RT is null THEN 0 ELSE LAST_UPB END) AS WUPB_AVG_LAST_RT,
	sum(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END)/sum(case when DELQ_STATUS is null THEN 0 ELSE 1 END) AS AVG_DELQ_RT,
	sum(ORIG_AMT*(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END))/sum(case when DELQ_STATUS is null THEN 0 ELSE ORIG_AMT END) AS WORIG_AVG_DELQ_RT,
	sum(LAST_UPB*(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END))/sum(case when DELQ_STATUS is null THEN 0 ELSE LAST_UPB END) AS WUPB_AVG_DELQ_RT
from acq_perf_data
group by STATE, FRST_DTE_MTH, FRST_DTE_YR, RPT_PRD_MTH, RPT_PRD_YR;

DROP TABLE perf_3zip_agg_data;
CREATE TABLE perf_3zip_agg_data AS
SELECT 
	ZIP_3,
	FRST_DTE_MTH,
	FRST_DTE_YR,
	RPT_PRD_MTH,
	RPT_PRD_YR,
	count(*) AS NUM_LOANS,
	sum(ORIG_AMT) AS SUM_ORIG_AMT,
	sum(LAST_UPB) AS SUM_UPB_AMT,
	avg(LAST_UPB) AS AVG_UPB_AMT,
	avg(LAST_RT) AS AVG_LAST_RT,
	sum(ORIG_AMT*LAST_RT)/sum(case when LAST_RT is null THEN 0 ELSE ORIG_AMT END) AS WORIG_AVG_LAST_RT,
	sum(LAST_UPB*LAST_RT)/sum(case when LAST_RT is null THEN 0 ELSE LAST_UPB END) AS WUPB_AVG_LAST_RT,
	sum(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END)/sum(case when DELQ_STATUS is null THEN 0 ELSE 1 END) AS AVG_DELQ_RT,
	sum(ORIG_AMT*(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END))/sum(case when DELQ_STATUS is null THEN 0 ELSE ORIG_AMT END) AS WORIG_AVG_DELQ_RT,
	sum(LAST_UPB*(case when (DELQ_STATUS=0 OR DELQ_STATUS is null) THEN 0 ELSE 1 END))/sum(case when DELQ_STATUS is null THEN 0 ELSE LAST_UPB END) AS WUPB_AVG_DELQ_RT
from acq_perf_data
group by ZIP_3, FRST_DTE_MTH, FRST_DTE_YR, RPT_PRD_MTH, RPT_PRD_YR;