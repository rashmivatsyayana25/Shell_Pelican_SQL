Create View GSAP.Volume_Impact AS(
select (plan5.total - (actual.total * 1000000)) * (- pc.amount_converted / plan5.total) as Volume_Impact, plan5.plan_actual, plan5.country,pc.amount_converted,pc.[OP Seg Line Item]
from gsap.supply_volume_plan plan5
left join GSAP.Supply_Volume_actual actual on plan5.plan_actual = actual.period and plan5.country = actual.country
Left join (select [OP Seg Line Item],sum(try_cast(lc as decimal(9,2)) / rate) amount_converted, [tariff/exp], country
from GSAP.cost_plan join gsap.fx_rates on [Local Currency] = currency
group by [tariff/exp], country,[OP Seg Line Item]) pc on plan5.plan_actual = pc.[tariff/exp] and plan5.country = pc.country
where plan5.plan_actual like '%2022%'
and actual.period is not null
And pc.[tariff/exp] is not null
)