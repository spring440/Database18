/*create select procedure that selects presentations per track in the Budapest.*/
CREATE PROCEDURE budapest_pre
AS
select pre.presentation_title,t1.dates,t2.start_time,t2.end_time,cl.classroom_id,lo.city
from  presentation pre,schedule s,time1 t1,time2 t2,classroom cl,location lo
where pre.presentation_id=s.presentation_id and s.time1_id=t1.time1_id and t1.time2_id=t2.time2_id
	  and s.classroom_id=cl.classroom_id and cl.location_id=lo.location_id
	  and lo.city='budapest'
GO

EXECUTE budapest_pre

CREATE PROCEDURE insertPresentation
@presenter_id varchar(220),
@presentation_id varchar(220)
AS 
	declare @sum int;
BEGIN TRAN
	INSERT INTO presenter(presenter_id) VALUES (@presenter_id)
	INSERT INTO presentation(presentation_id) VALUES (@presentation_id)
	INSERT INTO presenting VALUES (@presenter_id,@presentation_id)
	select @sum=(select count(*) from presenting where presenter_id=@presenter_id and presentation_id=@presentation_id)
IF(@sum>1)
	BEGIN
		ROLLBACK TRAN
		RAISERROR (N'<<%30.70s>>', -- Message text.
			   10,           -- Severity,
			   1,            -- State,
			   N'These value already exist')--error
	END
ELSE COMMIT TRAN
GO

Execute insertPresentation 'Speaker1', 'Presentation1'
Execute insertPresentation 'Speaker1', 'Presentation2'

select * from presenting where presenter_id='Speaker1'

/*in case you want to try the procedure again*/
delete from presenting where presenter_id='Speaker1'
delete from presenter where presenter_id='Speaker1'
delete from presentation where presentation_id like 'presentation%'