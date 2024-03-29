set serveroutput on;
create or replace procedure vendorInfo
	(Vendor_Value IN number)
is
  cursor Vendor_Cursor is
    select Vendor_Name, Vendor_City, Invoice_ID, Invoice_Total, Payment_Total
    from Vendors
    Inner Join Invoices ON Invoices.Vendor_ID = Vendors.Vendor_ID
    where vendors.vendor_id = Vendor_Value;
  Vendor_Rec Vendor_Cursor%rowtype;
  x int := 0;
begin
  for Vendor_Rec in Vendor_Cursor
  loop
  if x<1 then
  dbms_output.put_line('Vendor_Name: '  || vendor_rec.vendor_name || ', Vendor_City:' || vendor_rec.vendor_city);
  x := x + 1;
   if vendor_rec.payment_total > 0
  then
  dbms_output.put_line('Invoice_ID is ' || 
  vendor_rec.invoice_id ||'. Invoice_Total is ' || vendor_rec.Invoice_Total || '. This Invoice is Paid');
  else
  dbms_output.put_line('Invoice_ID is ' || 
  vendor_rec.invoice_id ||'. Invoice_Total is ' || vendor_rec.Invoice_Total || '. This Invoice is Not Paid');
  end if;
  else
  if vendor_rec.payment_total > 0
  then
  dbms_output.put_line('Invoice_ID is ' || 
  vendor_rec.invoice_id ||'. Invoice_Total is ' || vendor_rec.Invoice_Total || '. This Invoice is Paid');
  else
  dbms_output.put_line('Invoice_ID is ' || 
  vendor_rec.invoice_id ||'. Invoice_Total is ' || vendor_rec.Invoice_Total || '. This Invoice is Not Paid');
  end if;
  end if;
  end loop;
end;

execute vendorInfo(95);
execute vendorInfo(105);
execute vendorInfo(110);

/*------------------------------------------------------------------------------*/

create or replace function invoiceRiskCheck
(vendor_principle In number) return number
is
vid invoices.vendor_id%type;
begin
select vendor_id
into vid
from invoices
where vendor_principle = invoice_total;
return vid;
end;

select invoiceRiskCheck ('5') from dual;

create or replace procedure VendorDetails
(vendor_principle in number) is
 vid invoices.vendor_id%type;
 risk_exist number(6);
begin
 select count(*) into risk_exist 
 from invoices 
 where invoice_total = vendor_principle;
 if risk_exist > 0 then 
  vid := invoiceRiskCheck(vendor_principle);
  dbms_output.put_line('This vendor is a high risk payment');
 else
  dbms_output.put_line('This vendor is not a high risk payment');
 end if;
end;

execute VendorDetails(105);










