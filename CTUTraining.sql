
------------------------------------------------------------Create Database-------------------------------------------------------------


Create Database CTU 



---Create Scheamas

------------------------------------------------------------AucklandPark-------------------------------------------------------------


USE CTU
Create Schema [AucklandPark]




												----------Create tables----------
--StudentInfo Table

Create Table [AucklandPark].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [AucklandPark].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [AucklandPark].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [AucklandPark].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [AucklandPark].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [AucklandPark].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [AucklandPark].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [AucklandPark].[StudentInfo]
Add CourseID int  Not null


Alter table [AucklandPark].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [AucklandPark].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [AucklandPark].[StudentInfo]
Add ModuleID int  Not null


Alter table [AucklandPark].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [AucklandPark].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [AucklandPark].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [AucklandPark].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [AucklandPark].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [AucklandPark].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [AucklandPark].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [AucklandPark].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [AucklandPark].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [AucklandPark].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [AucklandPark].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [AucklandPark].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [AucklandPark].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [AucklandPark].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [AucklandPark].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [AucklandPark].[ModuleInfo]
Add CourseID int  Not null

Alter table [AucklandPark].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [AucklandPark].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [AucklandPark].[ClassMarks]
Add CourseID int  Not null


Alter table [AucklandPark].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [AucklandPark].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [AucklandPark].[ClassMarks]
Add ModuleID int Not null


Alter table [AucklandPark].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [AucklandPark].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [AucklandPark].[ClassMarks]
Add MarkRangeID int Not null


Alter table [AucklandPark].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [AucklandPark].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [AucklandPark].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [AucklandPark].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [AucklandPark].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [AucklandPark].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [AucklandPark].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [AucklandPark].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [AucklandPark].StudentInfo
Join [AucklandPark].CourseInfo On [AucklandPark].StudentInfo.CourseID = [AucklandPark].CourseInfo.CourseID
Join [AucklandPark].ModuleInfo on [AucklandPark].StudentInfo.ModuleID = [AucklandPark].ModuleInfo.ModuleID
Join [AucklandPark].ClassMarks on [AucklandPark].StudentInfo.ClassMarksID = [AucklandPark].ClassMarks.ClassMarksID
Join [AucklandPark].MarkRange on [AucklandPark].StudentInfo.MarkRangeID = [AucklandPark].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [AucklandPark].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [AucklandPark].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [AucklandPark].Report @CourseName = 'MCSD'









------------------------------------------------------------Bloemfontein-------------------------------------------------------------


USE CTU
Create Schema [Bloemfontein]



												----------Create tables----------
--StudentInfo Table

Create Table [Bloemfontein].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Bloemfontein].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Bloemfontein].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Bloemfontein].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table Bloemfontein.MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Bloemfontein].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Bloemfontein].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Bloemfontein].[StudentInfo]
Add CourseID int  Not null


Alter table [Bloemfontein].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Bloemfontein].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Bloemfontein].[StudentInfo]
Add ModuleID int  Not null


Alter table [Bloemfontein].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Bloemfontein].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Bloemfontein].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Bloemfontein].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Bloemfontein].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Bloemfontein].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Bloemfontein].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Bloemfontein].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Bloemfontein].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Bloemfontein].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Bloemfontein].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Bloemfontein].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Bloemfontein].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Bloemfontein].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Bloemfontein].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Bloemfontein].[ModuleInfo]
Add CourseID int  Not null

Alter table [Bloemfontein].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Bloemfontein].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Bloemfontein].[ClassMarks]
Add CourseID int  Not null


Alter table [Bloemfontein].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Bloemfontein].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Bloemfontein].[ClassMarks]
Add ModuleID int Not null


Alter table [Bloemfontein].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Bloemfontein].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Bloemfontein].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Bloemfontein].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Bloemfontein].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into Bloemfontein.CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSA' , '12 Months', 120),
('MCSE', '12 Months', 150)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into Bloemfontein.ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Hardware Analysis' , 'Analysing Hardware ', 'Understanding your computer', '2 weeks', 1),
('Server Infrastructure', 'Servers', 'Server Analysis ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into Bloemfontein.MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into Bloemfontein.ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into Bloemfontein.StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Amantle' , 'Mashele', 1, 1,7, 7),
('Dee', 'Moore' , 2, 2,13,6)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view Bloemfontein.ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from Bloemfontein.StudentInfo
Join Bloemfontein.CourseInfo On Bloemfontein.StudentInfo.CourseID = Bloemfontein.CourseInfo.CourseID
Join Bloemfontein.ModuleInfo on Bloemfontein.StudentInfo.ModuleID = Bloemfontein.ModuleInfo.ModuleID
Join Bloemfontein.ClassMarks on Bloemfontein.StudentInfo.ClassMarksID = Bloemfontein.ClassMarks.ClassMarksID
Join Bloemfontein.MarkRange on Bloemfontein.StudentInfo.MarkRangeID = Bloemfontein.MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE Bloemfontein.Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from Bloemfontein.CourseInfo
	Where CourseName  = @CourseName
END
GO




exec  Bloemfontein.Report @CourseName = 'MCSE'




------------------------------------------------------------Boksburg------------------------------------------------------------



USE CTU
Create Schema [Boksburg]




												----------Create tables----------
--StudentInfo Table

Create Table [Boksburg].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Boksburg].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Boksburg].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Boksburg].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Boksburg].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Boksburg].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Boksburg].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Boksburg].[StudentInfo]
Add CourseID int  Not null


Alter table [Boksburg].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Boksburg].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Boksburg].[StudentInfo]
Add ModuleID int  Not null


Alter table [Boksburg].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Boksburg].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Boksburg].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Boksburg].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Boksburg].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Boksburg].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Boksburg].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Boksburg].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Boksburg].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Boksburg].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Boksburg].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Boksburg].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Boksburg].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Boksburg].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Boksburg].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Boksburg].[ModuleInfo]
Add CourseID int  Not null

Alter table [Boksburg].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Boksburg].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Boksburg].[ClassMarks]
Add CourseID int  Not null


Alter table [Boksburg].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Boksburg].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Boksburg].[ClassMarks]
Add ModuleID int Not null


Alter table [Boksburg].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Boksburg].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Boksburg].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Boksburg].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Boksburg].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Boksburg].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('Project Management 1' , '12 Months', 140),
('Project Management 2', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Boksburg].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Business Communication' , 'Business Plan ', 'Terminology', '2 weeks', 1),
('Anaylsing Markets', 'Target Markets', 'Test One',  '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Boksburg].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Boksburg].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Boksburg].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Joao' , 'Miles', 1, 1,7, 7),
('Danie', 'Moes' , 2, 2,14,7)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Boksburg].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Boksburg].StudentInfo
Join [Boksburg].CourseInfo On [Boksburg].StudentInfo.CourseID = [Boksburg].CourseInfo.CourseID
Join [Boksburg].ModuleInfo on [Boksburg].StudentInfo.ModuleID = [Boksburg].ModuleInfo.ModuleID
Join [Boksburg].ClassMarks on [Boksburg].StudentInfo.ClassMarksID = [Boksburg].ClassMarks.ClassMarksID
Join [Boksburg].MarkRange on [Boksburg].StudentInfo.MarkRangeID = [Boksburg].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Boksburg].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Boksburg].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Boksburg].Report @CourseName = 'Project Management 2'



------------------------------------------------------------CapeTown-------------------------------------------------------------

USE CTU

Create Schema [CapeTown]



												----------Create tables----------
--StudentInfo Table

Create Table [CapeTown].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [CapeTown].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [CapeTown].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [CapeTown].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [CapeTown].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [CapeTown].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [CapeTown].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [CapeTown].[StudentInfo]
Add CourseID int  Not null


Alter table [CapeTown].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [CapeTown].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [CapeTown].[StudentInfo]
Add ModuleID int  Not null


Alter table [CapeTown].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [CapeTown].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [CapeTown].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [CapeTown].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [CapeTown].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [CapeTown].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [CapeTown].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [CapeTown].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [CapeTown].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [CapeTown].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [CapeTown].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [CapeTown].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [CapeTown].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [CapeTown].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [CapeTown].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [CapeTown].[ModuleInfo]
Add CourseID int  Not null

Alter table [CapeTown].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [CapeTown].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [CapeTown].[ClassMarks]
Add CourseID int  Not null


Alter table [CapeTown].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [CapeTown].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [CapeTown].[ClassMarks]
Add ModuleID int Not null


Alter table [CapeTown].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [CapeTown].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [CapeTown].[ClassMarks]
Add MarkRangeID int Not null


Alter table [CapeTown].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [CapeTown].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [CapeTown].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('Graphics Design 1' , '12 Months', 140),
('Graphics Design 2', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [CapeTown].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Modelling' , '3D Modelling', '3D Modelling', '2 weeks', 1),
('Drafting', 'Drafting ', 'Drafting sketches' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [CapeTown].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [CapeTown].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [CapeTown].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Elaine' , 'Toyo', 1, 1,6, 6),
('Winny', 'Koeu' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [CapeTown].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [CapeTown].StudentInfo
Join [CapeTown].CourseInfo On [CapeTown].StudentInfo.CourseID = [CapeTown].CourseInfo.CourseID
Join [CapeTown].ModuleInfo on [CapeTown].StudentInfo.ModuleID = [CapeTown].ModuleInfo.ModuleID
Join [CapeTown].ClassMarks on [CapeTown].StudentInfo.ClassMarksID = [CapeTown].ClassMarks.ClassMarksID
Join [CapeTown].MarkRange on [CapeTown].StudentInfo.MarkRangeID = [CapeTown].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [CapeTown].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [CapeTown].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [CapeTown].Report @CourseName = 'Graphics Design 1'



------------------------------------------------------------Nelspruit-------------------------------------------------------------


USE CTU 
Create Schema [Nelspruit]


												----------Create tables----------
--StudentInfo Table

Create Table [Nelspruit].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Nelspruit].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Nelspruit].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Nelspruit].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Nelspruit].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Nelspruit].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Nelspruit].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Nelspruit].[StudentInfo]
Add CourseID int  Not null


Alter table [Nelspruit].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Nelspruit].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Nelspruit].[StudentInfo]
Add ModuleID int  Not null


Alter table [Nelspruit].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Nelspruit].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Nelspruit].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Nelspruit].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [AucklandPark].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Nelspruit].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Nelspruit].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Nelspruit].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Nelspruit].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Nelspruit].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Nelspruit].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Nelspruit].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Nelspruit].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Nelspruit].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Nelspruit].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Nelspruit].[ModuleInfo]
Add CourseID int  Not null

Alter table [Nelspruit].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Nelspruit].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Nelspruit].[ClassMarks]
Add CourseID int  Not null



Alter table [Nelspruit].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Nelspruit].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Nelspruit].[ClassMarks]
Add ModuleID int Not null



Alter table [Nelspruit].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Nelspruit].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table


Alter table [Nelspruit].[ClassMarks]
Add MarkRangeID int Not null



Alter table [Nelspruit].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Nelspruit].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Nelspruit].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Nelspruit].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Nelspruit].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Nelspruit].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Nelspruit].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Nelspruit].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Nelspruit].StudentInfo
Join [Nelspruit].CourseInfo On [Nelspruit].StudentInfo.CourseID = [Nelspruit].CourseInfo.CourseID
Join [Nelspruit].ModuleInfo on [Nelspruit].StudentInfo.ModuleID = [Nelspruit].ModuleInfo.ModuleID
Join [Nelspruit].ClassMarks on [Nelspruit].StudentInfo.ClassMarksID = [Nelspruit].ClassMarks.ClassMarksID
Join [Nelspruit].MarkRange on[Nelspruit].StudentInfo.MarkRangeID = [Nelspruit].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Nelspruit].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Nelspruit].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Nelspruit].Report @CourseName = 'MCSD'





------------------------------------------------------------Polokwane-------------------------------------------------------------


USE CTU
Create Schema [Polokwane]



												----------Create tables----------
--StudentInfo Table

Create Table [Polokwane].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Polokwane].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Polokwane].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Polokwane].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Polokwane].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Polokwane].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Polokwane].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Polokwane].[StudentInfo]
Add CourseID int  Not null


Alter table [Polokwane].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Polokwane].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Polokwane].[StudentInfo]
Add ModuleID int  Not null


Alter table [Polokwane].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Polokwane].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Polokwane].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Polokwane].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Polokwane].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Polokwane].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Polokwane].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Polokwane].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Polokwane].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Polokwane].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Polokwane].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Polokwane].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Polokwane].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Polokwane].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Polokwane].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Polokwane].[ModuleInfo]
Add CourseID int  Not null

Alter table [Polokwane].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Polokwane].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Polokwane].[ClassMarks]
Add CourseID int  Not null


Alter table [Polokwane].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Polokwane].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Polokwane].[ClassMarks]
Add ModuleID int Not null


Alter table [Polokwane].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Polokwane].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Polokwane].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Polokwane].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Polokwane].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Polokwane].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Polokwane].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Polokwane].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Polokwane].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Polokwane].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Polokwane].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Polokwane].StudentInfo
Join [Polokwane].CourseInfo On [Polokwane].StudentInfo.CourseID = [Polokwane].CourseInfo.CourseID
Join [Polokwane].ModuleInfo on [Polokwane].StudentInfo.ModuleID = [Polokwane].ModuleInfo.ModuleID
Join [Polokwane].ClassMarks on [Polokwane].StudentInfo.ClassMarksID = [Polokwane].ClassMarks.ClassMarksID
Join [Polokwane].MarkRange on [Polokwane].StudentInfo.MarkRangeID = [Polokwane].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Polokwane].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Polokwane].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Polokwane].Report @CourseName = 'MCSD'




------------------------------------------------------------Potchefstroom-------------------------------------------------------------


USE CTU
Create Schema [Potchefstroom]



												----------Create tables----------
--StudentInfo Table

Create Table [Potchefstroom].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Potchefstroom].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Potchefstroom].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Potchefstroom].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Potchefstroom].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Potchefstroom].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Potchefstroom].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Potchefstroom].[StudentInfo]
Add CourseID int  Not null


Alter table [Potchefstroom].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Potchefstroom].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Potchefstroom].[StudentInfo]
Add ModuleID int  Not null


Alter table [Potchefstroom].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Potchefstroom].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Potchefstroom].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Potchefstroom].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Potchefstroom].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Potchefstroom].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Potchefstroom].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Potchefstroom].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Potchefstroom].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Potchefstroom].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Potchefstroom].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Potchefstroom].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Potchefstroom].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Potchefstroom].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Potchefstroom].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Potchefstroom].[ModuleInfo]
Add CourseID int  Not null

Alter table [Potchefstroom].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Potchefstroom].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Potchefstroom].[ClassMarks]
Add CourseID int  Not null


Alter table [Potchefstroom].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Potchefstroom].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Potchefstroom].[ClassMarks]
Add ModuleID int Not null


Alter table [Potchefstroom].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Potchefstroom].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Potchefstroom].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Potchefstroom].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Potchefstroom].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Potchefstroom].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Potchefstroom].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Potchefstroom].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Potchefstroom].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Potchefstroom].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Potchefstroom].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Potchefstroom].StudentInfo
Join [Potchefstroom].CourseInfo On [Potchefstroom].StudentInfo.CourseID = [Potchefstroom].CourseInfo.CourseID
Join [Potchefstroom].ModuleInfo on [Potchefstroom].StudentInfo.ModuleID = [Potchefstroom].ModuleInfo.ModuleID
Join [Potchefstroom].ClassMarks on [Potchefstroom].StudentInfo.ClassMarksID = [Potchefstroom].ClassMarks.ClassMarksID
Join [Potchefstroom].MarkRange on [Potchefstroom].StudentInfo.MarkRangeID = [Potchefstroom].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Potchefstroom].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Potchefstroom].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Potchefstroom].Report @CourseName = 'MCSD'






------------------------------------------------------------PortElizabeth-------------------------------------------------------------


USE CTU
Create Schema [PortElizabeth]



												----------Create tables----------
--StudentInfo Table

Create Table [PortElizabeth].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [PortElizabeth].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [PortElizabeth].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [PortElizabeth].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [PortElizabeth].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [PortElizabeth].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [PortElizabeth].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [PortElizabeth].[StudentInfo]
Add CourseID int  Not null


Alter table [PortElizabeth].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [PortElizabeth].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [PortElizabeth].[StudentInfo]
Add ModuleID int  Not null


Alter table [PortElizabeth].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [PortElizabeth].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [PortElizabeth].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [PortElizabeth].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [PortElizabeth].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [PortElizabeth].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [PortElizabeth].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [PortElizabeth].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [PortElizabeth].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [PortElizabeth].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [PortElizabeth].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [PortElizabeth].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [PortElizabeth].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [PortElizabeth].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [PortElizabeth].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [PortElizabeth].[ModuleInfo]
Add CourseID int  Not null

Alter table [PortElizabeth].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [PortElizabeth].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [PortElizabeth].[ClassMarks]
Add CourseID int  Not null


Alter table [PortElizabeth].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [PortElizabeth].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [PortElizabeth].[ClassMarks]
Add ModuleID int Not null


Alter table [PortElizabeth].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [PortElizabeth].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [PortElizabeth].[ClassMarks]
Add MarkRangeID int Not null


Alter table [PortElizabeth].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [PortElizabeth].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [PortElizabeth].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [PortElizabeth].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [PortElizabeth].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [PortElizabeth].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [PortElizabeth].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [PortElizabeth].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [PortElizabeth].StudentInfo
Join [PortElizabeth].CourseInfo On [PortElizabeth].StudentInfo.CourseID = [PortElizabeth].CourseInfo.CourseID
Join [PortElizabeth].ModuleInfo on [PortElizabeth].StudentInfo.ModuleID = [PortElizabeth].ModuleInfo.ModuleID
Join [PortElizabeth].ClassMarks on [PortElizabeth].StudentInfo.ClassMarksID = [PortElizabeth].ClassMarks.ClassMarksID
Join [PortElizabeth].MarkRange on [PortElizabeth].StudentInfo.MarkRangeID = [PortElizabeth].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [PortElizabeth].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [PortElizabeth].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [PortElizabeth].Report @CourseName = 'MCSD'





------------------------------------------------------------Pretoria-------------------------------------------------------------


USE CTU
Create Schema [Pretoria]




												----------Create tables----------
--StudentInfo Table

Create Table [Pretoria].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Pretoria].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Pretoria].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Pretoria].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Pretoria].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Pretoria].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Pretoria].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Pretoria].[StudentInfo]
Add CourseID int  Not null


Alter table [Pretoria].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Pretoria].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Pretoria].[StudentInfo]
Add ModuleID int  Not null


Alter table [Pretoria].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Pretoria].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Pretoria].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Pretoria].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Pretoria].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Pretoria].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Pretoria].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Pretoria].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Pretoria].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Pretoria].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Pretoria].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Pretoria].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Pretoria].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Pretoria].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Pretoria].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Pretoria].[ModuleInfo]
Add CourseID int  Not null

Alter table [Pretoria].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Pretoria].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Pretoria].[ClassMarks]
Add CourseID int  Not null


Alter table [Pretoria].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Pretoria].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Pretoria].[ClassMarks]
Add ModuleID int Not null


Alter table [Pretoria].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Pretoria].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Pretoria].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Pretoria].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Pretoria].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Pretoria].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Pretoria].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Pretoria].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Pretoria].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Pretoria].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Pretoria].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Pretoria].StudentInfo
Join [Pretoria].CourseInfo On [Pretoria].StudentInfo.CourseID = [Pretoria].CourseInfo.CourseID
Join [Pretoria].ModuleInfo on [Pretoria].StudentInfo.ModuleID = [Pretoria].ModuleInfo.ModuleID
Join [Pretoria].ClassMarks on [Pretoria].StudentInfo.ClassMarksID = [Pretoria].ClassMarks.ClassMarksID
Join [Pretoria].MarkRange on [Pretoria].StudentInfo.MarkRangeID = [Pretoria].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Pretoria].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Pretoria].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Pretoria].Report @CourseName = 'MCSD'








------------------------------------------------------------Randburg-------------------------------------------------------------


USE CTU
Create Schema [Randburg]




												----------Create tables----------
--StudentInfo Table

Create Table [Randburg].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Randburg].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Randburg].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Randburg].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Randburg].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Randburg].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Randburg].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Randburg].[StudentInfo]
Add CourseID int  Not null


Alter table [Randburg].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Randburg].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Randburg].[StudentInfo]
Add ModuleID int  Not null


Alter table [Randburg].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Randburg].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Randburg].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Randburg].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Randburg].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Randburg].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Randburg].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Randburg].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Randburg].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Randburg].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Randburg].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table


Alter table [Randburg].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Randburg].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Randburg].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Randburg].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Randburg].[ModuleInfo]
Add CourseID int  Not null

Alter table [Randburg].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Randburg].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Randburg].[ClassMarks]
Add CourseID int  Not null


Alter table [Randburg].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Randburg].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Randburg].[ClassMarks]
Add ModuleID int Not null


Alter table [Randburg].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Randburg].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Randburg].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Randburg].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Randburg].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Randburg].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Randburg].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Randburg].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Randburg].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Randburg].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Randburg].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Randburg].StudentInfo
Join [Randburg].CourseInfo On [Randburg].StudentInfo.CourseID = [Randburg].CourseInfo.CourseID
Join [Randburg].ModuleInfo on [Randburg].StudentInfo.ModuleID = [Randburg].ModuleInfo.ModuleID
Join [Randburg].ClassMarks on [Randburg].StudentInfo.ClassMarksID = [Randburg].ClassMarks.ClassMarksID
Join [Randburg].MarkRange on [Randburg].StudentInfo.MarkRangeID = [Randburg].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Randburg].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Pretoria].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Randburg].Report @CourseName = 'MCSD'



------------------------------------------------------------Roodepoort-------------------------------------------------------------


USE CTU
Create Schema [Roodepoort]




												----------Create tables----------
--StudentInfo Table

Create Table [Roodepoort].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Roodepoort].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Roodepoort].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Roodepoort].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Roodepoort].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Roodepoort].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Roodepoort].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Roodepoort].[StudentInfo]
Add CourseID int  Not null


Alter table [Roodepoort].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Roodepoort].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Roodepoort].[StudentInfo]
Add ModuleID int  Not null


Alter table [Roodepoort].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Roodepoort].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Roodepoort].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Roodepoort].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Roodepoort].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Roodepoort].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Roodepoort].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Roodepoort].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Roodepoort].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Roodepoort].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Roodepoort].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table

Alter table [Roodepoort].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Roodepoort].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Roodepoort].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Roodepoort].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Roodepoort].[ModuleInfo]
Add CourseID int  Not null

Alter table [Roodepoort].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Roodepoort].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Roodepoort].[ClassMarks]
Add CourseID int  Not null


Alter table [Roodepoort].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Roodepoort].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Roodepoort].[ClassMarks]
Add ModuleID int Not null


Alter table [Roodepoort].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Roodepoort].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Roodepoort].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Roodepoort].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Roodepoort].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Roodepoort].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Roodepoort].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Roodepoort].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Roodepoort].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Roodepoort].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Roodepoort].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Roodepoort].StudentInfo
Join [Roodepoort].CourseInfo On [Roodepoort].StudentInfo.CourseID = [Roodepoort].CourseInfo.CourseID
Join [Roodepoort].ModuleInfo on [Roodepoort].StudentInfo.ModuleID = [Roodepoort].ModuleInfo.ModuleID
Join [Roodepoort].ClassMarks on [Roodepoort].StudentInfo.ClassMarksID = [Roodepoort].ClassMarks.ClassMarksID
Join [Roodepoort].MarkRange on [Roodepoort].StudentInfo.MarkRangeID = [Roodepoort].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Roodepoort].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Roodepoort].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Roodepoort].Report @CourseName = 'MCSD'






------------------------------------------------------------Stellenbosch-------------------------------------------------------------


USE CTU
Create Schema [Stellenbosch]




												----------Create tables----------
--StudentInfo Table

Create Table [Stellenbosch].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Stellenbosch].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Stellenbosch].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Stellenbosch].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Stellenbosch].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Stellenbosch].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Stellenbosch].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Stellenbosch].[StudentInfo]
Add CourseID int  Not null


Alter table [Stellenbosch].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Stellenbosch].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Stellenbosch].[StudentInfo]
Add ModuleID int  Not null


Alter table [Stellenbosch].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Stellenbosch].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Stellenbosch].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Stellenbosch].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Stellenbosch].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Stellenbosch].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Stellenbosch].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Stellenbosch].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Stellenbosch].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Stellenbosch].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Stellenbosch].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table

Alter table [Stellenbosch].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Stellenbosch].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Stellenbosch].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Stellenbosch].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Stellenbosch].[ModuleInfo]
Add CourseID int  Not null

Alter table [Stellenbosch].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Stellenbosch].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Stellenbosch].[ClassMarks]
Add CourseID int  Not null


Alter table [Stellenbosch].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Stellenbosch].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Stellenbosch].[ClassMarks]
Add ModuleID int Not null


Alter table [Stellenbosch].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Stellenbosch].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Stellenbosch].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Stellenbosch].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Stellenbosch].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Stellenbosch].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Stellenbosch].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Stellenbosch].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Stellenbosch].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Stellenbosch].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Stellenbosch].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Stellenbosch].StudentInfo
Join [Stellenbosch].CourseInfo On [Stellenbosch].StudentInfo.CourseID = [Stellenbosch].CourseInfo.CourseID
Join [Stellenbosch].ModuleInfo on [Stellenbosch].StudentInfo.ModuleID = [Stellenbosch].ModuleInfo.ModuleID
Join [Stellenbosch].ClassMarks on [Stellenbosch].StudentInfo.ClassMarksID = [Stellenbosch].ClassMarks.ClassMarksID
Join [Stellenbosch].MarkRange on [Stellenbosch].StudentInfo.MarkRangeID = [Stellenbosch].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Stellenbosch].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Stellenbosch].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Stellenbosch].Report @CourseName = 'MCSD'






------------------------------------------------------------Vereeniging-------------------------------------------------------------


USE CTU
Create Schema [Vereeniging]




												----------Create tables----------
--StudentInfo Table

Create Table [Vereeniging].[StudentInfo]
(
StudentNumber int Primary Key Identity(1,1) Not null
)

--CourseInfo Table

Create Table [Vereeniging].[CourseInfo]
(
CourseID int Primary Key Identity(1,1) Not null
)

--ModuleInfo Table
Create Table [Vereeniging].[ModuleInfo]
(
ModuleID int Primary Key Identity(1,1) Not null
)

--ClassMarks Table 

Create Table [Vereeniging].[ClassMarks]
(
ClassMarksID int Primary Key Identity(1,1) Not null
)

Create Table [Vereeniging].MarkRange
(
MarkRangeID int Primary Key Identity(1,1) Not null,
MarkRange varchar(6) Not null,
Symbol varchar(3)
)

--------------------------------------------------------------------Alter StudentInfo table--------------------------------------------------------------------


------Add columns to StudentInfo table


Alter Table [Vereeniging].[StudentInfo]
Add StudentName varchar(25) not null


Alter table [Vereeniging].[StudentInfo]
Add StudentSurname varchar(25) Not null


------Add Foreign Key to link CourseInfo Table
Alter table [Vereeniging].[StudentInfo]
Add CourseID int  Not null


Alter table [Vereeniging].[StudentInfo]
Add Constraint FK_StudentCourse 
Foreign Key (CourseID)
References [Vereeniging].[CourseInfo](CourseID)


------Add Foreign Key to link ModuleInfo Table


Alter table [Vereeniging].[StudentInfo]
Add ModuleID int  Not null


Alter table [Vereeniging].[StudentInfo]
Add  Constraint FK_StudentModule 
Foreign Key (ModuleID)
References [Vereeniging].[ModuleInfo](ModuleID)
						
											
								

------Add Foreign Key to link ClassMarks Table


Alter table [Vereeniging].[StudentInfo]
Add ClassMarksID int  Not null

Alter table [Vereeniging].[StudentInfo]
Add  Constraint FK_StudentMarks
Foreign Key (ClassMarksID)
References [Vereeniging].[ClassMarks](ClassMarksID)
				
				
------Add Foreign Key to link MarkRange Table


Alter table [Vereeniging].[StudentInfo]
Add MarkRangeID int  Not null

Alter table [Vereeniging].[StudentInfo]
Add  Constraint FK_StudentMarkRange
Foreign Key (MarkRangeID)
References [Vereeniging].[MarkRange](MarkRangeID)		
											
--------------------------------------------------------------------Alter CourseInfo table--------------------------------------------------------------------



------Add columns to CourseInfo table


Alter table [Vereeniging].[CourseInfo]
Add CourseName varchar(35) not null

Alter table [Vereeniging].[CourseInfo]
Add CourseDuration varchar(25) Not null

Alter table [Vereeniging].[CourseInfo]
Add CourseCredits varchar(25) Not null

--------------------------------------------------------------------Alter ModuleInfo table--------------------------------------------------------------------



------Add columns to ModuleInfo table

Alter table [Vereeniging].[ModuleInfo]
Add ModuleName varchar(35) not null

Alter table [Vereeniging].[ModuleInfo]
Add Formative varchar(50) not null

Alter table [Vereeniging].[ModuleInfo]
Add Summative varchar(50) not null

Alter table [Vereeniging].[ModuleInfo]
Add ModuleDuration varchar(25) null



------Add Foreign Key to link CourseInfo 


Alter table [Vereeniging].[ModuleInfo]
Add CourseID int  Not null

Alter table [Vereeniging].[ModuleInfo]
Add  Constraint FK_CourseModule 
Foreign Key (CourseID)
References [Vereeniging].[CourseInfo](CourseID)



--------------------------------------------------------------------Alter ClassMarks table--------------------------------------------------------------------



------Add columns to ClassMarks table


------Add Foreign Key to link CourseInfo Table

Alter table [Vereeniging].[ClassMarks]
Add CourseID int  Not null


Alter table [Vereeniging].[ClassMarks]
Add  Constraint FK_CourseMarks
Foreign Key (CourseID)
References [Vereeniging].[CourseInfo](CourseID)



------Add Foreign Key to link ModuleInfo Table

Alter table [Vereeniging].[ClassMarks]
Add ModuleID int Not null


Alter table [Vereeniging].[ClassMarks]
Add  Constraint FK_MarksModule 
Foreign Key (ModuleID)
References [Vereeniging].[ModuleInfo](ModuleID)

------Add Foreign Key to link ModuleInfo Table

Alter table [Vereeniging].[ClassMarks]
Add MarkRangeID int Not null


Alter table [Vereeniging].[ClassMarks]
Add  Constraint FK_ClassMarksRange 
Foreign Key (MarkRangeID )
References [Vereeniging].[MarkRange](MarkRangeID)



--------------------------------------------------------------------Insert Values into CourseInfo table--------------------------------------------------------------------



Insert into [Vereeniging].CourseInfo(CourseName, CourseDuration, CourseCredits)
Values ('MCSD' , '12 Months', 140),
('Business Intellegence', '12 Months', 130)





--------------------------------------------------------------------Insert Values into ModuleInfo table--------------------------------------------------------------------


Insert into [Vereeniging].ModuleInfo(ModuleName, Formative, Summative, ModuleDuration, CourseID)
Values ('Programming in C#' , 'Develop a Calculator in C# ', 'Login Systems', '2 weeks', 1),
('Servers', 'Database Development 1', 'Backup ' , '3 weeks',1)


--------------------------------------------------------------------Insert values Into MarkRange table--------------------------------------------------------------------


Insert Into [Vereeniging].MarkRange(Symbol, MarkRange) 
Values 
('F', '0-39'),
('E', '40-49'),
('D', '50-59'),
('C', '60-69'),
('B', '70-79'),
('A', '80-89'),
('A+', '90-100')




--------------------------------------------------------------------Insert values Into ClassMarks table--------------------------------------------------------------------

Insert Into [Vereeniging].ClassMarks(CourseID, ModuleID, MarkRangeID ) 
Values 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(2,2,1 ),
(2,2,2 ),
(2,2,3 ),
(2,2,4),
(2,2,5 ),
(2,2,6),
(2,2,7 )






--------------------------------------------------------------------Insert values Into StudentInfo table--------------------------------------------------------------------



Insert into [Vereeniging].StudentInfo(StudentName, StudentSurname, CourseID, ModuleID,ClassMarksID, MarkRangeID  )
Values ('Dakalo' , 'Ndou', 1, 1,6, 6),
('Danie', 'Moes' , 2, 2,12,5)



--------------------------------------------------------------------Create view--------------------------------------------------------------------




Create view  [Vereeniging].ClassMarksView
AS
Select StudentNumber, StudentName, StudentSurname,CourseName, CourseCredits,ModuleName,Formative, MarkRange as FormativeMarks, Summative, MarkRange  as SummativeMarks from [Vereeniging].StudentInfo
Join [Vereeniging].CourseInfo On [Vereeniging].StudentInfo.CourseID = [Vereeniging].CourseInfo.CourseID
Join [Vereeniging].ModuleInfo on [Vereeniging].StudentInfo.ModuleID = [Vereeniging].ModuleInfo.ModuleID
Join [Vereeniging].ClassMarks on [Vereeniging].StudentInfo.ClassMarksID = [Vereeniging].ClassMarks.ClassMarksID
Join [Vereeniging].MarkRange on [Vereeniging].StudentInfo.MarkRangeID = [Vereeniging].MarkRange.MarkRangeID


--------------------------------------------------------------------Create Procedure--------------------------------------------------------------------



CREATE PROCEDURE [Vereeniging].Report @CourseName varchar(35)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select CourseID, CourseName, CourseDuration,CourseCredits from [Vereeniging].CourseInfo
	Where CourseName  = @CourseName
END
GO




exec [Vereeniging].Report @CourseName = 'MCSD'