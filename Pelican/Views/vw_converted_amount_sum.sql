create view pelican.vw_converted_amount_sum as
select d.cmp_country,d.year_month,sum(converted_amount) as converted_amount_sum from
(
select c.*,c.final_amount/d.rate as converted_amount
from
(
SELECT 
A.[ACCOUNTING_DOC_LINE_ITEM_NO],A.[AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT],
A.[BSEG_GENERAL_LEDGER_ACCOUNT_2],A.[COMPANY_CODE],A.[COMPANY_CODE_DESCRIPTION],
A.[COMPANY_COUNTRY_CODE],A.[COST_CENTER],A.[COST_CENTER_LONG_TEXT],                          
A.[COST_ELEMENT],A.[COST_ELEMENT_LONG_TEXT],A.cmp_country,A.[CURRENCY_CODE],
A.[DOCUMENT_DATE],A.[DOCUMENT_HEADER_TEXT],A.[DOCUMENT_POSTING_PERIOD],
A.[DOCUMENT_TYPE],A.[DOCUMENT_TYPE_DESC],
A.[PROFIT_CENTER],A.[PROFIT_CENTER_LONG_TEXT],A.[SFS_LINE_ITEM],A.[T001_COMPANY_CODE],
A.[T001W_PLANT_CODE],A.[T003T_DOCUMENT_TYPE_CODE],
A.[T005T_COUNTRY_CODE],A.[T005T_COUNTRY_NAME],
left(A.document_posting_date, 6) as year_month,
case 
when A.currency_code <> b.currency then A.LOCAL_CURRENCY else A.currency_code 
end as Final_Currency_Code,
round(case when B.currency <> A.currency_code then A.amt_in_loc_currency_decimal_shift
else A.AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end,2) as final_amount
FROM Pelican.GSAP_PROD A 
left join GSAP.Company B 
on A.company_code = B.company_code 
and A.cmp_country = B.country
)c
left join
gsap.fx_rates d
on c.currency_code = d.currency
)d
group by d.cmp_country,d.year_month
--order by d.cmp_country,d.year_month 

