set serveroutput on;

Create or replace function totalSalesInDay (Function_Invoice_Date_Input in date) return
Number
As
Stored_Invoice_Total Invoices.Invoice_Total%type;
Begin
Select Sum(Invoice_Total)
Into Stored_Invoice_Total
From Invoices
Where Invoices.Invoice_Date = Function_Invoice_Date_Input;
Return Stored_Invoice_Total;
End;

select totalSalesInDay ('04-JUN-14') from dual;
select totalSalesInDay ('18-MAY-14') from dual;

/*------------------------------------------------------------------------------*/

create or replace procedure profitableDay (Procedure_Invoice_Date_Input IN date)
is
  cursor Invoices_Cursor is
    select Invoice_ID, Invoice_Total, Payment_Total
    from Invoices
    where Invoices.invoice_date = Procedure_Invoice_Date_Input;
  Invoices_Rec Invoices_Cursor%rowtype;
  Total_Revenue number(20);
  x int := 0;
begin
  Total_Revenue := totalSalesInDay(Procedure_Invoice_Date_Input);
  if Total_Revenue > 500 then
  if x<1 then
  dbms_output.put_line(Procedure_Invoice_Date_Input || ': ' || Total_Revenue || ' Was Profitable For Business');
  dbms_output.put_line('==========================================================');
  x := x + 1;
  end if;
  for Invoices_Rec in Invoices_Cursor
  loop
  dbms_output.put_line('Invoice_ID: ' || Invoices_Rec.Invoice_ID || ' With Invoice_Total ' || Invoices_Rec.Invoice_Total || 
  ' Generates ' || (Round(Invoices_Rec.Payment_Total/Total_Revenue,4)) * 100 || '%');
  end loop;
  else
  dbms_output.put_line(Procedure_Invoice_Date_Input || ' Was Not Profitable For Business');
  end if;
  end;
execute profitableDay('04-JUN-14');
execute profitableDay('18-MAY-14');