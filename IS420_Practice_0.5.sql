select Vendor_State, Count(Vendor_State)
from Vendors
group by Vendor_State
Having Count(Vendor_State)>5;

/*------------------------------------------------------------------------------*/

select Vendor_Name, Count(Invoices.Vendor_ID)
from Vendors, Invoices
where Vendors.Vendor_ID = Invoices.Vendor_ID
group by Vendor_Name
Having Count(Invoices.Vendor_ID)>2;

/*------------------------------------------------------------------------------*/

Update Vendors
Set Default_Terms_ID = 5
Where Vendor_ID In ( Select Vendors.Vendor_ID
                     From Vendors
                     Full Outer Join Active_Invoices on Vendors.Vendor_ID = Active_Invoices.Vendor_ID 
                     Where Credit_Total>0
                     And Invoice_Total<25000);

Select Vendor_ID, Default_Terms_ID
From Vendors