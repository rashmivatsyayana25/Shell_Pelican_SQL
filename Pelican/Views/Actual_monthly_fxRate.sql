create View Pelican.Actual_monthly_fxRate as
select monyr, cmp_country, sum(amount_converted) Actual_Cost_Actual_FX,CH_Cost_Head
from (select left(document_posting_date, 6) monyr, cmp_country, Pelican.GSAP_PROD.CH_Cost_Head,
try_cast(case when cmp_currency <> currency_code then amt_in_loc_currency_decimal_shift else AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end as decimal(12,2)) / final_rate Amount_converted
from [Pelican].[GSAP_PROD]
left join (select 99999999 - CURRENCY_CONVERSION_VALID_FROM_DATE rate_date, 1 / try_cast(currency_conversion_exchange_rate as decimal(6,4)) final_rate, *
from Pelican.Actual_Fx_curr_convert
where left(99999999 - CURRENCY_CONVERSION_VALID_FROM_DATE, 4) = '2022'
and currency_conversion_to_currency_code = 'USD'
and currency_conversion_exchange_rate_type = '002M'
and currency_conversion_from_currency_code in ('EUR', 'CHF', 'GBP', 'TRY', 'PLN', 'CZK', 'RUB', 'ZAR', 'OMR', 'EGP', 'AED')) actual_FX
on left(document_posting_date, 6) = left(99999999 - CURRENCY_CONVERSION_VALID_FROM_DATE, 6)
and case when cmp_currency <> currency_code then local_currency else currency_code end = currency_conversion_from_currency_code
where currency_conversion_from_currency_code is not null) ss1
group by monyr, cmp_country,CH_Cost_Head