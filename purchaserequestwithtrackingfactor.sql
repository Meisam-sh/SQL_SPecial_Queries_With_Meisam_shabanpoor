select pa.FullName,pr.RequestDate,pr.CreationDate,pr.Number,a.Number partrequestnumber , a.partcode,a.partname,a.Quantity,
	a.TrackingFactor1,a.TrackingFactor2,a.TrackingFactor3,a.TrQty from prc3.PurchaseRequest pr
join prc3.PurchaseRequestItem pri on pri.PurchaseRequestRef=pr.PurchaseRequestID
--where pr.Number=185093 
---------------------------darkhste kala az anbar hamrah ba amel
join
(select par.PartRequestID,par.Number,par.Date,pari.PartRequestItemID,
p.Code partcode,p.Name partname,pari.PartDesc,pari.Quantity,
partr.Quantity as TrQty,partr.TrackingFactor1,partr.TrackingFactor2,partr.TrackingFactor3 from lgs3.PartRequest par 
join lgs3.PartRequestItem pari on par.PartRequestID=pari.PartRequestRef
join lgs3.PartRequestItemTrackingFactor partr on partr.PartRequestItemRef=pari.PartRequestItemID
join lgs3.Part p on p.PartID=pari.PartRef
--where pari.PartRequestItemID=1464686
)a on a.PartRequestItemID=pri.ReferenceRef and pri.ReferenceType=2--type 2 yani mabnaye dakhaste kharid kharid hatman darkhaste kala az anbar bashad
join gnr3.party pa on  pa.PartyID=pr.RequesterRef
--where pr.PurchaseRequestID=@ID
order by RequestDate desc