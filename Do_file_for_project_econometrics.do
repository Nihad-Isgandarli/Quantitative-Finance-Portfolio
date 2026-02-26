import delimited "dataset_2025-12-05T20_22_34.278828323Z_DEFAULT_INTEGRATION_IMF.STA_MFS_DC_8.0.0.csv", clear varnames(1) encoding(UTF-8)
import delimited "/Users/nihadisgenderli/Downloads/dataset_2025-12-05T20_22_34.278828323Z_DEFAULT_INTEGRATION_IMF.STA_MFS_DC_8.0.0.csv", clear varnames(1) encoding(UTF-8)
describe
rename ındıcator        indicator
rename tıme_perıod      time_period
rename precısıon        precision
rename decımals_dısp~d  decimals_displayed
rename derıvatıon_type  derivation_type
rename access_sharın~l  access_sharing_level
rename access_sharın~s  access_sharing_notes
rename securıty_clas~n  security_classification
keep country time_period obs_value
order country time_period obs_value
describe
list in 1/10
gen tq = quarterly(time_period, "YQ")
format tq %tq

tsset country_id tq, quarterly
drop tq
gen tq = quarterly(time_period, "YQ")
format tq %tq
list country time_period tq obs_value in 1/10
drop country_id

encode country, gen(country_id)
tsset country_id tq, quarterly


list country tq obs_value m2_growth in 1/12
tsline obs_value, by(country)
tsline m2_growth, by(country)
drop country_id
encode country
sort country_id tq
reg m2_growth L.m2_growth i.country_id
reg m2_growth L.m2_growth i.country_id, robust

encode country, gen(country_id)üxtset country_id quarter
gen qdate = quarterly(time_period, "YQ")
format qdate %tq
gen m2_growth = (obs_value - L.obs_value) / L.obs_value
format m2_growth %9.3f

tsset country_id qdate
newey m2_growth L.m2_growth i.country_id, lag(1)
predict uhat, resid
reg uhat L.uhat
estat vif

gen ln_m2 = ln(obs_value)
gen dln_m2 = D.ln_m2
reg dln_m2 L.dln_m2 i.country_id, robust
reg dln_m2 L.dln_m2 i.country_id
estat hettest

capture drop uhat

predict uhat, resid
reg uhat L.uhat

estat vif
reg m2_growth L.m2_growth i.country_id, robust
reg dln_m2 L.dln_m2 i.country_id, robust

xtline dln_m2, overlay
reg dln_m2 L.dln_m2 i.country_id, robust noheader
display "Heteroskedasticity: YES (BP p ≈ 0)"
display "Autocorrelation: NO (p ≈ 0.78)"
display "Multicollinearity: NO (VIF = 1.00)"
display "Robust SE used: YES"

















