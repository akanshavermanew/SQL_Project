
--for creating database tenant click Databases(on left side it is there) -> new database -> and give name as Tenant

create table Profiles(
   profile_id [int] identity(1,1) NOT NULL,
   first_name [varchar](255) NULL,
   last_name [varchar](255) NULL,
   email_id [varchar](255) NOT NULL,
   phone [varchar](255) NOT NULL,
   city [varchar](255) NULL,
   created_at date NOT NULL,
   gender [varchar](255) NOT NULL,
   referral_code [varchar](255) NULL,
   martial_status [varchar](255) NULL,
   CONSTRAINT pk_profile_id PRIMARY KEY (profile_id)
   )



   create table Houses(
   house_id [int] identity(1,1) NOT NULL,
   house_type [varchar](255) NULL,
   bhk_details [varchar](255) NULL,
   bed_count [int] NOT NULL,
   furnishing_type [varchar](255) NULL,
   beds_vacant [int] NOT NULL,
   CONSTRAINT pk_house_id PRIMARY KEY (house_id)
   )



   create table Addresses(
   ad_id [int] identity(2,1) NOT NULL,
   name [varchar](255) NULL,
   description [text] NULL,
   pincode [int] NULL,
   city [varchar](255) NULL,
   house_id [int] NOT NULL,
   CONSTRAINT pk_ad_id PRIMARY KEY (ad_id),
   CONSTRAINT fk_house_id1 FOREIGN KEY(house_id) REFERENCES Houses(house_id),
   )



   create table Referrals(
   ref_id [int] identity(1,1) NOT NULL,
   referrer_id [int] NOT NULL,
   referrer_bonus_amount [float] NULL,
   referral_valid [tinyint] NULL,
   valid_from date NULL,
   valid_till date NULL,
   CONSTRAINT pk_ref_id PRIMARY KEY (ref_id),
   CONSTRAINT fk_referrer_id FOREIGN KEY(referrer_id) REFERENCES Profiles(profile_id)
   )



   create table Employment_details(
    id [int] identity(1,1) NOT NULL,
	profile_id [int] NOT NULL,
	latest_employer [varchar](255) NULL,
	official_mail_id [varchar](255) NULL,
	yrs_experience [int] NULL,
	occupational_category [varchar](255) NULL,
	CONSTRAINT pk_id1 PRIMARY KEY (id),
   CONSTRAINT fk_profile_id1 FOREIGN KEY(profile_id) REFERENCES Profiles(profile_id)
   )



   create table Tenancy_histories(
   id [int] identity(1,1) NOT NULL,
   profile_id [int] NOT NULL,
   house_id [int] NOT NULL,
   move_in_date date NOT NULL,
   move_out_date date NULL,
   rent [int] NOT NULL,
   bed_type [varchar](255) NULL,
   move_out_reason [varchar](255) NULL,
   CONSTRAINT pk_id PRIMARY KEY (id),
   CONSTRAINT fk_profile_id FOREIGN KEY(profile_id) REFERENCES Profiles(profile_id),
   CONSTRAINT fk_house_id FOREIGN KEY(house_id) REFERENCES Houses(house_id)
   )