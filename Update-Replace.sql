select * from gnr3.party where FullName like '%����%'

update gnr3.party set fullname=replace(FullName,'����','�����')
where fullname like '%����%'