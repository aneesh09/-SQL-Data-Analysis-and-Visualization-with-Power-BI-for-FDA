show tables;
select * from appdoc;
select * from appdoctype_lookup;
select * from application;
select * from chemtypelookup;
select * from doctype_lookup;
select * from product;
select * from product_tecode;
select * from regactiondate;
select * from reviewclass_lookup;

/*Task-1*/
use project_sql;

select count(ApplNo) as TotalApprovedDrugs,ActionType,year(ActionDate) as UpdatedYear 
from RegActionDate group by ActionType,ActionDate; 

Select distinct a.ApplNo,r.ActionType,rank() over( order by r.ActionDate) as A_Rank, 
year(ActionDate) as UpdatedYear from appdoc a
left join regactiondate r on a.ApplNo = r.ApplNo order by UpdatedYear ASC;

Select distinct a.ApplNo,r.ActionType,rank() over( order by r.ActionDate) as D_Rank, 
year(ActionDate) as UpdatedYear from appdoc a
left join regactiondate r on a.ApplNo = r.ApplNo order by UpdatedYear DESC;

Select a.SponsorApplicant,r.ActionType,rank() over( order by a.SponsorApplicant) as S_Rank,
year(ActionDate) as UpdatedYear from application a
left join regactiondate r on a.ApplNo = r.ApplNo where a.ActionType="AP";


Select a.ApplNo,a.SponsorApplicant,r.DocType,r.ActionType,
year(ActionDate) as UpdatedYear,rank() over( order by a.SponsorApplicant) as S_Rank from application a
left join regactiondate r on a.ApplNo = r.ApplNo where ActionDate between 1939 and 1960;


/*Task-2*/

select count(p.ApplNo) as TotalApproval,p.ProductMktStatus
from product p left join regactiondate r 
on p.ApplNo =r.ApplNo group by ProductMktStatus;

select count(p.ProductMktStatus) as TotalApprovals2011,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2011;

select count(p.ProductMktStatus) as TotalApprovals2012,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2012;

select count(p.ProductMktStatus) as TotalApprovals2013,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2013;

select count(p.ProductMktStatus) as TotalApprovals2014,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2014;

select count(p.ProductMktStatus) as TotalApprovals2015,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2015;

select count(p.ProductMktStatus) as TotalApprovals2016,year(ActionDate) as UpdatedYear from product p left join regactiondate r 
on p.ApplNo =r.ApplNo where ActionDate = 2016;
 
select distinct p.ProductMktStatus,year(ActionDate) as UpdatedYear
from product p left join regactiondate r 
on p.ApplNo =r.ApplNo order by ProductMktStatus;

select distinct a.Applno,p.ProductMktStatus,a.Chemical_Type,a.ActionType
from product p 
left join application a on p.Applno = a.Applno
left join product_tecode pte
on (p.ProductNo =pte.ProductNo And p.Applno = a.Applno);



/*Task-3*/
select a.ApplNo,p.ProductNo,p.ProductMktStatus,a.ActionType,p.Dosage
from application a left join Product p on a.Applno = p.Applno order by p.Dosage asc ;

select count(a.ApplNo) as TotalApprovals,p.Dosage from application a 
left join product p on a.ApplNo = p.Applno group by Dosage;

select p.Dosage,p.ProductMktStatus,year(ActionDate) as UpdatedYear from Product p
left join regactiondate r on p.ApplNo = r.ApplNo;


#Task-4

select distinct(a.Applno),p.ProductMktStatus,Pt.TECode,a.ActionType from application a 
left join product p on a.Applno=p.Applno 
left join product_tecode pt
on (p.ProductNo = pt.ProductNo);

select count(a.Applno)as TotalApproval,p.TECode from application a
left join product p on a.Applno = p.Applno group by TECode;

