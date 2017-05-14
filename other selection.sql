/*check how many presentations are there for each presenter*/
select count(presentation_id) from presenting group by presenter_id 

/*select presentors and their presentations */
select pre.presentation_title, pe.firstname, pe.lastname
from people pe, presenter pr, presentation pre, presenting ping 
where pe.people_id=pr.people_id and pr.presenter_id=ping.presenter_id and pre.presentation_id=ping.presentation_id

/*selece presentations which has more than one presenter*/
select distinct pre.presentation_id, pre.presentation_title from presenter pr, presentation pre, presenting ping 
where pr.presenter_id=ping.presenter_id and pre.presentation_id=ping.presentation_id
and ping.presentation_id in (select presenting.presentation_id from presenting
							group by presentation_id
							having count(presenter_id )> 1)
						
/*create view with presenter and presentation arrangment*/
CREATE VIEW calendar
AS
select pe.firstname,pe.lastname,pre.presentation_title,t1.dates,t2.start_time,t2.end_time,cl.classroom_id,lo.city,lo.country
from people pe, presenter pr, presenting ping, presentation pre,schedule s,time1 t1,time2 t2,classroom cl,location lo
where pe.people_id=pr.people_id and pr.presenter_id=ping.presenter_id and ping.presentation_id=pre.presentation_id
	  and pre.presentation_id=s.presentation_id and s.time1_id=t1.time1_id and t1.time2_id=t2.time2_id
	  and s.classroom_id=cl.classroom_id and cl.location_id=lo.location_id
GO

select * from calendar

/*find non-technical presentation schdule*/ 
select pe.firstname,pe.lastname,pre.presentation_title,t1.dates
from people pe, presenter pr, presenting ping, presentation pre,schedule s,time1 t1
where pe.people_id=pr.people_id and pr.presenter_id=ping.presenter_id and ping.presentation_id=pre.presentation_id
	  and pre.presentation_id=s.presentation_id and s.time1_id=t1.time1_id 
	  and pe.firstname='Non-Technical'

