DROP TABLE loan_perf_data;
CREATE TABLE loan_perf_data AS
SELECT LOAN_ID, MONTHLY_RPT_PRD, LAST_RT,
LAST_UPB, LOAN_AGE, MONS_TO_LEGAL_MAT,
MATURITY_DATE, MSA, DELQ_STATUS, MOD_FLAG, 
ZERO_BAL_CODE, ZB_DTE, LPI_DTE,
PP_COST, NS_PROCS, PRIN_FORG_UPB_OTH,
"FANNIE_MAE" as AGENCY
from fannie_mae_perf
UNION ALL
SELECT fred_p.ID_loan as LOAN_ID, Period as MONTHLY_RPT_PRD, New_Int_rt as LAST_RT,
Act_endg_upb as LAST_UPB, loan_age as LOAN_AGE, mths_remng as MONS_TO_LEGAL_MAT,
dt_matr as MATURITY_DATE, cd_msa as MSA, delq_sts as DELQ_STATUS, flag_mod as MOD_FLAG, 
CD_Zero_BAL as ZERO_BAL_CODE, Dt_zero_BAL as ZB_DTE, Dt_Lst_Pi as LPI_DTE,
maint_pres_costs as PP_COST, Net_Sale_Proceeds as NS_PROCS, actual_loss as PRIN_FORG_UPB_OTH,
"FREDDIE_MAC" as AGENCY
from freddie_mac_perf fred_p 
left join freddie_mac_acq fred_a on fred_p.ID_loan = fred_a.id_loan

