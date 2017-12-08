DROP TABLE loan_perf_data;
CREATE TABLE loan_perf_data AS
SELECT LOAN_ID, 
	cast(substr(MONTHLY_RPT_PRD,1,2) as smallint) as RPT_PRD_MTH,
	cast(substr(MONTHLY_RPT_PRD,7) as smallint) as RPT_PRD_YR, 
	cast(LAST_RT as decimal(4,3)) as LAST_RT,
	cast(LAST_UPB as bigint) as LAST_UPB, 
	cast(LOAN_AGE as smallint) as LOAN_AGE, 
	cast(MONS_TO_LEGAL_MAT as smallint) as MONS_TO_LEGAL_MAT,
	cast(DELQ_STATUS as smallint) as DELQ_STATUS, 
	MOD_FLAG,
	ZERO_BAL_CODE, 
	cast(substr(ZB_DTE, 1, 2)) AS ZB_DTE_MTH,
	cast(substr(ZB_DTE, 4)) AS ZB_DTE_YR,
	cast(substr(LPI_DTE,1,2) as smallint) as LPI_DTE_MTH,
	cast(substr(LPI_DTE,7) as smallint) as LPI_DTE_YR, 
	cast(NS_PROCS as bigint) as NS_PROCS, 
	"FANNIE_MAE" as AGENCY
from fannie_mae_perf
UNION ALL
SELECT 
	ID_loan as LOAN_ID, 
	cast(substr(Period,5) as smallint) as RPT_PRD_MTH, 
	cast(substr(Period,1,4) as smallint) as RPT_PRD_YR, 
	cast(New_Int_rt as decimal(4,3)) as LAST_RT,
	cast(Act_endg_upb as bigint) as LAST_UPB, 
	cast(loan_age as smallint) as LOAN_AGE, 
	cast(mths_remng as smallint) as MONS_TO_LEGAL_MAT,
	cast(delq_sts as smallint) as DELQ_STATUS, 
	flag_mod as MOD_FLAG,
	CD_Zero_BAL as ZERO_BAL_CODE, 
	cast(substr(Dt_zero_BAL,5) as smallint) as ZB_DTE_MTH, 
	cast(substr(Dt_zero_BAL,1,4) as smallint) as ZB_DTE_YR, 
	cast(substr(Dt_Lst_Pi,5) as smallint) as LPI_DTE_MTH, 
	cast(substr(Dt_Lst_Pi,1,4) as smallint) as LPI_DTE_YR, 
	cast(Net_Sale_Proceeds as bigint) as NS_PROCS, 
	"FREDDIE_MAC" as AGENCY
from freddie_mac_perf
