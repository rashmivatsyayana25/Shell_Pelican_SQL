Create View GSAP.FB3LN_FxRate AS 
select e.*,e.converted_amount/e.rate as spend_variance 
from(
select c.*,d.rate,c.final_amount/d.rate as converted_amount
from
(
SELECT Pelican.GSAP_PROD.[ACCOUNTING_DOC_LINE_ITEM_NO],Pelican.GSAP_PROD.[AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT],Pelican.GSAP_PROD.[BSEG_GENERAL_LEDGER_ACCOUNT_2],Pelican.GSAP_PROD.[COMPANY_CODE],Pelican.GSAP_PROD.[COMPANY_CODE_DESCRIPTION],Pelican.GSAP_PROD.[COMPANY_COUNTRY_CODE],Pelican.GSAP_PROD.[COST_CENTER],Pelican.GSAP_PROD.[COST_CENTER_LONG_TEXT]                          
,Pelican.GSAP_PROD.[COST_ELEMENT],Pelican.GSAP_PROD.[COST_ELEMENT_LONG_TEXT],Pelican.GSAP_PROD.[COST_ELEMENT_SHORT_TEXT],Pelican.GSAP_PROD.[COUNTRY],Pelican.GSAP_PROD.[CURRENCY_CODE],Pelican.GSAP_PROD.[DOCUMENT_DATE],Pelican.GSAP_PROD.[DOCUMENT_HEADER_TEXT]                                  
,Pelican.GSAP_PROD.[DOCUMENT_POSTING_DATE],Pelican.GSAP_PROD.[DOCUMENT_TYPE],Pelican.GSAP_PROD.[DOCUMENT_TYPE_DESC]
,Pelican.GSAP_PROD.[PROFIT_CENTER]                                  
,Pelican.GSAP_PROD.[PROFIT_CENTER_LONG_TEXT],Pelican.GSAP_PROD.[SFS_LINE_ITEM],Pelican.GSAP_PROD.[T001_COMPANY_CODE],Pelican.GSAP_PROD.[T001W_PLANT_CODE],Pelican.GSAP_PROD.[T003T_DOCUMENT_TYPE_CODE],
Pelican.GSAP_PROD.[T005T_COUNTRY_CODE],Pelican.GSAP_PROD.[T005T_COUNTRY_NAME],GSAP.Company.Country as cmp_Country,
left(Pelican.GSAP_PROD.document_posting_date, 6) as year_month,
case when GSAP.Company.currency <> Pelican.GSAP_PROD.currency_code then Pelican.GSAP_PROD.LOCAL_CURRENCY else Pelican.GSAP_PROD.currency_code end as Final_Currency_Code,
round(case when GSAP.Company.currency <> Pelican.GSAP_PROD.currency_code then Pelican.GSAP_PROD.amt_in_loc_currency_decimal_shift
else Pelican.GSAP_PROD.AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end,2)
as final_amount
FROM Pelican.GSAP_PROD
left join GSAP.Company on Pelican.GSAP_PROD.company_code = GSAP.Company.company_code
)c
left join
gsap.fx_rates d
on c.currency_code = d.currency
)e