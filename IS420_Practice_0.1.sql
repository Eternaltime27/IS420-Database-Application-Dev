CREATE TABLE Students (
FirstName varchar(30),
LastName varchar(30),
StudentNum varchar(50),
PhoneNumber varchar(15),
PRIMARY KEY(StudentNum)
);

INSERT INTO Students (StudentNum, FirstName, LastName, PhoneNumber)
VALUES 
('UMBC01', 'Andy' , 'Argusta', '301-111-2222');
INSERT INTO Students (StudentNum, FirstName, LastName, PhoneNumber)
VALUES 
('UMBC02', 'Baron' , 'Davis', '301-333-4444');
INSERT INTO Students (StudentNum, FirstName, LastName, PhoneNumber)
VALUES 
('UMBC03', 'Catherine' , 'Teresa', '301-555-6666');
INSERT INTO Students (StudentNum, FirstName, LastName, PhoneNumber)
VALUES 
('UMBC04', 'David' , 'Omens', '301-777-8899');

/*------------------------------------------------------------------------------*/

CREATE TABLE Schedule (
SemesterID varchar(50),
StudentNum varchar(50),
CourseID varchar(50),
PRIMARY KEY(SemesterID),
FOREIGN KEY(StudentNum) REFERENCES Students(StudentNum),
FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Schedule (SemesterID, StudentNum, CourseID)
VALUES 
('2022FQ1', 'UMBC01' , 'Geo305');
INSERT INTO Schedule (SemesterID, StudentNum, CourseID)
VALUES 
('2022FQ2', 'UMBC02' , 'Sci101');
INSERT INTO Schedule (SemesterID, StudentNum, CourseID)
VALUES 
('2022FQ3', 'UMBC03' , 'Math151');
INSERT INTO Schedule (SemesterID, StudentNum, CourseID)
VALUES 
('2022FQ4', 'UMBC04' , 'Eng393');

/*------------------------------------------------------------------------------*/

CREATE TABLE Courses (
CourseID varchar(50),
Location varchar(50),
Professor varchar(50),
PRIMARY KEY(CourseID)
);

INSERT INTO Courses (CourseID, Location, Professor)
VALUES 
('Geo305', 'D30' , 'Charles Xavier');
INSERT INTO Courses (CourseID, Location, Professor)
VALUES 
('Sci101', 'E56' , 'Peter Parker');
INSERT INTO Courses (CourseID, Location, Professor)
VALUES 
('Math151', 'F67' , 'Steven Strange');
INSERT INTO Courses (CourseID, Location, Professor)
VALUES 
('Eng393', 'A03' , 'SCarlet Johanson');

/*------------------------------------------------------------------------------*/

Select Vendor_ID
From Invoices
Where Vendor_ID = 122;

/*------------------------------------------------------------------------------*/

Select invoice_total
From Invoices
Where invoice_total > 10000;

/*------------------------------------------------------------------------------*/

Select vendor_id, vendor_name, vendor_phone
From Vendors
Where Vendor_City = 'Fresno'
And Vendor_State = 'CA'
And Vendor_Zip_Code = 93711;

