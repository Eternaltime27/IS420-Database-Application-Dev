set serveroutput on;

Create or replace function Find_Invoice_ID (Param_Invoice_Name in Number) return
number
As
Stored_Invoices Invoice_line_items.Invoice_ID%type;
Begin
Select Count(Invoice_ID)
Into Stored_Invoices
From Invoice_line_items
Where Invoice_line_items.Invoice_ID = Param_Invoice_Name;
Return Stored_Invoices;
End;

select Find_Invoice_ID ('7') from dual;
select Find_Invoice_ID ('19') from dual;
select Find_Invoice_ID ('100') from dual;

Create or replace procedure CountTheV (Param_Invoice_Name in number)
is
INV_ID_INPUT number;
begin
INV_ID_INPUT := Find_Invoice_ID(Param_Invoice_Name);
dbms_output.put_line('The number of items for invoice_id : ' || Param_Invoice_Name || ' is ' || INV_ID_INPUT || ' items');
end;

execute CountTheV(7);
execute CountTheV(19);
execute CountTheV(100);

/*------------------------------------------------------------------------------*/

set serveroutput on;

Create or replace function invoiceCheck (Param_Invoice_Input in varchar) return
number
As
Stored_Invoices Invoices.Invoice_number%type;
Begin
Select Count(Invoice_Number)
Into Stored_Invoices
From Invoices
Where Invoices.Invoice_number = Param_Invoice_Input;
Return Stored_Invoices;
End;

select invoiceCheck ('QP58872') from dual;
select invoiceCheck ('ILN689') from dual;


Create or replace procedure InvoiceDetail (Param_Invoice_Name in varchar2)
is
INV_ID_INPUT varchar2(20);
storageid number;
storagetotal number;
storageduedate date;
begin 
INV_ID_INPUT := invoiceCheck(Param_Invoice_Name);
IF INV_ID_INPUT < 1 then
dbms_output.put_line('Invoice Not In The Database');
else
select invoice_id, invoice_total, invoice_due_date
into storageid, storagetotal, storageduedate
from invoices
where Invoice_Number = Param_Invoice_Name;
dbms_output.put_line('Invoice_ID: ' || storageid || ' |Invoice_Total: ' || storagetotal || ' |Invoice_Due_Date: ' || storageduedate);
end if;
end;

execute InvoiceDetail('QP58872');
execute InvoiceDetail('ILN689');
execute InvoiceDetail('P-0608');

/*------------------------------------------------------------------------------*/

declare 
    cursor vendor_cursor is
        select vendor_zip_code, vendor_name
        from vendors
        where vendor_state =: user_input;
    vendor_rec vendor_cursor%rowtype; 
    x int := 0;
begin
    open vendor_cursor;
    loop
        fetch vendor_cursor into vendor_rec; 
        exit when vendor_cursor%notfound;
        if x<1 then
        dbms_output.put_line('Vendor_Zip_Code      Region       Vendor Name');
        dbms_output.put_line('--------------------------------------');
        x := x + 1;
        end if;
        if vendor_rec.vendor_zip_code = 44074  then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     North' || '    Vendor Name: ' || Vendor_rec.vendor_name);
        end if;
        if vendor_rec.vendor_zip_code = 43305 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     South' || '    Vendor Name: ' || Vendor_rec.vendor_name);
        end if;
        if vendor_rec.vendor_zip_code = 43221 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     East' || '     Vendor Name: ' || Vendor_rec.vendor_name);
        end if;
        if vendor_rec.vendor_zip_code = 45225 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     East' || '     Vendor Name: ' || Vendor_rec.vendor_name); 
        end if;
        if vendor_rec.vendor_zip_code = 45264 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     West' || '     Vendor Name: ' || Vendor_rec.vendor_name); 
        end if;
        if vendor_rec.vendor_zip_code = 45002 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     West' || '     Vendor Name: ' || Vendor_rec.vendor_name); 
        end if;
        if vendor_rec.vendor_zip_code = 43260 then
        dbms_output.put_line( ' Vendor_Zip: ' || vendor_rec.vendor_zip_code || '     West' || '     Vendor Name: ' || Vendor_rec.vendor_name); 
        end if;
    end loop;
    close vendor_cursor;
end;

/*------------------------------------------------------------------------------*/

create or replace view average_month (Vendor_Name, Vendor_City, Vendor_State, Invoice_Count, Average_Months_Between) as (
Select Vendor_Name, Vendor_City, Vendor_State, Count(Invoice_id), Round(Avg(months_between(invoice_due_date, invoice_date)),1) as average_months_between
From Vendors
Inner Join Invoices ON Invoices.Vendor_ID = Vendors.Vendor_ID
group by Vendor_Name, Vendor_City, Vendor_State
Having Round(Avg(months_between(invoice_due_date, invoice_date)),1) > 1.5)
Order By average_months_between DESC;

select * from average_month;