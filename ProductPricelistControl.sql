declare @date date,@n float;
set @date='2025-01-01 00:00:00.000'
set @n=30
select b.*,PLaverage.feeAVG, 
ABS(b.Fee-PLaverage.feeAVG) as dif_fee,
ABS(b.Fee-PLaverage.feeAVG)/PLaverage.feeAVG as variation

from
(
select a.number,AVG(a.Fee) feeAVG from
(
select pl.StartDate,pl.EndDate,pl.Number plnumber,pl.Title
		,p.Number,p.Name
		,pli.Fee,pli.AdditionTolerance,pli.ReductionTolerance
from sls3.PriceList pl
	join sls3.PriceListItem pli on pli.PriceListRef=pl.PriceListID
	join sls3.[Product] p on p.ProductID=pli.ProductRef
where StartDate<=@date and enddate>=@date
)a
group by a.number
) PLaverage

join
(
select pl.StartDate,pl.EndDate,pl.Number plnumber,pl.Title
		,p.Number,p.Name
		,pli.Fee,pli.AdditionTolerance,pli.ReductionTolerance
from sls3.PriceList pl
	join sls3.PriceListItem pli on pli.PriceListRef=pl.PriceListID
	join sls3.[Product] p on p.ProductID=pli.ProductRef
where StartDate<=@date and enddate>=@date
--order by AdditionTolerance desc 
)b
on PLaverage.Number=b.Number
where ABS(b.Fee-PLaverage.feeAVG)/PLaverage.feeAVG >=(@n/100)

order by variation desc 