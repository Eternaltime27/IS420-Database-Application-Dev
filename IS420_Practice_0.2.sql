Insert Into Invoice_Archive (Invoice_Id, Vendor_Id, Invoice_Number, Invoice_Date, Invoice_Total, Payment_Total, Credit_Total, Terms_ID, Invoice_Due_Date, Payment_Date)
Select Invoice_Id, Vendor_Id, Invoice_Number, Invoice_Date, Invoice_Total, Payment_Total, Credit_Total, Terms_ID, Invoice_Due_Date, Payment_Date
From Invoices
Where Invoice_Date < '24/APR/14'
And Payment_Date is not null;

/*------------------------------------------------------------------------------*/

Update Active_Invoices
Set Invoice_Total = (invoice_total * 1.05 )
Where Active_Invoices.Invoice_ID In (Select Active_Invoices.Invoice_ID
                     From Active_Invoices
                     Left Join Invoice_Line_Items On Active_Invoices.Invoice_ID = Invoice_Line_Items.Invoice_ID
                     Where Line_Item_Description = 'Freight'
                     And Invoice_Total > 100
                     And Payment_Date is null);

/*------------------------------------------------------------------------------*/

create or replace view statistic_reading (Vendor_State, Total_Sum_Invoice, Average, Median_value, Mode_Value, Max_Value, Min_Value) as (
Select Vendor_State, Sum(invoice_total), ROUND(AVG(invoice_total) ,0), MEDIAN(Invoice_total), STATS_MODE(Invoice_total), MAX(Invoice_Total), MIN(Invoice_Total)
From Vendors
Inner Join Invoices ON Invoices.Vendor_ID = Vendors.Vendor_ID
Group by vendors.vendor_state);

select * from statistic_reading;

/*------------------------------------------------------------------------------*/

create or replace view average_month (Vendor_Name, Vendor_City, Vendor_State, Invoice_Count, Average_Months_Between) as (
Select Vendor_Name, Vendor_City, Vendor_State, count(invoice_id), Round(Avg(months_between(invoice_due_date, invoice_date)),1) as average_months_between
From Vendors
Inner Join Invoices ON Invoices.Vendor_ID = Vendors.Vendor_ID
group by Vendor_Name, Vendor_City, Vendor_State)
Order By average_months_between DESC;

select * from average_month;