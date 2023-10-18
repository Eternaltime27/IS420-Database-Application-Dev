set serveroutput on;

declare
    sumOfNum integer;
    num integer;
begin
    sumOfNum := 0;
    num :=2;
    WHILE num <= 200 loop 
    sumOfNum := sumOfNum + num;
    num := num + 2;
end loop;
    dbms_output.put_line('Sum of even numbers from 1 to 200: ' || sumOfNum);
end;

/*------------------------------------------------------------------------------*/

set serveroutput on;

declare 
    cursor vendor_cursor is
        select vendor_name, vendor_state
        from vendors
        where vendor_id = 93;
    vendor_rec vendor_cursor%rowtype; 
begin
    open vendor_cursor;
    loop
        fetch vendor_cursor into vendor_rec; 
        exit when vendor_cursor%notfound;
        dbms_output.put_line('Vendor_Name: ' || vendor_rec.vendor_name);
        dbms_output.put_line('Vendor_State: ' || vendor_rec.vendor_state);
        
    end loop;
    close vendor_cursor;
end;

/*------------------------------------------------------------------------------*/

set serveroutput on;

select vendor_id, vendor_zip_code, 
case  
 when vendor_zip_code = 44074 then 'North'
 when vendor_zip_code = 43305 then 'South'
 when vendor_zip_code = 43221 then 'East'
 when vendor_zip_code =  45225 then 'East'
 else 'West'
end as region
 from vendors
 where vendor_state = 'OH';

