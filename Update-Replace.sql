select * from gnr3.party where FullName like '%˜æÑÔ%'

update gnr3.party set fullname=replace(FullName,'˜æÑÔ','˜æÑæÔ')
where fullname like '%˜æÑÔ%'