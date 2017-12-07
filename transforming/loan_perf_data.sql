DROP TABLE loan_perf_data;
CREATE TABLE loan_perf_data AS
SELECT LOAN_ID, 
	to_date(MONTHLY_RPT_PRD) as MONTHLY_RPT_PRD, 
	cast(LAST_RT as decimal(4,3)) as LAST_RT,
	cast(LAST_UPB as bigint) as LAST_UPB, 
	cast(LOAN_AGE as smallint) as LOAN_AGE, 
	cast(MONS_TO_LEGAL_MAT as smallint) as MONS_TO_LEGAL_MAT,
	cast(DELQ_STATUS as smallint) as DELQ_STATUS, 
	MOD_FLAG,
	ZERO_BAL_CODE, 
	to_date(ZB_DTE) as ZB_DTE, 
	to_date(LPI_DTE) as LPI_DTE,
	cast(NS_PROCS as bigint) as NS_PROCS, 
	"FANNIE_MAE" as AGENCY
from fannie_mae_perf
UNION ALL
SELECT 
	ID_loan as LOAN_ID, 
	to_date(Period) as MONTHLY_RPT_PRD, 
	cast(New_Int_rt as decimal(4,3)) as LAST_RT,
	cast(Act_endg_upb as bigint) as LAST_UPB, 
	cast(loan_age as smallint) as LOAN_AGE, 
	cast(mths_remng as smallint) as MONS_TO_LEGAL_MAT,
	cast(delq_sts as smallint) as DELQ_STATUS, 
	flag_mod as MOD_FLAG,
	CD_Zero_BAL as ZERO_BAL_CODE, 
	to_date(Dt_zero_BAL) as ZB_DTE, 
	to_date(Dt_Lst_Pi) as LPI_DTE,
	cast(Net_Sale_Proceeds as bigint) as NS_PROCS, 
	"FREDDIE_MAC" as AGENCY
from freddie_mac_perf
