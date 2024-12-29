select distinct st.Name storename,
case 
	when st.State=1 then '����'
	when st.State=0 then '�������'
	else '�������'
end as currentstate,p.Code,p.name partname,
case 
	when p.State=1 then '����'
	when p.state=0 then '�������'
	else '�������' 
	end
	as partcurrentstate 
from lgs3.inventoryvoucheritem vi 
join lgs3.Part p on p.PartID=vi.PartRef
join lgs3.store st on st.StoreID=vi.StoreRef
join gnr3.FiscalYear fy on fy.FiscalYearID=vi.FiscalYearRef
where fy.Title=@fiscalyear and 
((vi.Date>=@startdate or @startdate is null) and vi.date<=@enddate or @enddate is null)
