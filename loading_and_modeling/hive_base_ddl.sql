DROP TABLE fannie_mae_acq;
CREATE EXTERNAL TABLE fannie_mae_acq
(
  LOAN_ID string,
  ORIG_CHN string,
  SELLER_NAME string,
  ORIG_RT string,
  ORIG_AMT string,
  ORIG_TRM string,
  ORIG_DTE string,
  FRST_DTE string,
  OLTV string,
  OCLTV string,
  NUM_BO string,
  DTI string,
  CSCORE_B string,
  FTHB_FLG string,
  PURPOSE string,
  PROP_TYP string,
  NUM_UNIT string,
  OCC_STAT string,
  STATE string,
  ZIP_3 string,
  MI_PCT string,
  PRODUCT_TYPE string,
  CSCORE_C string,
  MI_TYPE string,
  RELOCATION_FLG string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/mortgage-data-analysis/data/fannie-mae/acq';

DROP TABLE fannie_mae_perf;
CREATE EXTERNAL TABLE fannie_mae_perf
(
  LOAN_ID string,
  MONTHLY_RPT_PRD string,
  SERVICER_NAME string,
  LAST_RT string,
  LAST_UPB string,
  LOAN_AGE string,
  MONS_TO_LEGAL_MAT string,
  ADJ_MONTH_TO_MAT string,
  MATURITY_DATE string,
  MSA string,
  DELQ_STATUS string,
  MOD_FLAG string,
  ZERO_BAL_CODE string,
  ZB_DTE string,
  LPI_DTE string,
  FCC_DTE string,
  DISP_DT string,
  FCC_COST string,
  PP_COST string,
  AR_COST string,
  IE_COST string,
  TAX_COST string,
  NS_PROCS string,
  CE_PROCS string,
  RMW_PROCS string,
  O_PROCS string,
  NON_INT_UPB string,
  PRIN_FORG_UPB_FHFA string,
  REPCH_FLAG string,
  PRIN_FORG_UPB_OTH string,
  TRANSFER_FLAG string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/mortgage-data-analysis/data/fannie-mae/perf';

DROP TABLE freddie_mac_acq;
CREATE EXTERNAL TABLE freddie_mac_acq
(
  fico string,
  dt_first_pi string,
  flag_fthb string,
  dt_matr string,
  cd_msa string,
  mi_pct string,
  cnt_units string,
  occpy_sts string,
  cltv string,
  dti string,
  orig_upb string,
  ltv string,
  int_rt string,
  channel string,
  ppmt_pnlty string,
  prod_type string,
  st string,
  prop_type string,
  zipcode string,
  id_loan string,
  loan_purpose string,
  orig_loan_term string,
  cnt_borr string,
  seller_name string,
  servicer_name string,
  super_conform_flag string,
  pre_harp_loan_num string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/mortgage-data-analysis/data/freddie-mac/acq';

DROP TABLE freddie_mac_perf;
CREATE EXTERNAL TABLE freddie_mac_perf
(
  ID_loan string,
  Period string,
  Act_endg_upb string,
  delq_sts string,
  loan_age string,
  mths_remng string,
  repch_flag string,
  flag_mod string,
  CD_Zero_BAL string,
  Dt_zero_BAL string,
  New_Int_rt string,
  Amt_Non_Int_Brng_Upb string,
  Dt_Lst_Pi string,
  MI_Recoveries string,
  Net_Sale_Proceeds string,
  Non_MI_Recoveries string,
  Expenses string,
  legal_costs string,
  maint_pres_costs string,
  taxes_ins_costs string,
  misc_costs string,
  actual_loss string,
  modcost string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/mortgage-data-analysis/data/freddie-mac/perf';
