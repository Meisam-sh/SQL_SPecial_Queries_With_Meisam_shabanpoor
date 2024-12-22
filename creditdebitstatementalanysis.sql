select a.AccountDebitCreditStatementID,a.number 
,DATEDIFF(day,a.StatementDate,a.LastModificationDate)'فاصله زماني تاريخ آخرين تغيير اعلاميه تا تاريخ آن'
,DATEDIFF(day,a.StatementDate,a.CreationDate) as 'فاصله زماني تاريخ ايجاد اعلاميه و تاريخ آن'
,so.Name as 'salesofficename'
,Amount,csl.Title as 'creditsltitle',dsl.Title as 'debitsltitle',pr.FullName as 'آخرين تغيير دهنده',pr2.FullName as 'ايجاد کننده'
,ai.Description as 'شرح قلم اعلامیه'
from fin3.AccountDebitCreditStatement a
join fin3.AccountDebitCreditStatementItem ai on ai.AccountDebitCreditStatementRef=a.AccountDebitCreditStatementID
--where AccountDebitCreditStatementID=15037
join fin3.SL dsl on dsl.SLID=ai.DebitSLRef
join fin3.SL csl on csl.SLID=ai.CreditSLRef
join sls3.SalesOffice so on so.SalesOfficeID=a.EntityStructureReferenceRef
join sys3.[User] u on u.UserID=a.LastModifier
join gnr3.Party pr on pr.PartyID=u.PartyRef
join sys3.[User] u2 on u2.UserID=a.Creator
join gnr3.Party pr2 on pr2.PartyID=u2.PartyRef
join gnr3.FiscalYear fy on fy.FiscalYearID=FiscalYearRef
where (fy.Title=@fiscalyear)
		and ((a.StatementDate>=@startstatementdate or @startstatementdate is null) 
			and (a.StatementDate<=@endstatementdate or @endstatementdate is null))