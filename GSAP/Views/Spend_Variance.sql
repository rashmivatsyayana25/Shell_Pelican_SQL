create view GSAP.Spend_Variance as (
select A1.monyr, A1.cmp_country, A1.actual_amount_coverted, A2.plan_amount_converted, A2.plan_amount_converted - A1.actual_amount_coverted Spend_variance
from
(select monyr, cmp_country, sum(amount_coverted) actual_amount_coverted
from
(select ss1.* , FX_RATES.RATE, try_cast(amount_final as decimal(12,2)) / FX_RATES.RATE amount_coverted
from
(select
cmp_country, left(document_posting_date, 6) monyr,
cmp_currency, currency_code, local_currency, amt_in_loc_currency_decimal_shift, AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT,
case when cmp_currency <> currency_code then local_currency else currency_code end curr_code_final,
case when cmp_currency <> currency_code then amt_in_loc_currency_decimal_shift else AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end amount_final
from [Pelican].[GSAP_PROD]) ss1
left join gsap.fx_rates on ss1.curr_code_final = fx_rates.CURRENCY) ss2
group by monyr, cmp_country) A1
left join (select right([Period/Year], 4) + substring([Period/Year], 2, 2) monyr, country, -sum(try_cast(LC as decimal(12,2)) / fx_rates.RATE) plan_amount_converted
from gsap.COST_PLAN
left join gsap.fx_rates on [Local Currency] = fx_rates.CURRENCY
where right([Period/Year], 4) + substring([Period/Year], 2, 2) < '202207'
group by right([Period/Year], 4) + substring([Period/Year], 2, 2), country) A2 on A1.CMP_Country = A2.Country and A1.monyr = A2.monyr
)