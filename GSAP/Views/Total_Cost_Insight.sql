Create View GSAP.Total_Cost_Insight AS
select c.*,c.final_amount/d.rate as converted_amount
from
(
SELECT Pelican.GSAP_PROD.*,
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