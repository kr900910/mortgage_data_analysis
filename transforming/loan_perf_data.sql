DROP TABLE loan_perf_data;
CREATE TABLE loan_perf_data AS
SELECT LOAN_ID, 
	to_date(MONTHLY_RPT_PRD) as MONTHLY_RPT_PRD, 
	LAST_RT,
	LAST_UPB, 
	LOAN_AGE, 
	MONS_TO_LEGAL_MAT,
	DELQ_STATUS, 
	MOD_FLAG,
	ZERO_BAL_CODE, 
	to_date(ZB_DTE) as ZB_DTE, 
	to_date(LPI_DTE) as LPI_DTE,
	NS_PROCS, 
	"FANNIE_MAE" as AGENCY
from fannie_mae_perf
UNION ALL
SELECT 
	fred_p.ID_loan as LOAN_ID, 
	to_date(Period) as MONTHLY_RPT_PRD, 
	New_Int_rt as LAST_RT,
	Act_endg_upb as LAST_UPB, 
	loan_age as LOAN_AGE, 
	mths_remng as MONS_TO_LEGAL_MAT,
	delq_sts as DELQ_STATUS, 
	flag_mod as MOD_FLAG,
	CD_Zero_BAL as ZERO_BAL_CODE, 
	to_date(Dt_zero_BAL) as ZB_DTE, 
	to_date(Dt_Lst_Pi) as LPI_DTE,
	Net_Sale_Proceeds as NS_PROCS, 
	"FREDDIE_MAC" as AGENCY
from freddie_mac_perf fred_p
