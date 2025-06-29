select --dl.Title,sl.Title,vi.Debit,vi.Credit
cc.Number,dl.Code dlcode,dl.title dltitle,sl.Code slcode,sl.Title sltitle,isnull(sum(vi.Debit),0)debit,isnull(sum(vi.Credit),0)credit 
,isnull(sum(vi.Debit),0)-isnull(sum(vi.Credit),0) remain
from fin3.VoucherItem vi
join fin3.DL dl on dl.Code=vi.DLLevel4 and DLTypeRef=3
join fin3.voucher v on v.VoucherID=vi.VoucherRef
join gnr3.CostCenter cc on cc.CostCenterID=dl.ReferenceID and dl.DLTypeRef=3
join fin3.sl sl on sl.Code=vi.SLCode
where v.FiscalYearRef=@fyear and v.date>=@sdate and v.date<=edate
group by cc.Number,dl.Code,dl.title,sl.Code,sl.Title
