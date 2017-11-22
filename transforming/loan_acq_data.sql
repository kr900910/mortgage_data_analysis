DROP TABLE loan_acq_data;
CREATE TABLE loan_acq_data AS
SELECT LOAN_ID, ORIG_CHN, SELLER_NAME, 
ORIG_RT, ORIG_AMT, ORIG_TRM, FRST_DTE,
OLTV, OCLTV, NUM_BO, DTI, CSCORE_B, 
FTHB_FLG, PURPOSE, PROP_TYP, NUM_UNIT,
OCC_STAT, STATE, ZIP_3, MI_PCT, PRODUCT_TYPE, 
"FANNIE_MAE" as AGENCY
from fannie_mae_acq
UNION ALL
SELECT id_loan as LOAN_ID, channel as ORIG_CHN, seller_name as SELLER_NAME, 
int_rt as ORIG_RT, orig_upb as ORIG_AMT, orig_loan_term as ORIG_TRM, dt_first_pi as FRST_DTE,
ltv as OLTV, cltv as OCLTV, cnt_borr as NUM_BO, dti as DTI, fico as CSCORE_B, 
flag_fthb as FTHB_FLG, loan_purpose as PURPOSE, prop_type as PROP_TYP, cnt_units as NUM_UNIT,
occpy_sts as OCC_STAT, st as STATE, zipcode as ZIP_3, mi_pct as MI_PCT, prod_type as PRODUCT_TYPE,
"FREDDIE_MAC" as AGENCY
from freddie_mac_acq
