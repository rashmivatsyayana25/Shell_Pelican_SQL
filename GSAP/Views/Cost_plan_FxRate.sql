Create View GSAP.Cost_plan_FxRate AS
SELECT gsap.COST_PLAN.[Account Number],gsap.COST_PLAN.[Account Number Desc], 
gsap.COST_PLAN.[Company code],gsap.COST_PLAN.[Cost Head],gsap.COST_PLAN.Country,ABS(gsap.COST_PLAN.LC) AS [LC_ABS],
gsap.COST_PLAN.[Local Currency],gsap.COST_PLAN.[OP Seg Line Item],gsap.COST_PLAN.[OP Seg Line Item Desc],gsap.COST_PLAN.[Period/Year],gsap.COST_PLAN.[Tariff/Exp],
gsap.FX_RATES.RATE,gsap.FX_RATES.TYPE, CONVERT(float, ABS(CAST(gsap.COST_PLAN.LC AS float)) / CAST(gsap.FX_RATES.RATE AS float)) AS 
[LC_Converted]
FROM gsap.COST_PLAN
INNER JOIN gsap.FX_RATES ON gsap.COST_PLAN.[Local Currency]=gsap.FX_RATES.CURRENCY;
