create view Pelican.monthlyRate as
select 99999999 - CURRENCY_CONVERSION_VALID_FROM_DATE rate_date, 1 / try_cast(currency_conversion_exchange_rate as decimal(6,4)) final_rate, *
from Pelican.Monthly_FxRate
where left(99999999 - CURRENCY_CONVERSION_VALID_FROM_DATE, 6) = '202206'
and currency_conversion_to_currency_code = 'USD'
and currency_conversion_exchange_rate_type = '002M'
and currency_conversion_from_currency_code in ('EUR', 'CHF', 'GBP', 'TRY', 'PLN', 'CZK', 'RUB', 'ZAR', 'OMR', 'EGP', 'AED')
