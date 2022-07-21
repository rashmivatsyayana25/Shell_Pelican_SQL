create View Pelican.Waterfall_Home as
select monYr, country, cost_head, flg, sum(amount_converted) LC_converted
from (select [tariff/exp] monYr, country, 'Plan' flg, [cost head] cost_head, -try_cast(LC as decimal(12,2)) / rate amount_converted
from gsap.cost_plan
left join gsap.fx_rates on [local currency] = CURRENCY
where currency is not NULL
UNION
select left(document_posting_date, 6) monYr, cmp_country country, 'Actual' flg, cost_head,
try_cast(case when cmp_currency <> currency_code then amt_in_loc_currency_decimal_shift else AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end as decimal(12,2)) / RATE amount_converted
from [Pelican].[GSAP_PROD]
left join gsap.cost_head on sfs_line_item = op_segment
left join gsap.fx_rates on case when cmp_currency <> currency_code then local_currency else currency_code end = CURRENCY
where op_segment is not null
and CURRENCY is not null) ss1
group by monYr, country, flg, cost_head