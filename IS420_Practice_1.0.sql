commit;
rollback;

create or replace procedure paid_invoices_transfer as
cursor paid is select * 
from Paid_Invoices
where invoice_total =credit_total+payment_total 
and payment_date is not null
and invoice_date <= '31-MAY-2014';
paid_invoice_row paid%rowtype;
begin
for paid_invoice_row in paid
loop 
dbms_output.put_line(paid_invoice_row.invoice_id);
insert into invoice_archive values paid_invoice_row;
Delete from paid_invoices
where invoice_total =credit_total+payment_total 
and payment_date is not null
and invoice_date <= '31-MAY-2014';
end loop;
end;

execute paid_invoices_transfer;

Select count(*) from invoice_archive;
Select * from invoice_archive where rownum<15;

/*------------------------------------------------------------------------------*/

commit;
rollback;

set serveroutput on;

CREATE OR REPLACE TRIGGER invoice_update
BEFORE Update
ON Invoices
FOR EACH ROW
BEGIN
dbms_output.put_line('Vendor ID: '||:old.Vendor_ID);
dbms_output.put_line('Old Invoice Total: '||:old.Invoice_Total);
dbms_output.put_line('New Invoice Total: '||:new.Invoice_Total);
END;

Update invoices set invoice_total = 700 where invoice_id= 6;
Update invoices set invoice_total = 3211 where invoice_id = 18;
