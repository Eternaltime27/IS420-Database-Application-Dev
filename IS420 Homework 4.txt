create keyspace AndyLo_Homework4 with replication={'class':'SimpleStrategy', 'replication_factor':1};

use AndyLo_Homework4;

CREATE TABLE invoices ( 
-- header fields
-- removed unused field to remove so much null messing up print out
-- could include them but it make the printout very messy, they aren't important
-- for our current scenerio so don't worry about it
--invoice_id isn't fully int, it have letters so changed to varchar.
invoice_id varchar,
invoice_address map<text,text>,
-- detail fields
article_name text,
--Price aren't even numbers, so changed it to text.
article_price set<text>,
primary key(invoice_id)
);

insert into invoices (invoice_id, invoice_address) values ('I_11',{'address 1':'5124 baltimore national pike','address 2':'unit 2', 'city':'catonsville', 'state':'MD','zipcode':'2122'});

insert into invoices (invoice_id,article_name, article_price) values ('I_12','UMBC Library',{'equipments rental','room reservation fees','golf cart services'});

describe table invoices;
select * from invoices;

CREATE TABLE andylo_user_fact( 
UserDim_ID Varchar,
TimeDim_ID Varchar,
UserFact_ID Varchar,
Friends_Count Int,
Followers_Count Int,
Listed_Count Int,
Statuses_Count Int,
Favorites_Count Int,
Screen_Name Varchar,
Name Varchar,
Description Text,
Url Text,
Lang Varchar,
Created_At Date,
Time_Zone Varchar,
Location Varchar,
Utc_Offset Date,
Is_Translator Varchar,
Protected Varchar,
Verified Varchar,
User_Contributor Varchar,
Geo_Enabled Varchar,
Full_Date Date,
Second Int,
Minutes Int,
Hours Int,
Day Int,
Month Int,
Year Int,
primary key((UserDim_ID),TimeDim_ID)
);

create keyspace AndyLo with replication={'class':'SimpleStrategy', 'replication_factor':1};
create keyspace User_Fact with replication={'class':'SimpleStrategy', 'replication_factor':1};
Describe keyspaces;
Describe table andylo_user_fact
