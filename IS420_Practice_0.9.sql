declare 
    cursor vendor_cursor is
        select vendor_name, vendor_state, vendor_id
        from vendors
        where vendor_state =: user_input;
    vendor_rec vendor_cursor%rowtype; 
begin
    open vendor_cursor;
    loop
        fetch vendor_cursor into vendor_rec; 
        exit when vendor_cursor%notfound;
        dbms_output.put_line('Vendor_State: ' || vendor_rec.vendor_state || ' Vendor_ID: ' || vendor_rec.vendor_id ||' Vendor_Name: ' || vendor_rec.vendor_name);    
    end loop;
    close vendor_cursor;
end;

/*------------------------------------------------------------------------------*/

declare
 high_invoice_due exception;
 avginvtotal number(6);
begin
 select avg(invoice_total) into avginvtotal 
 from invoices where vendor_id = :v_id;
 if avginvtotal >= 1900 then 
  raise high_invoice_due;
 else dbms_output.put_line(avginvtotal);
 end if;
exception
 when high_invoice_due then
 dbms_output.put_line('high invoice due');
end;

/*------------------------------------------------------------------------------*/

declare
 EID Employees.Employee_ID%type;
begin
 select Employees.Employee_ID
 into EID 
 from Employees where Employees.Employee_ID =: User_Input_Employee_ID;
 if EID < 10 then
 delete Employees
 Where EID = Employees.Employee_ID;
 dbms_output.put_line(EID || ' Was Successfully Removed');
 end if;
exception
 when no_data_found then
 dbms_output.put_line('Does Not Exist; No vendor was found');
end;