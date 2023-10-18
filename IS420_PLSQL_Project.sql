/* Team Name: Team 9
/* Team Member Names: Paul Ryu(M3), Andy Lo(M1), Ayu Fantaw(M2), Sangita Rana(M4), Zoiya Aman(M5) 
/* Drop all IS420 Lab Assignment Tables */
DROP TABLE ORDERS;
Drop table Customer;
drop table Restaurant_Inventory;
drop table Waiters;
drop table Menu_Items;
drop table Restaurants;
drop table Cuisine_Type;
/*
drop table active_invoices;
drop table color_sample;
drop table customers;
drop table date_sample;
drop table departments;
drop table employees;
drop table float_sample;
drop table invoice_archive;
drop table invoice_line_items;
drop table invoices;
drop table null_sample;
drop table paid_invoices;
drop table projects;
drop table string_sample;
drop table vendor_contacts;
drop table vendors;
drop table general_ledger_accounts;
drop table terms; */

/*------------------------------------------------------------------------------*/
/* Andy's */
/* Make Cuisine Type Table */
create table Cuisine_Type (
Cuisine_Type_ID number,
Cuisine_Name varchar(30),
Primary Key (Cuisine_Type_ID)
);

/* Drop Cuisine Sequence */
drop sequence Cuisine_Type_Sequence;

/* Make Cuisine Sequence */
Create Sequence Cuisine_Type_Sequence
Start With 1
Increment By 1
NoCache /*No Cache*/
NoCycle; /*Eliminates cyclic redundance*/

/* Insert for Cuisine_Type */
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'French');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Chinese');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Japanese');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Indian');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Italian');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Greek');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Spanish');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Lebanese');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Moroccan');
Insert Into Cuisine_Type 
Values 
(Cuisine_Type_Sequence.nextval, 'Turkish');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'Thai');
Insert Into Cuisine_Type
Values 
(Cuisine_Type_Sequence.nextval, 'American');

/*------------------------------------------------------------------------------*/
/* Andy's */
/* Make Restaurant Table */
create table Restaurants (
Restaurant_ID number,
Restaurant_Name varchar(30),
Cuisine_Type_ID number,
Str_Address varchar(30),
City_ID varchar(30),
State_ID varchar(30),
Zip_ID varchar(30),
Primary Key (Restaurant_ID),
Foreign Key (Cuisine_Type_ID) references Cuisine_Type (Cuisine_Type_Id) /*Restaurant's Cuisine_Type_ID based off of Cuisine_Type's Cuisine_Type_ID */
);

/* Drop Restaurant Sequence */
drop sequence Restaurant_Sequence;

/* Make Restaurant Sequence */
Create Sequence Restaurant_Sequence
Start With 1 /*sequence identifier starts at one and increases by 1 */
Increment By 1
NoCache
NoCycle;

/* Insert Preliminaries for Restaurants */
Insert Into Restaurants 
Values  /*Nextval uses next avaliable identifier*/
(Restaurant_Sequence.nextval, 'Le Bernardin Prive', '1', '153 W 51st St', 'New York', 'NY', '10019' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Le Diplomate', '1', '1601 14th St NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Monarque', '1', '1010 Fleet St', 'Baltimore', 'MD', '21202' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'La Ferme Restaurant', '1', '7101 Brookville Rd', 'Chevy Chase', 'MD', '20815' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Peking Gourmet Inn', '2', '6029 Leesburg Pike', 'Falls Church', 'VA', '22041' );
Insert Into Restaurants  
Values 
(Restaurant_Sequence.nextval, 'Nom Wah Tea Parlor', '2', '13 Doyers St', 'New York', 'NY', '10013' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Nobu', '3', '903 N La Cienega Blvd', 'Los Angeles', 'CA', '90069' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Arami', '3', '1829 W Chicago Ave', 'Chicago', 'IL', '60622' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Imanas Tei', '3', '2626 S King St', 'Honolulu', 'HI', '96826' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Sushi Nakazawa', '3', '23 Commerce St', 'New York', 'NY', '10014' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Raku', '3', '5030 Spring Mountain Rd', 'Las Vegas', 'NV', '89146' );
Insert Into Restaurants
Values 
(Restaurant_Sequence.nextval, 'Uchi Austin', '3', '801 S Lamar Blvd', 'Austin', 'TX', '78704' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Rasika', '4', 'D St NW', 'Washington', 'DC', '20004' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Adda', '4', '31-31 Thomson Ave', 'Queens', 'NY', '11101' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'Bollywood Theatre', '4', '2039 NE Alberta St', 'Portland', 'OR', '97211' );
Insert Into Restaurants 
Values 
(Restaurant_Sequence.nextval, 'The Red Hen', '5', '1822 1st St. NW', 'Washington', 'DC', '20001' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'San Lorenzo', '5', '1316 9th St NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Officina', '5', '1120 Maine Ave SW', 'Washington', 'DC', '20024' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Fiola', '5', '601 Pennsylvania Ave NW', 'Washington', 'DC', '20004' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Lupo Verde', '5', '1401 T St NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Molyvos', '6', '402 West 43rd St', 'New York', 'NY', '10014' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Greek Islands Chicago', '6', '200 S Halsted St', 'Chicago', 'IL', '60661' );
Insert Into Restaurants
Values 
(Restaurant_Sequence.nextval, 'Zaytinya', '6', '701 9th St NW', 'Washington', 'DC', '20001' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Esperia Grill', '6', '344 Washington St', 'Brighton', 'MA', '02135' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'TABERNA DE HARO', '7', '999 Beacon Street', 'Boston', 'MA', '02446' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'CASA MONO', '7', '52 Irving Place', 'New York', 'NY', '10003' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Maydan', '8', '1346 Florida Ave NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Soussi Restaurant', '9', '2228 18th St NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Mez? Restaurant', '10', '2437 18th St NW', 'Washington', 'DC', '20009' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Noras Kabob', '10', '9338 Baltimore National Pike', 'Ellicott City', 'MD', '21042' );
Insert Into Restaurants 
Values
(Restaurant_Sequence.nextval, 'Thai at Waugh Chapel', '11', '1406 S Main Chapel Way #102', 'Gambrills', 'MD', '21054' );

/*------------------------------------------------------------------------------*/
/* Ayu's */
/* Make Waiter Table */
create table Waiters(
Waiter_ID number,
Waiter_Name varchar(30),
Restaurant_ID number,
Primary Key(Waiter_ID),
Foreign key (Restaurant_ID) references Restaurants(Restaurant_ID)
);

/* Drop Waiter Sequence */
drop sequence Waiters_Sequence;

/* Make Waiter Sequence */
Create sequence Waiters_Sequence
start with 1
increment by 1
NoCache
NoCycle;
/*------------------------------------------------------------------------------*/
/* Paul's */
/* Make Menu Item Table */
Create Table Menu_Items(
Menu_Item_ID Number,
Cuisine_Type_ID Number,
Menu_item_name Varchar(100),
Price Number,
Primary Key(Menu_item_id),
Foreign Key(Cuisine_Type_ID) References Cuisine_type(Cuisine_Type_ID)
);

/* Drop Menu Item Sequence */
drop sequence menu_Items_Sequence;

/* Make Menu Item Sequence */
Create sequence Menu_Items_Sequence
Start with 1
Increment By 1
NoCache
NoCycle;

/* Insert for Menu Item */
Insert into Menu_Items(Menu_Item_ID, Cuisine_Type_ID, Menu_Item_Name, Price)
values(Menu_Items_Sequence.nextVal, 1, 'Snails', 25.99);
Insert into Menu_Items
values(Menu_Items_Sequence.nextVal, 5, 'Spaghetti', 12.99);
Insert into Menu_Items
values(Menu_Items_Sequence.nextVal, 2, 'Lo Mein', 10);
Insert into Menu_Items
values(Menu_Items_Sequence.nextVal, 6, 'Gyro', 4.50);
Insert into Menu_Items
values(Menu_Items_Sequence.nextVal, 12, 'Hotdog', 2);

/*------------------------------------------------------------------------------*/
/* Paul's */
/* Make Restaurant Inventory Table */
Create Table Restaurant_Inventory(
Restaurant_ID Number,
Menu_Item_ID Number,
Menu_Item_name Varchar(100),
Menu_Item_Quantity Number,
Foreign Key(Menu_Item_ID) References Menu_Items(Menu_Item_ID),
Foreign Key(Restaurant_ID) References Restaurants(Restaurant_ID)
);

/* Drop Restaurant_Inventory_Sequence */
Drop sequence Restaurant_Inventory_Sequence;

/* Make Restaurant Sequence */
Create Sequence Restaurant_Inventory_Sequence
Start with 1
Increment by 1
NoCache
NoCycle;

/* Insert for Restaurant Inventory */
insert into Restaurant_Inventory(Restaurant_ID, Menu_item_ID, Menu_Item_Name, Menu_Item_Quantity)
values(1, 1, 'Snails', 100);
insert into Restaurant_Inventory
values(2, 2, 'Spaghetti', 100);
insert into Restaurant_Inventory
values(3, 3, 'Lo Mein', 100);
insert into Restaurant_Inventory
values(4, 4, 'Gyro', 200);
insert into Restaurant_Inventory
values(4, 5, 'Hotdog', 200);

/*------------------------------------------------------------------------------*/
/* Zoiya's */
/* Make Customer Table */
Create table customer(
 cust_id NUMBER not null,
 cust_name varchar2(25) not null,
 cust_email varchar2(45),
 cust_street_address varchar2(40) not null,
 cust_city varchar2(20),
 cust_state varchar(20),
 cust_Zipcode varchar2(6),
 Cust_CC_Num varchar (20),
 primary key (cust_id)
);

/* Drop Customer Sequence */
drop SEQUENCE cust_id;

/* Make Customer Sequence */
Create SEQUENCE cust_id
Start with 1 
Increment by 1;

/* Insert for Customer */
insert into customer values (cust_id.nextval, 'Holly Austin', 
'hollyaustin3@gmail.com', '120 Light st.', 'baltimore', 'MD', 21044,
4400110013758833);
insert into customer values (cust_id.nextval, 'Hazel brook', 
'hazelbrook55@gmail.com', '125 Light st.', 'baltimore', 'MD', 21044,
4410120015756633);
insert into customer values (cust_id.nextval, 'John Carey', 
'Johncarey43@gmail.com', '127 Light st.', 'Towson', 'MD', 21134,
4460116013858834);
/*------------------------------------------------------------------------------*/
/* Sangita's */
/* Make Orders Table */
CREATE TABLE ORDERS
(
  order_id NUMBER ,
  restaurant_id NUMBER ,         
  cust_id NUMBER NOT NULL,
  order_date DATE	,
  menu_item_id NUMBER ,
  waiter_id NUMBER ,
  amount_paid NUMBER(9,2),
  tip NUMBER(9,2),
  
    PRIMARY KEY (order_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id),
	FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id),
	FOREIGN KEY (waiter_id) REFERENCES waiters (waiter_id),
    FOREIGN KEY (cust_id) REFERENCES customer (cust_id)
);

/* Drop Customer Sequence */
drop SEQUENCE order_id_seq;

/* Make Customer Sequence */
CREATE SEQUENCE order_id_seq
START WITH 1;
/
/*------------------------------------------------------------------------------*/
/*(Function) Cuisine_Type*/
/* Andy's */
Create or replace function Find_Cuisine_Type_ID (Param_Cuisine_Name in VarChar2) return
number
As
Stored_Cuisine_Type_ID Cuisine_Type.Cuisine_Type_ID%type;
Begin
Select Cuisine_Type_ID
Into Stored_Cuisine_Type_ID
From Cuisine_Type
Where Cuisine_Type.Cuisine_Name = Param_Cuisine_Name;
Return Stored_Cuisine_Type_ID;
End;
/*
select Find_Cuisine_Type_ID ('French') from dual;
select Find_Cuisine_Type_ID ('Japanese') from dual;
select Find_Cuisine_Type_ID ('Chinese') from dual;
select Find_Cuisine_Type_ID ('M22') from dual;
*/
/
/*------------------------------------------------------------------------------*/
/*(Function) Restaurants*/
/* Andy's */
create or replace function Find_Restaurant_ID (Param_Restaurant_Name in VarChar) return number
As
Stored_Restaurant_ID Restaurants.Restaurant_ID%type;
Begin
Select Restaurant_ID
Into Stored_Restaurant_ID
From Restaurants
Where Restaurants.Restaurant_Name = Param_Restaurant_Name;
Return Stored_Restaurant_ID;
exception
when others then
dbms_output.put_line('Not a restaurant');
Return Stored_Restaurant_ID;
end;
/
/*------------------------------------------------------------------------------*/
/*(Function) Waiter*/
/* Ayu's */
Create or replace function FIND_WAITER_ID(Param_Waiter_Name in varchar) return number
as 
Chose_Waiter_ID Waiters.Waiter_ID%type;
begin
select Waiter_ID
into Chose_Waiter_ID
from Waiters
where Waiters.Waiter_Name = Param_Waiter_Name;
return Chose_Waiter_ID;
end;
/
/*------------------------------------------------------------------------------*/
/*(Function) Menu Item*/
/* Paul's */
create or replace Function Find_Menu_Item_ID(Item_name in Varchar2) return Number
as
    Item_name_Cursor Menu_items.Menu_item_name%type;
    Return_Menu_ID number;
begin
    Select Menu_Item_ID
    into Return_Menu_ID
    from Menu_Items
    where Item_name = Menu_Item_name;
    Return Return_Menu_ID;
exception
    when no_data_found then 
    raise_application_error(-20001, 'Menu Item does not exist');
end;
/
/*------------------------------------------------------------------------------*/
/*(Function) Customer ID*/
/* Zoiya's */
Create or replace function Find_Customer_ID (Param_Cust_Name in VARCHAR)
return number
as 
CustomerID customer.cust_id%type;
Print_Message varchar(100);
begin 
Select Cust_ID into CustomerID
from customer
where customer.cust_name = param_cust_name;
return CustomerID;
exception
when no_data_found then 
raise_application_error(-20001, 'Customer does not exist');
end;
/
/*------------------------------------------------------------------------------*/
/*(Function) Order ID*/
/* Sangita's */
create or replace function Find_Order_ID(p_restaurant_id in number, p_cust_id in number, 
p_menu_item_id in number, p_waiter_id in number)
return number
as
stored_order_id orders.order_id%type;
begin
select order_id into stored_order_id
from orders
where restaurant_id = p_restaurant_id
and cust_id = p_cust_id
and menu_item_id = p_menu_item_id
and waiter_id = p_waiter_id;
return stored_order_id;
exception
when no_data_found then 
raise_application_error(-20001, 'The order_id does not exist.');
end;
/
/*------------------------------------------------------------------------------*/
/*[ #1 ] (Procedure) Input New Cuisine Type */
/* Andy #1 */
Create or replace procedure Cuisine_Type_Insert /*Create Procedure Cuisine_Type_Insert */
(
  CuiName Cuisine_Type.Cuisine_Name%Type
)
As
Begin
	Insert Into Cuisine_Type 
	Values (Cuisine_Type_Sequence.nextval, CuiName);
    exception
    when no_data_found then
    dbms_output.put_line('Nothing Found');
End;
/
/*(Executes) Add American and Russian Cuisine Type */
Execute Cuisine_Type_Insert ('West American')
Execute Cuisine_Type_Insert ('Russian')
/
/*------------------------------------------------------------------------------*/
/*[ #2 ] (Procedure) Input New Restaurant*/
/* Andy #2 */
Create or replace procedure Restaurant_Info_Insert
(
  ResName Restaurants.Restaurant_Name%Type, /*Declare Restaurant Name = ResName */
  CuiType Restaurants.Cuisine_Type_ID%Type,
  Address Restaurants.Str_Address%Type,
  City Restaurants.City_ID%Type,
  InputState Restaurants.State_ID%Type,
  Zip Restaurants.Zip_ID%Type
)
As
Begin
	Insert Into Restaurants  /*Retreive ResName from Restaurant Name */
	Values (Restaurant_Sequence.nextval, ResName, CuiType, Address, City, InputState, Zip);
    exception
when no_data_found then
dbms_output.put_line('Nothing Found');
End;
/
/*(Executes) Add Lotus of Siam, Jewel of India, and 3 other Restaurants */
Execute Restaurant_Info_Insert ('Lotus of Siam', '11', '953 E Sahara Ave Ste A5', 'Las Vegas', 'NV', '89104' )
Execute Restaurant_Info_Insert ('Jewel of India', '4', '10151 New Hampshire Ave', 'Silver Spring', 'MD', '20903' )
Execute Restaurant_Info_Insert ('Applebee Grill', '12', '2408 Brandermill Blvd', 'Gambrills', 'MD', '21054' )
Execute Restaurant_Info_Insert ('Old Ebbitt Grill', '12', '675 15th St NW', 'Washington', 'DC', '20005' )
Execute Restaurant_Info_Insert ('Samovar Cafe', '13', '64935 Nikolaevsk Rd', 'Nikolaevsk', 'AK', '99556' )
/
/*------------------------------------------------------------------------------*/
/*[ #3 ] (Procedure) Find Restaurant Matching Cuisine Input*/
/* Andy #3 */
set serveroutput on;
create or replace procedure profitableDay (Procedure_Cuisine_Name_Input IN VarChar)
is
  cursor Restaurants_Cursor is
    select Cuisine_Name, Str_Address, Restaurant_Name
    from Cuisine_Type
    Inner Join Restaurants On Restaurants.Cuisine_Type_ID = Cuisine_Type.Cuisine_Type_ID
    where Cuisine_Type.Cuisine_Name = Procedure_Cuisine_Name_Input;
  Restaurant_Rec Restaurants_Cursor%rowtype;
  Total_Revenue varchar2(30);
begin
  Total_Revenue := Find_Cuisine_Type_ID(Procedure_Cuisine_Name_Input);
  for Restaurant_Rec in Restaurants_Cursor
  loop
  dbms_output.put_line(Restaurant_Rec.Restaurant_Name || ' at ' || Restaurant_Rec.Str_Address || ' offers ' || Procedure_Cuisine_Name_Input || ' food.');
  end loop;
  exception
  when no_data_found then
  dbms_output.put_line('No vendor was found');
  end;
  /
  /*(Executes) Find Restaurant with Indian Cuisine and test 'Wrong Input' */
  execute profitableDay('Indian');
  execute profitableDay('Wrong');
  /
/*------------------------------------------------------------------------------*/
/*[ #4 ] (Procedure) Total_Revenue for Restaurant per Cuisine, Per State*/
/* Andy #4 */
  create or replace procedure Get_Total_Revenue (Procedure_State_Input IN VarChar)
is
cursor TotalProfit_Cursor is
Select State_ID, Cuisine_Name, Sum(Amount_Paid) As Total_Revenue
From Restaurants
Join Orders On Restaurants.Restaurant_ID = Orders.Restaurant_ID
Join Cuisine_Type On Restaurants.Cuisine_Type_ID = Cuisine_Type.Cuisine_Type_ID
Where Cuisine_Name = Procedure_State_Input
Group by State_ID, Cuisine_Name;
TotalProfit_Rec TotalProfit_Cursor%rowtype;
Begin
Open TotalProfit_Cursor;
loop
        Fetch TotalProfit_Cursor Into TotalProfit_Rec; 
        Exit When TotalProfit_Cursor%notfound;
        dbms_output.put_line('Restaurants in ' || TotalProfit_Rec.State_ID || ' That Serve ' || TotalProfit_Rec.Cuisine_Name || ' Food, Make An Total Of $' || TotalProfit_Rec.Total_Revenue);    
    End Loop;
    exception
    when no_data_found then
    dbms_output.put_line('No Restaurant was found');
    close TotalProfit_Cursor;
end;
/
/*(Executes) Total_Revenue for Cuisine, Per State */
execute Get_Total_Revenue('Indian');
execute Get_Total_Revenue('French');
execute Get_Total_Revenue('Lebanese');
execute Get_Total_Revenue('Italian');
execute Get_Total_Revenue('Japanese');
execute Get_Total_Revenue('Greek');
/
/*------------------------------------------------------------------------------*/
/*[ #5 ] (Procedure) Hire Waiters*/
/* Ayu #1 */
create or replace procedure Hire_Waiter(Param_Waiter_Name in varchar, Param_Rest_Name in varchar)
is
Chose_Rest_ID number;
invalid_rest exception;
begin
Chose_Rest_ID := FIND_RESTAURANT_ID(Param_Rest_Name);
if Chose_Rest_ID is null then
raise invalid_rest;
end if;
Insert into Waiters values(Waiters_Sequence.nextval, Param_Waiter_Name,Chose_Rest_ID);
exception 
when invalid_rest then
dbms_output.put_line('Enter valid rest name');
end;
/
/*(Executes) Add waiters Restaurants */
execute hire_Waiter('Ayu Fan', 'Zaytinya');
execute hire_Waiter('Andy Lo', 'Zaytinya');
execute hire_waiter('Lebron James', 'Nobu');
execute hire_waiter('Kobe Bryant', 'Maydan');
execute hire_waiter('Dave Chappelle', 'Fiola');
execute hire_waiter('Kevin Heart', 'Fiola');
execute hire_waiter('Michael Jordan', 'Fiola');
execute hire_waiter('Michael Blackson', 'Monarque');
execute hire_waiter('JJ Watt', 'Arami');
execute hire_waiter('Paul Ryu', 'Arami');
execute hire_Waiter('Sangita Rana', 'Rasika');
execute hire_Waiter('Sarah Tein', 'Rasika');
/
/*------------------------------------------------------------------------------*/
/*[ #6 ] (Procedure) Print All Waiter Working at X Restaurant*/
/* Ayu #2 */
Create or replace procedure Waiter_List(Param_Rest_Name in varchar) 
as
cursor stored_waiters is
select * from waiters;
user_rec stored_waiters%rowtype;
Chose_Rest_ID number;
begin
Chose_Rest_ID := FIND_RESTAURANT_ID(Param_Rest_Name);
for user_rec in stored_waiters
loop
if user_rec.restaurant_id = Chose_Rest_ID then
dbms_output.put_line(user_rec.waiter_ID || ', ' || user_rec.Waiter_name || ', ' ||user_rec.restaurant_ID);
end if;
end loop;
exception when no_data_found then
dbms_output.put_line('No data in waiters');
end;
/
/*(Executes) Output all Waiter working at Zaytina */
execute Waiter_List('Zaytinya');
/
/*------------------------------------------------------------------------------*/
/*[ #9 ] (Procedure) Add Menu Item*/
/* Paul #1 */
create or replace Procedure CreateMenuItem
    (CuisineType IN Varchar2, NameOfItem in Varchar, price in Number)
is 
    cuisine_ID number;

Begin
cuisine_ID := Find_Cuisine_Type_ID(CuisineType);
    Insert into Menu_items(Menu_item_ID, Cuisine_Type_ID, Menu_Item_name, Price)
    values(Menu_Items_Sequence.nextVal, cuisine_ID, NameOfItem, price); 
    Dbms_output.put_line('Value inserted into table');
    exception
        when no_data_found then 
            raise_application_error(-20001, 'Menu Item does not exist');
End;
/
/*(Executes) Input Menu Item */
Exec CreateMenuItem('Indian', 'Chicken Tikka Masala', 14);
Exec CreateMenuItem('Japanese', 'Tonkatsu Tsukemon', 14);
Exec CreateMenuItem('Thai', 'Green Curry', 14);
Exec CreateMenuItem('Thai', 'Drunken Noodles', 14);
Exec CreateMenuItem('American', 'Ribs', 14);
Exec CreateMenuItem('Chinese', 'Chow Fun', 14);
Exec CreateMenuItem('Chinese', 'Peking Duck', 14);
Exec CreateMenuItem('Indian', 'Butter Chicken', 14);
Exec CreateMenuItem('American', 'Burger', 14);
Exec CreateMenuItem('Japanese', 'Japanese Style Burger', 14);
/
/*------------------------------------------------------------------------------*/
/*[ #10 ] (Procedure) Add Menu Item*/
/* Paul #2 */
create or replace Procedure Add_Item_Restr_Inven
    (RestrName in varchar, MenuItemName in varchar, MenuQuantity in Number)
is 
    RestrID number;
    MenuItemId number;
begin
--Wasn't provided helper functions so hard coded the values instead
    --RestrID := Find_Restaurant_ID(RestrName);
    --MenuItemID := Find_Menu_Item_ID(:ItemName);
    RestrID := Find_Restaurant_ID(RestrName);
    MenuItemID := Find_Menu_Item_ID(MenuItemName);

    insert into Restaurant_Inventory(Restaurant_ID, Menu_item_ID, Menu_Item_Name, Menu_Item_Quantity)
    values(RestrID, MenuItemID, MenuItemName, MenuQuantity);
        Dbms_output.put_line('Value inserted into table');
	exception
        when no_data_found then 
            raise_application_error(-20001, 'Menu Item does not exist');
end;
/
/*(Executes) Input Restaurant Inventory */
Execute Add_Item_Restr_Inven('Zaytinya', 'Burger', 100);
/
/*------------------------------------------------------------------------------*/
/*[ #11 ] (Procedure) Update Menu Item*/
/* Paul #3 */
create or replace Procedure Update_Menu_Item_Inventory(Rest_ID in number, Item_ID in number, quantity in number) is
Item_cursor Restaurant_Inventory.Menu_Item_Quantity%type;
Updated_Quantity number;

Begin
    Select Menu_Item_Quantity
    into Item_cursor
    from Restaurant_Inventory
    where Restaurant_ID = Rest_ID and Item_ID = Menu_Item_ID;
    Updated_Quantity := Item_Cursor - Quantity;
    Update Restaurant_Inventory
    set Restaurant_ID = rest_ID, Menu_Item_ID = Item_ID, Menu_ITem_Quantity = updated_Quantity
    where Restaurant_ID = Rest_ID and Item_ID = Menu_Item_ID;
    exception
        when no_data_found then 
            raise_application_error(-20001, 'Menu Item does not exist');
end;
/
/*------------------------------------------------------------------------------*/
/*[ #12 ]  Report Menu Item*/
/* Paul #4 */
Create or Replace Procedure Generate_Report_Menu_Items 
as
    Cursor Reports_Cursor is
        Select ct.Cuisine_name, COUNT(mi.Menu_Item_ID) as Total_Menu_Items
        from Menu_items mi, Cuisine_type ct
        where mi.Cuisine_Type_ID = ct.Cuisine_type_ID
        Group by ct.Cuisine_name;
    Menu_Items Reports_Cursor%rowtype;
begin
    dbms_output.put_line('MENU ITEMS REPORT');
    dbms_output.put_line('');
    for Menu_Items in Reports_Cursor
    loop
        dbms_output.put_line('Cuisine Type: '  || Menu_Items.Cuisine_name);
        dbms_output.put_line('Total Menu Items: ' || Menu_Items.Total_Menu_Items);
        dbms_output.put_line('');
    --Select ct.Cuisine_name, COUNT(mi.Menu_Item_ID) as Total_Menu_Items
    --from Menu_items mi, Cuisine_type ct
    --where mi.Cuisine_Type_ID = ct.Cuisine_type_ID
    --Group by ct.Cuisine_name;
    end loop;
    exception
        when no_data_found then 
            raise_application_error(-20001, 'No data in the Cuisine table');
end;
/
/*(Executes) Generate_Report_Menu_Items */
Execute Generate_Report_Menu_Items;
/
/*------------------------------------------------------------------------------*/
/*[ #17 ] (Procedure) Insert Customers*/
/* Zoiya #1 */
Create or replace procedure Add_Customer
   (CustomerName in varchar2, 
    CustomerEmail in Varchar2, 
    CustomerStreetAddress in Varchar2,
    CustomerCity in varchar2, 
    CustomerState in varchar2, 
    CustomerZipCode in varchar2,
    CreditCardNum in varchar2)
is 
Begin 
    insert into customer (Cust_ID, 
                            Cust_Name, 
                            Cust_Email, 
                            cust_street_address, 
                            cust_city, 
                            cust_state, 
                            cust_zipcode, 
                            cust_cc_num) 
    values (cust_id.nextval,
                CustomerName, 
                CustomerEmail, 
                CustomerStreetAddress,
                CustomerCity, 
                CustomerState, 
                CustomerZipCode,
                CreditCardNum);
         dbms_output.put_line('Values added to the customer table');
exception 
         when no_data_found then
         dbms_output.put_line('Customer does not exist');
commit;
end;
/
/*(Executes) Input Customers */
exec Add_Customer ('Anne Roberts', 'anneroberts3@gmail.com', '129 Light st.', 'Hanover', 'MD', 21134, 4460116013858774);
exec Add_Customer ('Robert Jr.', 'RobertJr4@gmail.com', '1223 Random st.', 'Bowie', 'MD', 211324, 4460116013858774);
exec Add_Customer ('John West', 'JohnW55@gmail.com', '129 Town Center Blvd', 'Fresno', 'CA', 93650, 4460116013856584);
exec Add_Customer ('Avery Hynes', 'AveryH5@gmail.com', '1329 Town Center Blvd', 'Fresno', 'CA', 93650, 4460134913856584);
exec Add_Customer ('Alisa Jane', 'Ajane345@gmail.com', '129 Harvey St.', 'Freeport', 'NY', 11520, 4460155323856584);
exec Add_Customer ('Chris Evans', 'Cevans345@gmail.com', '818 Olivia St.', 'Key West', 'FL', 33040, 4460117013856654);
exec Add_Customer ('Chrisian Miller', 'Christianm36@gmail.com', '278 Olivia St.', 'Key West', 'FL', 33040, 4460553013856854);
/
/*------------------------------------------------------------------------------*/
/*[ #13 ] (Procedure) Insert Order*/
/* Sangita's #1 */
create or replace procedure Place_Order
(p_restaurant_name in varchar2, p_cust_name in varchar2, p_order_date in date,
p_menu_item_name in varchar2, p_waiter_name in varchar, p_amount_paid in number)
is
v_restaurant_id number;
v_cust_id number;
v_menu_item_id number;
v_waiter_id  number;

begin
v_restaurant_id := FIND_RESTAURANT_ID(p_restaurant_name);
v_cust_id := FIND_CUSTOMER_ID(p_cust_name);
v_menu_item_id := FIND_MENU_ITEM_ID(p_menu_item_name);
v_waiter_id := FIND_WAITER_ID(p_waiter_name);

insert into orders (order_id, restaurant_id, cust_id, order_date, 
menu_item_id, waiter_id, amount_paid, tip)
values(order_id_seq.nextval, v_restaurant_id, v_cust_id, p_order_date, v_menu_item_id, 
v_waiter_id, round(p_amount_paid,2), round((p_amount_paid *0.20),2));
dbms_output.put_line('The order has been placed.');

exception
when no_data_found then
dbms_output.put_line('The order cannot be placed.');
end;
/
/*(Executes) Place order and populate the orders table. */
exec Place_Order('Rasika','John Carey', '04-JAN-2022', 'Snails', 'Sangita Rana', 25.99); 
exec Place_Order('Rasika','Chris Evans', '05-JAN-2022', 'Gyro', 'Sangita Rana', 4.5);
exec Place_Order('Rasika', 'Alisa Jane', '04-JAN-2022', 'Hotdog', 'Sangita Rana', 2);
exec Place_Order('Rasika', 'Anne Roberts', '07-JAN-2022', 'Chow Fun', 'Sarah Tein', 14.00);
exec Place_Order('Rasika', 'John Carey', '07-JAN-2022', 'Hotdog', 'Sarah Tein', 2.00);
/* FOR ADDA */
exec Place_Order('Adda', 'John West', '06-JAN-2022', 'Spaghetti', 'Paul Ryu', 12.99);
exec Place_Order('Adda', 'Robert Jr.', '06-JAN-2022', 'Lo Mein', 'JJ Watt', 10.00);
exec Place_Order('Adda', 'Anne Roberts', '05-JAN-2022', 'Spaghetti', 'JJ Watt', 12.99);
exec Place_Order('Adda', 'Robert Jr.', '05-JAN-2022', 'Chicken Tikka Masala', 'Paul Ryu', 14.00);
/* FOR MONARQUE */
exec Place_Order('Monarque', 'Holly Austin', '06-JAN-2022', 'Spaghetti', 'Michael Blackson', 12.99);
exec Place_Order('Monarque', 'Avery Hynes', '05-JAN-2022', 'Burger', 'Michael Blackson', 14.00);
/* FOR Fiola */
exec Place_Order('Fiola', 'Hazel brook', '04-JAN-2022', 'Ribs', 'Michael Jordan', 14.00);
exec Place_Order('Fiola', 'Chrisian Miller', '04-JAN-2022', 'Peking Duck', 'Kevin Heart', 14.00);
exec Place_Order('Fiola', 'Anne Roberts', '05-JAN-2022', 'Ribs', 'Dave Chappelle', 14.00);
exec Place_Order('Fiola', 'John West', '05-JAN-2022', 'Snails', 'Michael Jordan', 25.99);
exec Place_Order('Fiola', 'John Carey', '05-JAN-2022', 'Peking Duck', 'Kevin Heart', 14.00);
/* FOR NOBU */
exec Place_Order('Nobu', 'Alisa Jane', '05-JAN-2022', 'Drunken Noodles', 'Lebron James', 14.00);
exec Place_Order('Nobu', 'Anne Roberts', '05-JAN-2022', 'Gyro', 'Lebron James', 4.5);
exec Place_Order('Fiola', 'Chrisian Miller', '06-JAN-2022', 'Gyro', 'Lebron James', 4.5);
/* For Maydan */
exec Place_Order('Maydan', 'Chris Evans', '06-JAN-2022', 'Chow Fun', 'Kobe Bryant', 14.00);
exec Place_Order('Maydan', 'Robert Jr.', '06-JAN-2022', 'Butter Chicken', 'Kobe Bryant', 14.00);
exec Place_Order('Maydan', 'Hazel brook', '06-JAN-2022', 'Green Curry', 'Kobe Bryant', 14.00);
/
/*------------------------------------------------------------------------------*/
/*[ #7 ] (Procedure and Function) Waiter's Tip*/
/* Ayu #3 */
    /*Procedure*/
Create or replace function waiter_tips(param_waiter_id in number) return number is
cursor stored_orders is
select * from orders;
user_rec stored_orders%rowtype;
chose_waiter_id number;
total_amount number;
begin
total_amount := 0;
chose_waiter_id := param_waiter_id;
for user_rec in stored_orders
loop
if user_rec.waiter_id = chose_waiter_id then
total_amount := total_amount + user_rec.tip;
end if;
end loop;
return total_amount;
end;
/
    /*Function*/
create or replace procedure all_waiter_tips is
cursor all_waiters is
select * from waiters;
waiter_rec all_waiters%rowtype;
begin
for waiter_rec in all_waiters
loop
dbms_output.put_line(waiter_rec.waiter_id || ': ' || waiter_tips(waiter_rec.waiter_id));
end loop;
exception when no_data_found then
dbms_output.put_line('No data in waiters');
end;
/
/*(Executes) Report All Waiter Tips */
execute all_waiter_tips;
/
/*------------------------------------------------------------------------------*/
/*[ #8 ] (Procedure and Function) State Tips*/
/* Ayu #4 */
    /*Procedure*/
Create or replace function state_tips(param_state_id in varchar) return number is
cursor stored_orders is
select * from orders;
cursor stored_rest is
select * from restaurants where state_id = param_state_id;
rest_rec stored_rest%rowtype;
order_rec stored_orders%rowtype;
total_amount number;
begin
total_amount := 0;
for rest_rec in stored_rest
loop
for order_rec in stored_orders
loop
if order_rec.restaurant_id = rest_rec.restaurant_id then
total_amount := total_amount + order_rec.tip;
end if;
end loop;
end loop;
return total_amount;
exception when no_data_found then
dbms_output.put_line('not a real state');
end;
/
    /*Function*/
Create or replace procedure all_state_tips is
cursor all_states is
select distinct state_id from restaurants;
rest_rec all_states%rowtype;
begin
for rest_rec in all_states
loop
dbms_output.put_line(rest_rec.state_id || ': ' || state_tips(rest_rec.state_id));
end loop;
end;
/
/*(Executes) Report All State Tips */
execute all_state_tips;
/
/*------------------------------------------------------------------------------*/
/*[ #14 ] (Procedure) List All Orders On X Day*/
/* Sangita #2 */
create or replace procedure List_Orders (r_name in varchar2, p_date in date)
as
cursor restaurant_orders is
select order_id, order_date, menu_item_name, restaurant_name
from orders, menu_items, restaurants
where orders.menu_item_id = menu_items.menu_item_id
and orders.restaurant_id = restaurants.restaurant_id
and restaurant_name = r_name
and order_date = p_date;
orders_rec restaurant_orders%rowtype;
begin
dbms_output.put_line('The restaurant name is: ' ||  r_name);
dbms_output.put_line('Here are the list of orders for ' ||  p_date);
for orders_rec in restaurant_orders
loop
dbms_output.put_line('ORDER_ID: ' ||  orders_rec.order_id ||  ', ' ||  'MENU_ITEM_NAME: ' ||  orders_rec.menu_item_name);
end loop;
exception
when no_data_found then 
raise_application_error(-20001, 'There is no order for this restaurant on this date.');
end;
/
/*(Executes) List Order */
exec List_Orders('Rasika','07-JAN-2022');
/
/*------------------------------------------------------------------------------*/
/*[ #15 ] (Procedure) List Popular menu items*/
/* Sangita's #3 */
create or replace procedure Popular_Menu_Item
as
cursor popular_cursor is
select m.menu_item_name, c.cuisine_name, count(o.menu_item_id)
from menu_items m, cuisine_type c, orders o
where m.cuisine_type_id = c.cuisine_type_id
and m.menu_item_id = o.menu_item_id
group by m.menu_item_name, c.cuisine_name
order by cuisine_name asc;
orders_rec popular_cursor%rowtype;
begin
dbms_output.put_line('The most popular menu_items ordered by customers for each cuisine type are:');
for orders_rec in popular_cursor
loop
dbms_output.put_line('MENU_ITEM_NAME: ' || orders_rec.menu_item_name || '  CUISINE_TYPE: ' || orders_rec.cuisine_name);
end loop;
exception
when no_data_found then 
raise_application_error(-20001, 'The menu_item does not exist.');
end;
/
/*(Executes) List Popular Food */
exec Popular_Menu_Item;
/
/*------------------------------------------------------------------------------*/
/*[ #16 ] (Procedure) List top restaurants*/
/* Sangita's #4 */
create or replace procedure Top_Restaurants
as
cursor top_cursor is
select r.restaurant_name, r.state_id, sum(o.amount_paid)
from restaurants r, orders o
where r.restaurant_id = o.restaurant_id
group by r.restaurant_name, r.state_id
order by state_id asc;
orders_rec top_cursor%rowtype;
begin
dbms_output.put_line('The top 3 restaurants for each state are:');
for orders_rec in top_cursor
loop
dbms_output.put_line('RESTAURANT_NAME: ' || orders_rec.restaurant_name || '  STATE: ' || orders_rec.state_id);
end loop;
exception
when no_data_found then 
raise_application_error(-20001, 'The restaurant does not exist.');
end;
/
/*(Executes) List Top Restaurant */
exec Top_Restaurants;
/
/*------------------------------------------------------------------------------*/
/*[ #18 ] (Procedure) Customer At Specific Zip*/
/* Zoiya's #2 */
set serveroutput on; 
create or replace procedure customer_list (CustomerZip in VARCHAR2) IS
cursor customer_zip_cursor is 
select cust_id, cust_name from customer c
where c.cust_zipcode= CustomerZip;
customer_rec  customer_zip_cursor%rowtype; 
begin 
for customer_rec in  customer_zip_cursor 
loop 
dbms_output.put_line('Customer ID: ' || customer_rec.cust_id);
end loop;
exception when no_data_found then 
dbms_output.put_line('No data found');
end; 
/
/* Execution statement which is used to get the list of customers */
execute Customer_list(21044);
/
/*------------------------------------------------------------------------------*/
/*[ #19 ] (Procedure) Customer At Specific Zip*/
/* Zoiya's #3 */
/* Created by member 5.This function is used to generate the report of customers who paid the most. */ 
Create or replace procedure MostMoneySpent as
cursor MaxAmountPaid  is
select cust_name, sum(amount_paid) as amount_paid
    from customer c, orders o
    where c.cust_id = o.cust_id
    group by cust_name
    order by amount_paid desc;
    mostPaid MaxAmountPaid%rowtype; 
    temp number;
Begin
    temp := 0;
   dbms_output.put_line('List of customers who paid the most: ');
    for MostPaid in MaxAmountPaid 
    loop
    if temp < 3 then
    dbms_output.put_line('- '|| MostPaid.cust_name || ' paid ' || MostPaid.amount_paid);
    temp := temp + 1;
    end if;
    end loop;
    end;
/
/* Generate the report of customers who paid the Most. */ 
execute MostMoneySpent;
/
Create or replace procedure LeastMoneySpent as
cursor MinAmountPaid  is
select cust_name, sum(amount_paid) as amount_paid
    from customer c, orders o
    where c.cust_id = o.cust_id
    group by cust_name
    order by amount_paid ASC;
    LeastPaid MinAmountPaid%rowtype; 
    temp number;
Begin
    temp := 0;
   dbms_output.put_line('List of customers who paid the least: ');
    for LeastPaid in MinAmountPaid 
    loop
    if temp < 3 then
    dbms_output.put_line('- '||LeastPaid.cust_name || ' paid ' || LeastPaid.amount_paid);
    temp := temp + 1;
    end if;
    end loop;
 exception
	when no_data_found then 
	raise_application_error(-20001, 'Customer does not exist');
end;
/
/* Generate the report of customers who paid the Least. */ 
execute LeastMoneySpent;
/
/*------------------------------------------------------------------------------*/
/*[ #19 ] (Procedure) Tip By State*/
/* Zoiya's #4 */
Create or replace procedure TipsByState as
cursor GenerousTips  is
select cust_state, sum(tip) as SumTips
    from customer c, orders o
    where c.cust_id = o.cust_id
    group by cust_state
    order by SumTips DESC;
    C_Tips GenerousTips%rowtype; 
Begin
    dbms_output.put_line('State' ||'  '||'Tips');
    dbms_output.put_line('------------');
    for C_Tips in GenerousTips
    loop
    dbms_output.put_line(C_Tips.cust_state || '     ' ||C_Tips.SumTips);
    end loop;
    exception 
         when no_data_found then
         raise_application_error(-20001, 'No data exist');
    end;
/
 execute TipsByState;
/