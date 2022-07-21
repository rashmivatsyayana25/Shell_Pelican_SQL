Create View GSAP.Country AS
select distinct country from GSAP.Company where company_code in 
(select company_code from Pelican.GSAP_PROD
where datediff(MM, convert(datetime, document_posting_date, 112), getdate()) < 7)