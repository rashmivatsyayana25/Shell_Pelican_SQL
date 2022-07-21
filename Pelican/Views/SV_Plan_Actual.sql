create view Pelican.SV_Plan_Actual as(
select plan5.plan_actual as Actual_Period, plan5.country,pc.[Cost Head],(actual.total * 1000000) as Actual_total, plan5.total as Plan_total, (plan5.total - (actual.total * 1000000)) vol_total_diff,
(plan5.total - (actual.total * 1000000)) * (- plan_Total / plan5.total) vol_impact_Total, 
(plan5.total - (actual.total * 1000000)) * (- plan_Exports / plan5.total) vol_impact_exports, 
(plan5.total - (actual.total * 1000000)) * (- plan_PrimTrpt / plan5.total) vol_impact_primTrpt, 
(plan5.total - (actual.total * 1000000)) * (- plan_SnH / plan5.total) vol_impact_SnH, 
(plan5.total - (actual.total * 1000000)) * (- plan_SecdTrpt / plan5.total) vol_impact_SecTrpt
from gsap.supply_volume_plan plan5
left join GSAP.Supply_Volume_actual actual on plan5.plan_actual = actual.period and plan5.country = actual.country
Left join (select [tariff/exp], country, [Cost Head], sum(try_cast(LC as decimal(12,2)) / rate) plan_Total,
sum(case when [cost head] = 'Exports' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_Exports,
sum(case when [cost head] = 'Prim.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_PrimTrpt,
sum(case when [cost head] = 'S&H' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SnH,
sum(case when [cost head] = 'Secd.Trpt' then try_cast(LC as decimal(12,2)) / rate else 0 end) plan_SecdTrpt
from gsap.cost_plan
left join gsap.fx_rates on [local currency] = CURRENCY 
where currency is not NULL
group by [tariff/exp], country, [Cost Head]) pc on plan5.plan_actual = pc.[tariff/exp] and plan5.country = pc.country
where plan5.plan_actual like '%2022%'
and actual.period is not null
And pc.[tariff/exp] is not null
)