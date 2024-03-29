INSERT INTO Invoices (Invoice_ID, Vendor_ID, Invoice_Number, Invoice_Date, Invoice_Total, Payment_Total,
Credit_Total, Terms_ID, Invoice_Due_Date, Payment_Date)
VALUES 
('115', '35' , 'AX-014-027', To_Date('2017-09-26', 'YYYY-MM-DD'), 850.58, 0.00, 0.00, '2', To_Date('2017-10-09', 'YYYY-MM-DD'), null);

Select Invoice_ID, Vendor_ID, Invoice_Number, Invoice_Date, Invoice_Total, Payment_Total,
Credit_Total, Terms_ID, Invoice_Due_Date, Payment_Date
From Invoices
Where Invoice_ID = 115;

/*------------------------------------------------------------------------------*/

Select Vendor_Name, (Vendor_Address1 || ', ' || Vendor_City || ', ' || Vendor_State || '. ' || Vendor_Zip_Code)
As Full_Address
From Vendors
WHERE ROWNUM < 16;

/*------------------------------------------------------------------------------*/

create or replace view Match_Vendor_Name as (
select vendors.vendor_id, vendors.vendor_contact_first_name, vendors.vendor_contact_last_name
from vendors, vendor_contacts
where vendor_contacts.Last_name = vendors.vendor_contact_last_name);

select * from Match_Vendor_Name;

/*------------------------------------------------------------------------------*/

create or replace view payed_vendors (Vendor_Name, Invoice_Counts, Invoice_Total_Sum, Payment_Total_Sum) as (
Select vendor_name, COUNT(vendors.vendor_id), Sum(Invoice_Total), Sum(Payment_Total)
From Vendors
Inner Join Invoices ON Invoices.Vendor_ID = Vendors.Vendor_ID
Group by vendors.vendor_name
HAVING COUNT(vendors.vendor_id) > 1);

select * from Payed_Vendors;

/*------------------------------------------------------------------------------*/

set serveroutput on;

declare
price number(3);
wallet number(3);
begin
price := 10;
wallet := 10;
if(price = wallet) then
	dbms_output.put_line('Match');
else
	dbms_output.put_line('Not Match');
end if;
end;