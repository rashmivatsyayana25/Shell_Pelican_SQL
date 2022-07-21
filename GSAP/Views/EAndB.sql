create view GSAP.EAndB as (
select monyr, cmp_country,
spend_variance_SnH - vol_impact_SnH cpl_Impact_SnH, 
spend_variance_PrimTrpt - vol_impact_primTrpt cpl_Impact_primTrpt, 
spend_variance_SecdTrpt - vol_impact_SecTrpt cpl_Impact_SecTrpt, 
spend_variance_exports - vol_impact_exports cpl_Impact_Exports, 
spend_variance_Total - vol_impact_Total cpl_Impact_Total, 
spend_variance_SnH, 
spend_variance_PrimTrpt, 
spend_variance_SecdTrpt, 
spend_variance_exports,
spend_variance_Total
from (select monyr, cmp_country, 
- plan_exports - actual_exports spend_variance_exports,
- plan_PrimTrpt - actual_PrimTrpt spend_variance_PrimTrpt,
- plan_SnH - actual_SnH spend_variance_SnH,
- plan_SecdTrpt - actual_SecdTrpt spend_variance_SecdTrpt,
- plan_total - actual_total spend_variance_Total
from (select monyr, cmp_country, sum(Amount_converted) actual_total,
sum(case when cost_head = 'Exports' then Amount_converted else 0 end) actual_Exports,
sum(case when cost_head = 'Prim.Trpt' then Amount_converted else 0 end) actual_PrimTrpt,
sum(case when cost_head = 'S&H' then Amount_converted else 0 end) actual_SnH,
sum(case when cost_head = 'Secd.Trpt' then Amount_converted else 0 end) actual_SecdTrpt
from (select left(document_posting_date, 6) monyr, cmp_country, cost_head, 
try_cast(case when cmp_currency <> currency_code then amt_in_loc_currency_decimal_shift else AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT end as decimal(12,2)) / RATE Amount_converted
from [Pelican].[GSAP_PROD] 
left join gsap.cost_head on sfs_line_item = op_segment
left join gsap.fx_rates on case when cmp_currency <> currency_code then local_currency else currency_code end = CURRENCY
where op_segment is not null
and CURRENCY is not null) ss1
group by monyr, cmp_country) actual_cost
left join (select [tariff/exp], country, sum(try_cast(LC as decimal(12,2)) / rate) plan_total,
sum(case when [cost head] = 'Exports' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_Exports,
sum(case when [cost head] = 'Prim.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_PrimTrpt,
sum(case when [cost head] = 'S&H' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SnH,
sum(case when [cost head] = 'Secd.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SecdTrpt
from gsap.cost_plan
left join gsap.fx_rates on [local currency] = CURRENCY 
where currency is not NULL
group by [tariff/exp], country) plan_cost on monyr = [tariff/exp] and cmp_country = country) spendVar 
left join (select plan5.plan_actual, plan5.country, 
(plan5.total - (actual.total * 1000000)) * (- plan_Total / plan5.total) vol_impact_Total, 
(plan5.total - (actual.total * 1000000)) * (- plan_Exports / plan5.total) vol_impact_exports, 
(plan5.total - (actual.total * 1000000)) * (- plan_PrimTrpt / plan5.total) vol_impact_primTrpt, 
(plan5.total - (actual.total * 1000000)) * (- plan_SnH / plan5.total) vol_impact_SnH, 
(plan5.total - (actual.total * 1000000)) * (- plan_SecdTrpt / plan5.total) vol_impact_SecTrpt
from gsap.supply_volume_plan plan5
left join GSAP.Supply_Volume_actual actual on plan5.plan_actual = actual.period and plan5.country = actual.country
Left join (select [tariff/exp], country, sum(try_cast(LC as decimal(12,2)) / rate) plan_Total,
sum(case when [cost head] = 'Exports' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_Exports,
sum(case when [cost head] = 'Prim.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_PrimTrpt,
sum(case when [cost head] = 'S&H' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SnH,
sum(case when [cost head] = 'Secd.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SecdTrpt
from gsap.cost_plan
left join gsap.fx_rates on [local currency] = CURRENCY 
where currency is not NULL
group by [tariff/exp], country) pc on plan5.plan_actual = pc.[tariff/exp] and plan5.country = pc.country
where plan5.plan_actual like '%2022%'
and actual.period is not null
And pc.[tariff/exp] is not null) volImpact on spendVar.monyr = volImpact.plan_actual and spendVar.cmp_country = volImpact.country
)