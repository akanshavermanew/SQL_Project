
--1)Insert in profiles

INSERT INTO [Tenant].[dbo].[Profiles] VALUES 
('anusha','pariti','anusha.pariti@gmail.com','8105987404','Bangalore','4/16/2015','F','7L5FZW','Y'),
('Ashish','Singh','ashish.singh@gmail.com','9876890463','Bangalore','5/23/2015','M','KF34MF','Y'),
('Bhaskar','maheshwari','bhaskar.mah@gmail.com','9801834992','Bangalore','5/1/2015','M','5TYSHGF','N'),
('Garima','yadav','garima0191@gmail.com','81059237004','Bangalore','10/20/2015','F','5G5FQW','N'),
('Tanvi','mann','tanvi.mann1907@gmail.com','9178352769','Bangalore','2/16/2015','F','JSH48B','N'),
('Harish','sahai','harish294all@gmail.com','9876548763','Bangalore','11/11/2015','M','MKGI2W','Y'),
('Kamal','gera','kamal0094@gmail.com','8105987404','Bangalore','10/31/2015','M','MK34ER','N'),
('Tushar','kapoor','tushar.kapoor21@gmail.com','8926537154','Pune','12/12/2015','M','KLF12E','N'),
('Shivshankar','das','sankar.shiva730@gmail.com','9801834992','Pune','10/6/2015','M','3RE5TY','Y'),
('Aditi','jain','aditi.jain@sproxil.com','9873123456','Pune','6/11/2015','F','5TPL4E','N'),
('Deepa','sudhakar','sudhakar.deepa@gmail.com','7896785432','Pune','9/15/2015','F','4RTYUIO','Y'),
('Umang','parejiya','uparejiya@gmail.com','7896543674','Pune','7/18/2015','M','6TY4WE','N'),
('Mitali','gupta','mitali.gupta80@gmail.com','8796751238','Pune','3/24/2015','F','5RTYU3','Y'),
('Manisha','Yadav','maniyadav88@gmail.com','9867845182','Delhi','1/27/2015','F','LKGHY6','N'),
('Shivani','godha','shivani_go@nid.edu','9878673428','Delhi','2/19/2015','F','8NM4R','Y'),
('Rajan','pandey','raajanpandey@gmail.com','8987647811','Delhi','9/4/2015','M','5TYUIO','N'),
('Roosena','manuel','roseenasimimanuel@gmail.com','9875623345','Delhi','4/13/2015','F','6TYHU','Y'),
('Prabhjot','gill','prabhjotgill09@gmail.com','9800786688','Delhi','12/30/2015','M','GHJK34','N'),
('Ankita','sharma','ankita.anku96@gmail.com','9988789656','Delhi','8/17/2015','F','TH67TY','Y'),
('Karan','Singh','karan.singh@gmail.com','8976665768','Delhi','9/15/2015','M','LRF34F','N')

-------------------------------------------------------------------------------------------------------------------------------------
--2) Insert in Houses

   insert into [Tenant].[dbo].Houses values 
   ('Apartment','3 BHK',5,'unfurnished',2),
   ('Apartment','3 BHK',3,'unfurnished',1),
   ('Apartment','3 BHK',6,'fully-furnished',4),
   ('Apartment','2 BHK',2,'fully-furnished',0),
   ('Independent','4 BHK',4,'fully-furnished',2),
   ('Apartment','3 BHK',3,'semifurnished',1),
   ('Apartment','3 BHK',3,'semifurnished',0),
   ('Apartment','2 BHK',4,'fully-furnished',1),
   ('Independent','1 BHK',2,'unfurnished',0),
   ('Independent','3 BHK',3,'fully-furnished',1),
   ('Apartment','1 BHK',1,'unfurnished',0),
   ('Independent','1 BHK',2,'unfurnished',1),
   ('Independent','2 BHK',4,'unfurnished',2),
   ('Apartment','3 BHK',3,'fully-furnished',0),
   ('Independent','1 BHK',2,'unfurnished',1),
   ('Apartment','3 BHK',3,'fully-furnished',0),
   ('Independent','3 BHK',3,'fully-furnished',1),
   ('Independent','2 BHK',2,'fully-furnished',1),
   ('Independent','3 BHK',3,'fully-furnished',1),
   ('Independent','1 BHK',2,'unfurnished',2)

---------------------------------------------------------------------------------------------------------------------------------------
--3) Insert in Tenancy_histories

   INSERT INTO [Tenant].[dbo].[Tenancy_histories] VALUES (1,5,'2/12/2015','4/30/2016',7500,'bed','MOVE_OUT')
   INSERT INTO [Tenant].[dbo].[Tenancy_histories] VALUES 
   (2,2,'6/5/2015','',11000,'room',''),
   (3,4,'10/28/2015','11/28/2016',12000,'room','RENT_CHANGE'),
   (4,1,'4/26/2015','',8000,'bed',''),
   (5,3,'5/15/2015','12/27/2015',9000,'bed','MOVE_OUT'),
   (6,8,'12/25/2015','',10200,'room',''),
   (7,6,'11/20/2015','',6500,'bed',''),
   (8,7,'11/10/2015','12/31/2016',7200,'bed','MOVE_OUT'),
   (9,9,'10/15/2015','',7500,'bed',''),
   (10,10,'6/20/2015','',7500,'bed',''),
   (11,19,'8/29/2015','6/14/2016',8000,'bed','INTERNAL_TRANSFER'),
   (12,15,'2/24/2015','',11000,'room',''),
   (13,12,'2/25/2015','',12000,'room',''),
   (14,18,'1/7/2016','12/30/2016',13500,'room','MOVE_OUT'),
   (15,13,'4/7/2015','',6500,'bed',''),
   (16,17,'4/23/2015','',6500,'bed',''),
   (17,14,'2/10/2015','',10500,'room',''),
   (18,16,'10/16/2015','9/4/2016',8000,'bed','MOVE_OUT'),
   (19,20,'9/26/2015','',7500,'bed',''),
   (20,11,'9/30/2015','',9500,'bed','')

---------------------------------------------------------------------------------------------------------------------------------------
--4) Insert in Referrals

   insert into [Tenant].[dbo].Referrals values (2,2500,1,'7/5/2015','9/5/2015')
   insert into [Tenant].[dbo].Referrals values 
   (3,2500,1,'7/5/2015','9/5/2015'),
   (5,1000,0,'12/13/2015','2/13/2016'),
   (6,2500,0,'4/25/2016','6/24/2016'),
   (10,1000,1,'7/1/2015','9/1/2015'),
   (12,2500,1,'5/12/2015','7/12/2015'),
   (13,2500,0,'8/5/2015','10/5/2015'),
   (20,1000,1,'2/5/2016','4/5/2016'),
   (2,2500,0,'8/12/2015','9/12/2015'),
   (5,1000,1,'2/18/2016','4/18/2016')

   SET IDENTITY_INSERT [Tenant].[dbo].Referrals On insert into [Tenant].[dbo].Referrals (ref_id,referrer_id,referrer_bonus_amount,referral_valid,valid_from,valid_till) values 
   (12,20,1500,1,'6/19/2016','8/19/2016')

   SET IDENTITY_INSERT [Tenant].[dbo].Referrals On insert into [Tenant].[dbo].Referrals (ref_id,referrer_id,referrer_bonus_amount,referral_valid,valid_from,valid_till) values 
   (13,9,2500,0,'11/15/2015','1/15/2016')

   SET IDENTITY_INSERT [Tenant].[dbo].Referrals On insert into [Tenant].[dbo].Referrals (ref_id,referrer_id,referrer_bonus_amount,referral_valid,valid_from,valid_till) values 
   (14,13,1000,1,'2/1/2016','4/1/2016')

   SET IDENTITY_INSERT [Tenant].[dbo].Referrals On insert into [Tenant].[dbo].Referrals (ref_id,referrer_id,referrer_bonus_amount,referral_valid,valid_from,valid_till) values 
   (15,5,1000,1,'4/25/2016','6/24/2016')
   

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5) Insert into Addresses

   insert into [Tenant].[dbo].Addresses values ('Zaanz appartment','Sterling BrookSide, Opp. Kundalahalli Colony, ITPL Main Rd',560037,'bangalore',1)
   insert into [Tenant].[dbo].Addresses values 
  ('stag saptgiri','No.44,Ground floor,20th cross,Sector 2 HSR Layout,Bangalore.',560102,'bangalore',2),
 ('sri sai enclave','No.44,First floor,20th cross,Sector 2 HSR Layout.',560102,'bangalore',3),
 ('orchids building','D-208, Balaji Pristine Whitefield Main Road',560066,'bangalore',4),
 ('Fella homes','#11,Annaiya Reddy Rd, Narayana Reddy Layout,Phase 2, Electronic City',560100,'bangalore',5),
 ('Juniper appartments','# 595/1, 1st Floor,1st A main, Domlur Layout',560038,'bangalore',6),
 ('UDB Building','Flat No: T1 Deccan Field Appartment Kunadanhalli main road',560037,'bangalore',7),
 ('Apoorva society','Flat No-202, Apoorva Apartment No-296 Vyalikaval House Building Cooperative Society Ltd Nagavara',561202,'Delhi',8),
 ('Stag saptgiri','Flat No-202, stag saptgiri No-26 phase2 Cooperative Society',560045,'Delhi',9),
 ('VaK Residency','302,#473 VAK Residency, B-Block, AECS Layout Kundalahalli,',456738,'Delhi',10),
 ('Sunshine hills','Flat no 3, water ville apartment R.galli',100234,'Delhi',11),
 ('Sri Sai appartment','2nd House, No-80/289, Sri Hari Darshan Nilaya, Ground Floor, Bellandur',560107,'Delhi',12),
 ('Barvika Residency','B105, 1st floor, B block, Barvika Residency',5610023,'Delhi',13),
 ('Nestaway building','#157, 4th Cross, 1st Main Road, Lower Palace Orchard',546783,'Delhi',14),
 ('Windsor Plaza','#301, Windsor Plaza,ITPL',560025,'Pune',15),
 ('Indira society','No. 502, Indira Meadows, Arunodaya Colony',302017,'Pune',16),
 ('Sri Krishna Society','Flat No-211 Sri Krishna sai enclave, Hoodi village, beside Vivekananda Ashram, Mahadevapura post',560048,'Pune',17),
 ('uniworld','D1-1201, Uniworld Garden 2',543678,'Pune',18),
 ('Vinayaka residency','49, House 1 lathangi 2nd main vinayaka housing layout, RMV 2nd stage bhoopasandra',560094,'Pune',19),
 ('Sun city appartments','Majeera Diamond Towers,malad-west',5600263,'Pune',20)


---------------------------------------------------------------------------------------------------------------------------------------------------------------
--6) Insert into Employement_details

 insert into [Tenant].[dbo].Employment_details values (1,'Sabre','mehdi.hasan@sabre.com',1,'Working')
  insert into [Tenant].[dbo].Employment_details values 
  (2,'hindustan unilever','rags.ramgas@gmail.com',2,'Working'),
  (3,'Technicolor','jigna.thacker@technicolor.com',1,'Working'),
  (4,'','',NULL,'Student'),
  (5,'GE Healthcare','ruchita.save@ge.com',3,'Working'),
  (6,'Aditya birla','shubhi.bajpai@adityabirla.com',3,'Working'),
  (7,'','',NULL,'Student'),
  (8,'','',NULL,'Student'),
  (9,'','',NULL,'Student'),
  (10,'huawei Technologies','gunjan19wadhwa@gmail.com',4,'Working'),
  (11,'','',NULL,'Student'),
  (12,'Centurylink India','PreetInder.Sodhi@centurylink.com',2,'Working'),
  (13,'SAP Labs India','udit.singh@sap.com',2,'Working'),
  (14,'NestAway','deepak@nestaway.com',1,'Working'),
  (15,'','',NULL,'Student'),
  (16,'','',NULL,'Student'),
  (17,'Microsoft','t-akmeh@microsoft.com',2,'Working'),
  (18,'Cognizant','bhavranjan.pandey@cognizant.com',2,'Working'),
  (19,'','',NULL,'Student'),
  (20,'Tiny Mogul Games','sanchit@hike.in',3,'Working')

-------------------------------------------------------------------------------------------------------------------------------------------

UPDATE Tenancy_histories
SET move_out_date=NULL
WHERE move_out_date='1900-01-01';

--queries to check operations
  select * from [Tenant].[dbo].Employment_details
   DELETE FROM [Tenant].[dbo].Tenancy_histories WHERE rent=7500;
   drop table [Tenant].[dbo].Addresses
   drop database tenant