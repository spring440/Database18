/*collection every people's information*/
CREATE TABLE people(
people_id varchar(220) PRIMARY KEY,
firstname varchar(220),
lastname varchar(220),
street varchar(220),
city varchar(220),
zip varchar(220),
states varchar(220),
email varchar(220))

/*create a table for attendee's information*/
CREATE TABLE attendee(
attendee_id varchar(220) PRIMARY KEY,
people_id varchar(220) FOREIGN KEY REFERENCES people(people_id))

/*create a table for presenter's information*/
CREATE TABLE presenter(
presenter_id varchar(220) PRIMARY KEY,
people_id varchar(220) FOREIGN KEY REFERENCES people(people_id))

/*create a table for sponsor's information*/
CREATE TABLE sponsor(
sponsor_id varchar(220) PRIMARY KEY,
sponsor_name varchar(220),
sponsor_type varchar(220))

/*create a table for organizer's information*/
CREATE TABLE organizer(
organizer_id varchar(220) PRIMARY KEY,
people_id varchar(220) FOREIGN KEY REFERENCES people(people_id))

/*create a table for volunteer's information*/
CREATE TABLE volunteer(
voluteer_id varchar(220) PRIMARY KEY,
people_id varchar(220) FOREIGN KEY REFERENCES people(people_id))

/*create a table for presentation's information*/
CREATE TABLE presentation(
presentation_id varchar(220) PRIMARY KEY,
presentation_title varchar(220),
presentation_level varchar(220),)

/*create a table for sponsor's events' information*/
CREATE TABLE eventholding(
event_id varchar(220) PRIMARY KEY,
sponsor_id varchar(220) FOREIGN KEY REFERENCES sponsor(sponsor_id),
holdingdate date,
location_id varchar(220) FOREIGN KEY REFERENCES location(location_id))

/*create a table for schedule of the time information*/
CREATE TABLE time1(
time1_id varchar(220) PRIMARY KEY,
dates date,
time2_id varchar(220) FOREIGN KEY REFERENCES time2(time2_id))

CREATE TABLE time2(
time2_id varchar(220) PRIMARY KEY,
start_time time,
end_time time)

/*create a table for locations' information*/
CREATE TABLE location(
location_id varchar(220) PRIMARY KEY,
city varchar(220),
states varchar(220),
country varchar(220),
region varchar(220),
)

/*create a table for classrooms' information*/
CREATE TABLE classroom(
classroom_id varchar(220) PRIMARY KEY,
capicity int,
location_id varchar(220) FOREIGN KEY REFERENCES location(location_id))

/*create a table for combine the time,classroom,and presentations' information*/
CREATE TABLE schedule(
presentation_id varchar(220) FOREIGN KEY REFERENCES presentation(presentation_id),
time1_id varchar(220) FOREIGN KEY REFERENCES time1(time1_id),
classroom_id varchar(220)  FOREIGN KEY REFERENCES classroom(classroom_id))

/*create a table for joining presentor and presentation's information*/
CREATE TABLE presenting(
presenter_id varchar(220) FOREIGN KEY REFERENCES presenter(presenter_id),
presentation_id varchar(220) FOREIGN KEY REFERENCES presentation(presentation_id),)

/*create a table for students grading the presentors' presentation*/
CREATE TABLE grade(
attendee_id varchar(220)FOREIGN KEY REFERENCES attendee(attendee_id),
presenter_id varchar(220) FOREIGN KEY REFERENCES presenter(presenter_id),
presentaion_id varchar(220) FOREIGN KEY REFERENCES presentation(presentation_id),
grade int)

/*insert attendees' information to people table */
INSERT INTO people VALUES
('peo001','Kevin','Russell','1029 Birchwood Dr','Olympia','98501','Washington','KRussell@yahoo.com'),
('peo002','Katelyn','Rivera','1030 Ambush Dr.','Bury','PE17',	'England','KRivera@yahoo.com'),
('peo003','Alfredo','Ortega','1032 Buena Vista','North Ryde','2113','New South Wales','AOrtega@yahoo.com'),
('peo004','Andrea','Campbell','1032 Coats Road','Stoke-on-Trent','AS23','England','ACampbell@yahoo.com'),
('peo005','Jeremy','Peterson','1035 Arguello Blvd.','San Diego','92102','California','JPeterson@yahoo.com'),
('peo006','Arianna','Ramirez','1036 Mason Dr','Port Orchard','98366','Washington','ARamirez@yahoo.com'),
('peo007','Mario','Sharma','1039 Adelaide St.','Port Macquarie','2444','New South Wales','MSharma@yahoo.com'),
('peo008','Adam','Collins','104 Hilltop Dr.','Concord','94519','California','ACollins@yahoo.com'),
('peo009','Taylor','Martin','1040 Greenbush Drive','Newton','V2L3W8','British Columbia','TMartin@yahoo.com'),
('peo010','Gabriel','Collins','1040 Northridge Road','Woodland Hills','91364','California','GCollins@yahoo.com'),
('peo011','Randall','Martin','1042 Hooftrail Way','Newcastle','2300','New South Wales','RMartin@yahoo.com'),
('peo012','Samantha','Jenkins','1046 Cloverleaf Circle','Shawnee','V8Z 4N5','British Columbia','SJenkins@yahoo.com'),
('peo013','Justin','Simmons','1046 San Carlos Avenue','Colma','94014','California','JSimmons@yahoo.com'),
('peo014','Ethan','Winston','1047 Las Quebradas Lane','Oak Bay','V8P','British Columbia','EWinston@yahoo.com'),
('peo015','Hunter','Roberts','1048 Burwood Way','Haney','V2W 1W2','British Columbia','HRoberts@yahoo.com'),
('peo016','Nathaniel','Murphy','105 Woodruff Ln.','Oakland','94611','California','NMurphy@yahoo.com'),
('peo017','Charles','Wilson','1050 Creed Ave','Lebanon','97355','Oregon','CWilson@yahoo.com'),
('peo018','Carrie','Alvarez','1050 Greenhills Circle','Lane Cove','1597','New South Wales','CAlvarez@yahoo.com'),
('peo019','Paige','Alexander','1050 Greenhills Circle','Langley','V3A 4R2','British Columbia','PAlexander@yahoo.com')

/*insert attendees' information to attendee table*/
INSERT INTO attendee VALUES
('att001','peo001'),
('att002','peo002'),
('att003','peo003'),
('att004','peo004'),
('att005','peo005'),
('att006','peo006'),
('att007','peo007'),
('att008','peo008'),
('att009','peo009'),
('att010','peo010'),
('att011','peo011'),
('att012','peo012'),
('att013','peo013'),
('att014','peo014'),
('att015','peo015'),
('att016','peo016'),
('att017','peo017'),
('att018','peo018'),
('att019','peo019')

/*check attendees' personal infornation*/
select a.attendee_id, p.firstname, p.lastname from people p join attendee a on p.people_id=a.people_id 

/*insert sponsors' value*/
INSERT INTO sponsor VALUES
('spo001','VMWare','Platinum Sponsor'),
('spo002','Verizon Digital Media Services','Platinum Sponsor'),
('spo003','Microsoft Corporation (GAP) (GAP Sponsor)','Platinum Sponsor'),
('spo004','Tintri','Platinum Sponsor'),
('spo005','Amazon Web Services, LLC','Gold Sponsor'),
('spo006','Pyramid Analytics (GAP Sponsor)','Gold Sponsor'),
('spo007','Pure Storage','Gold Sponsor'),
('spo008','Profisee','Gold Sponsor'),
('spo009','NetLib Security','Silver Sponsor'),
('spo010','Melissa Data Corp.','Silver Sponsor'),
('spo011','Red Gate Software','Silver Sponsor'),
('spo012','SentryOne','Silver Sponsor'),
('spo013','Hush Hush','Bronze Sponsor'),
('spo014','COZYROC','Bronze Sponsor'),
('spo015','SQLDocKit by Acceleratio Ltd.','Bronze Sponsor')

/*insert presentors' information into people table*/
INSERT INTO people (people_id, firstname, lastname) VALUES
('peo020','Aaron','Bertrand'),	
('peo021','Adam','Jorgensen'),
('peo022','Allan','Hirt'),
('peo023','SIOS','Technology'),
('peo024','Andy','Leonard'),
('peo025','Brandon','Leach'),
('peo026','Brent','Ozar'),
('peo027','Carl','Berglund'),
('peo028','Chris','Bell'),
('peo029','Chris','Seferlis'),
('peo030','David','Bermingham'),
('peo031','David Peter','Hansen'),
('peo032','Dennis','Messina'),
('peo033','Edward','Pollack'),
('peo034','George','Walters'),
('peo035','Gigi','Bell'),
('peo036','Grant','Fritchey'),
('peo037','Greg','Moore'),
('peo038','Hilary','Cotter'),
('peo039','Jack','Corbett'),
('peo040','James','Serra'),
('peo041','Jason','Brimhall'),
('peo042','Jason','Horner'),
('peo043','Jeremiah','Peschka'),
('peo044','Joe','Chang'),
('peo045','John','Flannery'),
('peo046','John','Miner'),
('peo047','John','Sterrett'),
('peo048','Joseph D','Antoni'),
('peo049','Kennie','Pontoppidan'),
('peo050','Kevin','Goff'),
('peo051','Kevin','Schenega'),
('peo052','Melissa','Riley'),
('peo053','Michael','Corey'),
('peo054','Michael','Wharton'),
('peo055','Mickey','Stuewe'),
('peo056','Mike','Hillwig'),
('peo057','Mike','Walsh'),
('peo058','Mohammad','Yusuf'),
('peo059','Paresh','Motiwala'),
('peo060','Paul','Rizza'),
('peo061','Richie','Rump'),
('peo062','Robert','Pearl'),
('peo063','Sayed','Saeed'),
('peo064','Stacia','Misner'),
('peo065','Steve','Simon'),
('peo066','St?hane','Fr?hette'),
('peo067','Sunil','Kadimdiwan'),
('peo068','Thomas','Grohser'),
('peo069','Todd','Chittenden'),
('peo070','Varsham','Papikian'),
('peo071','Non-Techenical','SQLSatruday 364')

/*insert presenters' information to presenters' table*/
INSERT INTO presenter VALUES
('prs001','peo020'),
('prs002','peo021'),
('prs003','peo022'),
('prs004','peo023'),
('prs005','peo024'),
('prs006','peo025'),
('prs007','peo026'),
('prs008','peo027'),
('prs009','peo028'),
('prs010','peo029'),
('prs011','peo030'),
('prs012','peo031'),
('prs013','peo032'),
('prs014','peo033'),
('prs015','peo034'),
('prs016','peo035'),
('prs017','peo036'),
('prs018','peo037'),
('prs019','peo038'),
('prs020','peo039'),
('prs021','peo040'),
('prs022','peo041'),
('prs023','peo042'),
('prs024','peo043'),
('prs025','peo044'),
('prs026','peo045'),
('prs027','peo046'),
('prs028','peo047'),
('prs029','peo048'),
('prs030','peo049'),
('prs031','peo050'),
('prs032','peo051'),
('prs033','peo052'),
('prs034','peo053'),
('prs035','peo054'),
('prs036','peo055'),
('prs037','peo056'),
('prs038','peo057'),
('prs039','peo058'),
('prs040','peo059'),
('prs041','peo060'),
('prs042','peo061'),
('prs043','peo062'),
('prs044','peo063'),
('prs045','peo064'),
('prs046','peo065'),
('prs047','peo066'),
('prs048','peo067'),
('prs049','peo068'),
('prs050','peo069'),
('prs051','peo070'),
('prs052','peo071')

/*check presenters' personal infornation*/
select pr.presenter_id, p.firstname, p.lastname from people p join presenter pr on p.people_id=pr.people_id 

/*insert values into presentation table*/
INSERT INTO presentation VALUES
('ps001','Top 5 Ways to Improve Your triggers','Intermediate'),
('ps002','T-SQL : Bad Habits & Best Practices','Beginner'),
('ps003','The future of the data professional','Beginner'),
('ps004','Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments','	Non-Technical'),
('ps005','Did You Vote Today? A DBAs Guide to Cluster Quorum','	Advanced'),
('ps006','Hybrid Solutions: The Future of SQL Server Disaster Recovery','Intermediate'),
('ps007','Is That A Failover Cluster On Your Laptop/Desktop?','Intermediate'),
('ps008','So You Want To Be A Consultant?','	Beginner'),
('ps009','Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments','	Beginner'),
('ps010','Hacking the SSIS 2012 Catalog','Beginner'),
('ps011','SSIS 2014 Data Flow Tuning Tips and Tricks','	Beginner'),
('ps012','Introduction to SQL Server - Part 1','Beginner'),
('ps013','Introduction to SQL Server - Part 2','Beginner'),
('ps014','SQL Server Storage internals: Looking under the hood.','	Advanced'),
('ps015','Easy Architecture Design for HA and DR','	Intermediate'),
('ps016','How to Think Like the Engine','Intermediate'),
('ps017','Watch Brent Tune Queries','Intermediate'),
('ps018','Standalone to High-Availability Clusters over Lunch with Time to Spare','	Intermediate'),
('ps019','Hacking Expos?- Using SSL to Protect SQL Connections','Intermediate'),
('ps020','Optimizing Protected Indexes','Intermediate'),
('ps021','Prevent Recovery Amnesia ?Forget the Backups','Beginner'),
('ps022','The Spy Who Loathed Me - An Intro to SQL Security	','	Beginner'),
('ps023','AlwaysOn: Improve reliability and reporting performance with one cool tech','	Beginner'),
('ps024','Highly Available SQL Server in Windows Azure IaaS	','	Intermediate	'),
('ps025','What every SQL Server DBA needs to know about Windows Server 10 Technical Preview','Intermediate'),
('ps026','Bulk load and minimal logged inserts','	Advanced'),
('ps027','Integration Services (SSIS) for the DBA','Intermediate'),
('ps028','SQL Server and the Cloud','Beginner'),
('ps029','The Quest for the Golden Record:MDM Best Practices','	Beginner'),
('ps030','Database Design: Solving Problems Before they Start!','Beginner'),
('ps031','Diving Into Query Execution Plans	','	Intermediate'),
('ps032','Dynamic SQL: Writing Efficient Queries on the Fly	','	Beginner'),
('ps033','Query Optimization Crash Course','Beginner'),
('ps034','Hybrid Cloud Scenarios with SQL Server 2014','Intermediate'),
('ps035','SQL Server 2012/2014 Performance Tuning All Up','	Intermediate'),
('ps036','SQL Server 2014 New Features	','	Intermediate'),
('ps037','SQL Server AlwaysOn Availability Groups','	Beginner'),
('ps038','Dealing With Difficult People	','	Beginner'),
('ps039','Execution Plans: What Can You Do With Them?','Intermediate'),
('ps040','Tune Queries By Fixing Bad Parameter Sniffing	','	Intermediate'),
('ps041','Tricks that have saved my bacon','Beginner'),
('ps042','Monitoring SQL Server using Extended Events	','	Beginner'),
('ps043','Replicaton Technologies','Advanced'),
('ps044','Scaling with SQL Server Service Broker','	Advanced'),
('ps045','Scaling with SQL Server Service Broker','	Advanced'),
('ps046','Stress testing SQL Server	','	Advanced'),
('ps047','Inroduction to Triggers','Beginner'),
('ps048','Tired of the CRUD? Automate it!','Intermediate'),
('ps049','Become a BI Independent Consultant!','Beginner'),
('ps050','Building an Effective Data Warehouse Architecture	','	Beginner'),
('ps051','Building an Effective Data Warehouse Architecture with the cloud and MPP','Beginner'),
('ps052','Enhancing your career: Building your personal brand','Beginner'),
('ps053','How to Make a LOT More Money as a Consultant','Beginner'),
('ps054','Modern Data Warehousing','Beginner'),
('ps055','What exactly is big data and why should I care?','Beginner'),
('ps056','What is it like to work for Microsoft?','	Beginner'),
('ps057','Murder They Wrote	','	Intermediate'),
('ps058','Reporting Services for Mere DBAs','	Intermediate'),
('ps059','SQL Server Compression and what it can do for you	','	Advanced'),
('ps060','Using Extended Events in SQL Server','Advanced'),
('ps061','Dimensional Modeling Design Patterns: Beyond Basics','Intermediate'),
('ps062','Dimensional Modeling Design Patterns: Beyond Basics','Intermediate'),
('ps063','PowerShell for the Reluctant DBA / Developer','Beginner'),
('ps064','A Dynamic World Demands Dynamic SQL','Intermediate'),
('ps065','A Dynamic World Demands Dynamic SQL','Intermediate'),
('ps066','Leaving the Windows Open	','	Intermediate'),
('ps067','Automating Execution Plan Analysis','	Advanced'),
('ps068','Automating Execution Plan Analysis','	Advanced'),
('ps069','Data Partitioning	','	Intermediate'),
('ps070','Data Tier Application Testing with NUnit and Distributed Repla','	Intermediate'),
('ps071','Development Lifecycle with SQL Server Data Tools and DACFx','	Intermediate'),
('ps072','Introduction to Database Recovery	','	Beginner'),
('ps073','Basic Database Design	','	Beginner'),
('ps074','Basic Database Programming','	Beginner'),
('ps075','Biggest Loser: Database Edition','Intermediate'),
('ps076','Full Text Indexing Basics	','	Beginner'),
('ps077','Table partitioning for Azure SQL Databases','	Beginner'),
('ps078','Automate your daily checklist with PBM and CMS','	Intermediate'),
('ps079','Introduction to High Availability with SQL Server	','	Beginner'),
('ps080','Introduction to Powershell for DBAs','Beginner'),
('ps081','Becoming a Top DBA--Learning Automation in SQL Server	','	Beginner'),
('ps082','Autogenerating a process data warehouse','Advanced'),
('ps083','Partitioning as a design pattern','Advanced'),
('ps084','SQL anti patterns	','	Advanced'),
('ps085','Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)	','	Beginner'),
('ps086','Change Data Capture in SQL Server 2008/2012','Intermediate'),
('ps087','Implementing Data Warehouse Patterns with the Microsoft BI Tools	','	Intermediate'),
('ps088','Integrating Reporting Services with SharePoint','	Intermediate'),
('ps089','SQL Server 2012/2014 Columnstore index','	Intermediate'),
('ps090','SQL Server Reporting Services, attendees choose','Intermediate'),
('ps091','T-SQL for Application Developers - Attendees chose','Intermediate'),
('ps092','What is new in SQL Server Integration Services 2012','Intermediate'),
('ps093','Why OLAP? Building SSAS cubes and benefits of OLAP','Intermediate'),
('ps094','Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server	','	Non-Technical'),
('ps095','Testing','Beginner'),
('ps096','Database Virtualization and Drinking out of the Fire Hose	','	Intermediate'),
('ps097','Automating SQL Server using PowerShell','	Intermediate'),
('ps098','PowerShell Basics for SQLServer','Beginner'),
('ps099','Best Practices for Efficient SSRS Report Creation	','	Beginner'),
('ps100','Changing Your Habits to Improve the Performance of Your T-SQL	','	Beginner'),
('ps101','Recovery and Backup for Beginners	','	Beginner'),
('ps102','Baselines and Performance Monitoring with PAL	','	Beginner	'),
('ps103','Never Have to Say "Mayday!!!" Again','Beginner'),
('ps104','You are Doing It Wrong!!','Intermediate'),
('ps105','An Introduction to Database Design','	Beginner'),
('ps106','Database Modeling and Design','Intermediate'),
('ps107','Best Practices Document','Intermediate'),
('ps108','Why do we shun using tools for DBA job?','Intermediate'),
('ps109','ETL not ELT! Common mistakes and misconceptions about SSIS','	Advanced'),
('ps110','Getting a job with Microsoft','	Non-Technical'),
('ps111','Shortcuts to Building SSIS in .Net	','	Beginner'),
('ps112','The Quest to Find Bad Data With Data Profiling','	Intermediate'),
('ps113','Creating A Performance Health Repository - using MDW	','	Beginner'),
('ps114','DBA FOR DUMMIES','Beginner'),
('ps115','Faster, Better Decisions with Self Service Business Analytics	','	Intermediate'),
('ps116','Building a BI Solution in the Cloud','Intermediate'),
('ps117','Introducing Power BI	','	Beginner'),
('ps118','Multidimensional vs Tabular - May the Best Model Win','Intermediate'),
('ps119','Reduce, Reuse, Recycle: Automating Your BI Framework','Intermediate'),
('ps120','A dive into Data Quality Services	','	Intermediate'),
('ps121','An introduction to Data Mining','	Intermediate'),
('ps122','Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask	','	Intermediate	'),
('ps123','Challenges to designing financial warehouses, lessons learnt	','	Intermediate	'),
('ps124','Creating efficient and effective SSRS BI Solutions','	Intermediate'),
('ps125','Creating efficient and effective SSRS BI Solutions','	Intermediate'),
('ps126','Database design for mere developers','Intermediate'),
('ps127','Database design for mere developers','Intermediate'),
('ps128','DAX and the tabular model	','	Intermediate'),
('ps129','Get your Mining Model Predictions out to all	','	Intermediate'),
('ps130','Master Data Services Best Practices','Intermediate'),
('ps131','Master Data Services Disaster Recovery','	Intermediate'),
('ps132','Mind your language!! Cursors are a dirty word	','	Intermediate'),
('ps133','Monitoring Server health via Reporting Services dashboards','	Intermediate'),
('ps134','Now you see it! Now you done! Conjuring many reports utilizing only one SSRS report.','Intermediate'),
('ps135','Power to the people!!	','	Intermediate'),
('ps136','Rapid Application Development with Master Data Services','Intermediate'),
('ps137','SQL Server 2014 Data Access Layers','	Intermediate'),
('ps138','SQL Server Reporting Services 2014 on Steroids!!	','	Intermediate'),
('ps139','SQL Server Reporting Services Best Practices','Intermediate'),
('ps140','Graph Databases for SQL Server Professionals','Intermediate'),
('ps141','Self-Service Data Integration with Power Query','	Beginner'),
('ps142','Balanced Scorecards using SSRS','	Intermediate'),
('ps143','Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters','	Intermediate'),
('ps144','Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters','	Intermediate'),
('ps145','Establishing a SLA','	Intermediate'),
('ps146','SQL Server Storage Engine under the hood','Intermediate'),
('ps147','Power BI Components in Microsofts Self-Service BI Suite','Beginner'),
('ps148','Hidden in plain sight: master your tools','Intermediate'),
('ps149','Coffee Break','Non-Technical'),
('ps150','Event Kickoff and Networking','Non-Technical'),
('ps151','Lunch Break','Non-Technical'),
('ps152','Lunchtime Keynote','Non-Technical'),
('ps153','Raffle','Non-Technical'),
('ps154','Registrations','Non-Technical')


/*combine the presenters with presentations*/
INSERT into presenting VALUES
('prs001','ps001'),
('prs001','ps002'),
('prs002','ps003'),
('prs003','ps004'),
('prs003','ps005'),
('prs003','ps006'),
('prs003','ps007'),
('prs003','ps008'),
('prs003','ps009'),
('prs004','ps009'),
('prs005','ps010'),
('prs005','ps011'),
('prs006','ps012'),
('prs006','ps013'),
('prs006','ps014'),
('prs007','ps015'),
('prs007','ps016'),
('prs007','ps017'),
('prs008','ps018'),
('prs009','ps019'),
('prs009','ps020'),
('prs009','ps021'),
('prs009','ps022'),
('prs010','ps023'),
('prs011','ps024'),
('prs011','ps025'),
('prs012','ps026'),
('prs012','ps027'),
('prs012','ps028'),
('prs013','ps029'),
('prs014','ps030'),
('prs014','ps031'),
('prs014','ps032'),
('prs014','ps033'),
('prs015','ps034'),
('prs015','ps035'),
('prs015','ps036'),
('prs015','ps037'),
('prs016','ps038'),
('prs017','ps039'),
('prs017','ps040'),
('prs018','ps041'),
('prs019','ps042'),
('prs019','ps043'),
('prs019','ps044'),
('prs019','ps045'),
('prs019','ps046'),
('prs020','ps047'),
('prs020','ps048'),
('prs021','ps049'),
('prs021','ps050'),
('prs021','ps051'),
('prs021','ps052'),
('prs021','ps053'),
('prs021','ps054'),
('prs021','ps055'),
('prs021','ps056'),
('prs022','ps057'),
('prs022','ps058'),
('prs022','ps059'),
('prs022','ps060'),
('prs023','ps061'),
('prs023','ps062'),
('prs023','ps063'),
('prs024','ps064'),
('prs024','ps065'),
('prs024','ps066'),
('prs025','ps067'),
('prs025','ps068'),
('prs026','ps069'),
('prs026','ps070'),
('prs026','ps071'),
('prs026','ps072'),
('prs027','ps073'),
('prs027','ps074'),
('prs027','ps075'),
('prs027','ps076'),
('prs027','ps077'),
('prs028','ps078'),
('prs028','ps079'),
('prs028','ps080'),
('prs029','ps081'),
('prs030','ps082'),
('prs030','ps083'),
('prs030','ps084'),
('prs031','ps085'),
('prs031','ps086'),
('prs031','ps087'),
('prs031','ps088'),
('prs031','ps089'),
('prs031','ps090'),
('prs031','ps091'),
('prs031','ps092'),
('prs031','ps093'),
('prs032','ps094'),
('prs033','ps095'),
('prs034','ps096'),
('prs035','ps097'),
('prs035','ps098'),
('prs036','ps099'),
('prs036','ps100'),
('prs037','ps101'),
('prs038','ps102'),
('prs038','ps103'),
('prs038','ps104'),
('prs039','ps105'),
('prs039','ps106'),
('prs040','ps107'),
('prs040','ps108'),
('prs041','ps109'),
('prs041','ps110'),
('prs041','ps111'),
('prs042','ps112'),
('prs043','ps113'),
('prs043','ps114'),
('prs044','ps115'),
('prs045','ps116'),
('prs045','ps117'),
('prs045','ps118'),
('prs045','ps119'),
('prs046','ps120'),
('prs046','ps121'),
('prs046','ps122'),
('prs046','ps123'),
('prs046','ps124'),
('prs046','ps125'),
('prs046','ps126'),
('prs046','ps127'),
('prs046','ps128'),
('prs046','ps129'),
('prs046','ps130'),
('prs046','ps131'),
('prs046','ps132'),
('prs046','ps133'),
('prs046','ps134'),
('prs046','ps135'),
('prs046','ps136'),
('prs046','ps137'),
('prs046','ps138'),
('prs046','ps139'),
('prs047','ps140'),
('prs047','ps141'),
('prs048','ps142'),
('prs049','ps143'),
('prs049','ps144'),
('prs049','ps145'),
('prs049','ps146'),
('prs050','ps147'),
('prs051','ps148'),
('prs052','ps149'),
('prs052','ps150'),
('prs052','ps151'),
('prs052','ps152'),
('prs052','ps153'),
('prs052','ps154')

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

/*insert time2 value into time2*/
INSERT INTO time2 VALUES
('t201','09:00:00','10:00:00'),
('t202','10:30:00','11:30:00'),
('t203','12:00:00','13:00:00'),
('t204','13:30:00','14:30:00'),
('t205','15:00:00','16:00:00'),
('t206','16:30:00','17:30:00'),
('t207','18:00:00','19:00:00')

/*insert time1 value into time1*/
INSERT INTO time1 VALUES
('t101','2017-03-04','t201'),
('t102','2017-03-04','t202'),
('t103','2017-03-04','t203'),
('t104','2017-03-04','t204'),
('t105','2017-03-04','t205'),
('t106','2017-03-04','t206'),
('t107','2017-03-04','t207'),
('t108','2017-03-11','t201'),
('t109','2017-03-11','t202'),
('t110','2017-03-11','t203'),
('t111','2017-03-11','t204'),
('t112','2017-03-11','t205'),
('t113','2017-03-11','t206'),
('t114','2017-03-11','t207'),
('t115','2017-03-18','t201'),
('t116','2017-03-18','t202'),
('t117','2017-03-18','t203'),
('t118','2017-03-18','t204'),
('t119','2017-03-18','t205'),
('t120','2017-03-18','t206'),
('t121','2017-03-18','t207'),
('t122','2017-03-25','t201'),
('t123','2017-03-25','t202'),
('t124','2017-03-25','t203'),
('t125','2017-03-25','t204'),
('t126','2017-03-25','t205'),
('t127','2017-03-25','t206'),
('t128','2017-03-25','t207')

/*insert locations' value into location*/
INSERT INTO location VALUES
('lo001','Budapest','Hungary','Europe/Middle East/Africa'),
('lo002','Kiev','Ukraine','Europe/Middle East/Africa'),
('lo003','New York','United States','Canada/US'),
('lo004','Bogota','Colombia','Latin America'), 
('lo005','Baltimore','United States','Canada/US'),
('lo006','Brisbane','Australia','Asia Pacific'),
('lo007','Plovdiv','Bulgaria','Europe/Middle East/Africa'),
('lo008','Philadelphia','United States','Canada/US')


/*insert  classrooms' value*/ 
INSERT INTO classroom VALUES
('cr001',40,'lo001'),
('cr002',20,'lo001'),
('cr003',100,'lo001'),
('cr004',80,'lo001'),
('cr005',50,'lo001'),
('cr006',20,'lo001'),
('cr007',25,'lo001'),
('cr008',60,'lo002'),
('cr009',20,'lo002'),
('cr010',100,'lo002'),
('cr011',60,'lo002'),
('cr012',50,'lo002'),
('cr013',40,'lo002'),
('cr014',60,'lo002'),
('cr015',30,'lo002'),
('cr016',45,'lo002'),
('cr017',40,'lo002'),
('cr018',25,'lo002'),
('cr019',20,'lo002'),
('cr020',50,'lo002'),
('cr021',60,'lo002'),
('cr022',70,'lo003'),
('cr023',20,'lo003'),
('cr024',25,'lo003'),
('cr025',40,'lo003'),
('cr026',40,'lo003'),
('cr027',20,'lo003'),
('cr028',25,'lo003'),
('cr029',60,'lo003'),
('cr030',100,'lo003'),
('cr031',120,'lo003')

/*insert values into other enent*/
INSERT INTO eventholding (event_id,holdingdate,location_id)VALUES
('SQLSaturday #626','2017-05-06','lo001'),--Budapest 2017
('SQLSaturday #615','2017-05-06','lo005'),--Baltimore 2017
('SQLSaturday #608','2017-05-13','lo004'),--Bogota 2017
('SQLSaturday #616','2017-05-20','lo002'),-- Kyiv 2017
('SQLSaturday #588','2017-05-20','lo003'),-- New York City 2017
('SQLSaturday #630','2017-05-27','lo005'),-- Brisbane 2017
('SQLSaturday #599','2017-05-27','lo007'),-- Plovdiv 2017
('SQLSaturday #638','2017-01-03','lo008')-- Philadelphia 2017

/*show the events*/
select e.event_id,e.holdingdate ,l.city,l.country,l.region 
from eventholding e,location l
where e.location_id=l.location_id

/*avioding arrange one presenter presting 2 or more presentations at the same time*/
CREATE TRIGGER tri1
	ON schedule 
	FOR INSERT
	AS
	declare @s1 varchar(220);
	declare @s2 varchar(220);
	select @s1=s.time1_id, @s2=p.presenter_id from schedule s join presenting p on s.presentation_id=p.presentation_id
	IF
		(select count(*) from schedule s join presenting p on s.presentation_id=p.presentation_id
		where s.time1_id=@s1 and p.presenter_id=@s2)>1
	BEGIN
		print'The presenter cannot having 2 presentations at the same time'
		ROLLBACK
	END
GO
/*avioding arrange one classroom presting 2 or more presentations at the same time*/
CREATE TRIGGER tri2
	ON schedule 
	FOR INSERT
	AS
	declare @s3 varchar(220);
	declare @s4 varchar(220);
	select @s3=time1_id, @s4=classroom_id from inserted
	IF
		(select count(*) from schedule
		where time1_id=@s3 and classroom_id=@s4)>1
	BEGIN
		print'This class room is using'
		ROLLBACK
	END
GO

select * from sponsor
/*insert schedule value*/
INSERT INTO schedule VALUES
('ps001','t101','cr001'),
('ps002','t102','cr002'),
('ps003','t103','cr008'),
('ps004','t105','cr009'),
('ps005','t106','cr010'),
('ps006','t103','cr003'),
('ps007','t109','cr022'),
('ps008','t101','cr011'),
('ps009','t128','cr012'),
('ps010','t103','cr003'),
('ps011','t104','cr020'),
('ps012','t105','cr022'),
('ps013','t106','cr023'),
('ps014','t107','cr019'),
('ps015','t103','cr031'),
('ps016','t104','cr030'),
('ps017','t105','cr001'),
('ps018','t104','cr002'),
('ps019','t124','cr024'),
('ps020','t125','cr001'),
('ps021','t126','cr020'),
('ps022','t127','cr006'),
('ps023','t101','cr024'),
('ps024','t101','cr025'),
('ps025','t102','cr006'),
('ps026','t103','cr027'),
('ps027','t104','cr028'),
('ps028','t105','cr020'),
('ps029','t106','cr005'),
('ps030','t107','cr027'),
('ps031','t108','cr028'),
('ps032','t109','cr013'),
('ps033','t101','cr014'),
('ps034','t102','cr006'),
('ps035','t103','cr011'),
('ps036','t104','cr012'),
('ps037','t106','cr013'),
('ps038','t107','cr014'),
('ps039','t111','cr022'),
('ps040','t112','cr007'),
('ps041','t102','cr006'),
('ps042','t102','cr022'),
('ps043','t103','cr008'),
('ps044','t104','cr009'),
('ps045','t115','cr010'),
('ps046','t116','cr011'),
('ps047','t103','cr007'),
('ps048','t105','cr005'),
('ps049','t102','cr003'),
('ps050','t103','cr022'),
('ps051','t105','cr023'),
('ps052','t106','cr024'),
('ps053','t107','cr025'),
('ps054','t109','cr026'),
('ps055','t111','cr003'),
('ps056','t113','cr005'),
('ps057','t117','cr022'),
('ps058','t118','cr009'),
('ps059','t120','cr010'),
('ps060','t103','cr004'),
('ps061','t103','cr009'),
('ps062','t105','cr003'),
('ps063','t106','cr011'),
('ps064','t102','cr012'),
('ps065','t105','cr013'),
('ps066','t107','cr022'),
('ps067','t104','cr009'),
('ps068','t102','cr031'),
('ps069','t101','cr029'),
('ps070','t108','cr027'),
('ps071','t115','cr020'),
('ps072','t122','cr025'),
('ps073','t104','cr026'),
('ps074','t106','cr009'),
('ps075','t114','cr022'),
('ps076','t116','cr002'),
('ps077','t121','cr009'),
('ps078','t122','cr001'),
('ps079','t123','cr028'),
('ps080','t126','cr027'),
('ps081','t112','cr020'),
('ps082','t115','cr023'),
('ps083','t116','cr002'),
('ps084','t118','cr009'),
('ps085','t101','cr007'),
('ps086','t104','cr031'),
('ps087','t107','cr007'),
('ps088','t115','cr029'),
('ps089','t117','cr018'),
('ps090','t118','cr019'),
('ps091','t125','cr007'),
('ps092','t126','cr005'),
('ps093','t127','cr003'),
('ps094','t128','cr001'),
('ps095','t102','cr010'),
('ps096','t116','cr023'),
('ps097','t116','cr024'),
('ps098','t128','cr017'),
('ps099','t101','cr027'),
('ps100','t106','cr020'),
('ps101','t102','cr019'),
('ps102','t108','cr022'),
('ps103','t109','cr023'),
('ps104','t110','cr005'),
('ps105','t120','cr027'),
('ps106','t122','cr028'),
('ps107','t101','cr020'),
('ps108','t102','cr004'),
('ps109','t104','cr005'),
('ps110','t106','cr029'),
('ps111','t109','cr020'),
('ps112','t102','cr002'),
('ps113','t106','cr018'),
('ps114','t108','cr003'),
('ps115','t102','cr023'),
('ps116','t103','cr004'),
('ps117','t105','cr025'),
('ps118','t107','cr026'),
('ps119','t108','cr019'),
('ps120','t109','cr023'),
('ps121','t111','cr018'),
('ps122','t114','cr023'),
('ps123','t115','cr024'),
('ps124','t116','cr014'),
('ps125','t117','cr025'),
('ps126','t118','cr003'),
('ps127','t119','cr023'),
('ps128','t120','cr018'),
('ps129','t121','cr022'),
('ps130','t122','cr023'),
('ps131','t123','cr024'),
('ps132','t124','cr025'),
('ps133','t125','cr026'),
('ps134','t126','cr027'),
('ps135','t127','cr020'),
('ps136','t128','cr019'),
('ps137','t108','cr018'),
('ps138','t107','cr017'),
('ps139','t106','cr016'),
('ps140','t105','cr031'),
('ps141','t106','cr016'),
('ps142','t102','cr004'),
('ps143','t108','cr030'),
('ps144','t104','cr016'),
('ps145','t111','cr026'),
('ps146','t115','cr017'),
('ps147','t125','cr028'),
('ps148','t128','cr029'),
('ps149','t108','cr001'),
('ps150','t104','cr022'),
('ps151','t111','cr023'),
('ps152','t115','cr024')

INSERT INTO schedule (presentation_id,time1_id)VALUES
('ps153','t125'),
('ps154','t128')

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