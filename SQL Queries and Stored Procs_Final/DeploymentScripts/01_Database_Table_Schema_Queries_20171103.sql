Use msudatabase;


CREATE TABLE tblAdminregistration (
AdminID int(11) NOT NULL AUTO_INCREMENT,
FirstName varchar(100) NOT NULL,
LastName varchar(100) NOT NULL,
EmailAddress varchar(100) NOT NULL,
contactNumber bigint NOT NULL,
UserName varchar(100) NOT NULL,
PasswordforUserName varchar(100) NOT NULL,
PRIMARY KEY (AdminID));

CREATE TABLE tblBookDetails (
BookID int(11) NOT NULL AUTO_INCREMENT,
BookCode varchar(100) NOT NULL,
DepartmentId int,
BookName varchar(100) NOT NULL,
BookAvailability int NOT NULL,
UpdatedUserID int NOT NULL,
UpdatedDate datetime,
PRIMARY KEY (BookID),
FOREIGN KEY (DepartmentID) REFERENCES tblDepartmentDetails(DepartmentID)
        ON DELETE SET NULL
        ON UPDATE CASCADE);

ALTER TABLE `msudatabase`.`tblbookdetails` 
ADD COLUMN `MaximumBookAvailable` INT NULL AFTER `UpdatedDate`,
ADD UNIQUE INDEX `BookCode_UNIQUE` (`BookCode` ASC);

ALTER TABLE `msudatabase`.`tblbookdetails` 
ADD COLUMN `IsActive` BIT(1) NOT NULL AFTER `MaximumBookAvailable`;



CREATE TABLE tblCourseDetails (
CourseID int(11) NOT NULL AUTO_INCREMENT,
CourseCode varchar(100) NOT NULL,
CourseType varchar(100) NOT NULL, 
DepartmentId int,
IsActive bit NOT NULL,
UpdatedUserID int NOT NULL,
UpdatedDate datetime,
PRIMARY KEY (CourseID),
FOREIGN KEY (DepartmentID) REFERENCES tblDepartmentDetails(DepartmentID)
        ON DELETE SET NULL
        ON UPDATE CASCADE);
        
ALTER TABLE `msudatabase`.`tblcoursedetails` 
ADD COLUMN `CourseName` VARCHAR(100) NOT NULL AFTER `UpdatedDate`;


CREATE TABLE tblDepartmentDetails (
DepartmentID int(11) NOT NULL AUTO_INCREMENT,
DepartmentName varchar(100) NOT NULL,
DepartmentCode varchar(100) NOT NULL,
IsActive bit NOT NULL,
UpdatedUserID int NOT NULL,
UpdatedDate datetime,
PRIMARY KEY (DepartmentID));

CREATE TABLE `tblfacultydetails` (
  `FacultyNumber` int(11) NOT NULL AUTO_INCREMENT,
  `FacultyFirstName` varchar(100) NOT NULL,
  `FacultyLastName` varchar(100) NOT NULL,
  `Qualification` varchar(45) NOT NULL,
  `Designation` varchar(1000) NOT NULL,
  `FacultyCode` varchar(45) NOT NULL,
  PRIMARY KEY (`FacultyNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `tblfacultyxsubjects` (
  `FacultyXSubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `FacultyID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `IsActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`FacultyXSubjectID`),
  KEY `SubjectID_idx` (`SubjectID`),
  KEY `FacultyID_idx` (`FacultyID`),
  CONSTRAINT `FacultyID` FOREIGN KEY (`FacultyID`) REFERENCES `tblfacultydetails` (`FacultyNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `tblsubjectdetails` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE tblstudentregistration (
StudentID int(11) NOT NULL AUTO_INCREMENT,
FirstName varchar(100) NOT NULL,
LastName varchar(100) NOT NULL,
EmailAddress varchar(100) NOT NULL,
contactNumber bigint NOT NULL,
UserName varchar(100) NOT NULL,
PasswordforUserName varchar(100) NOT NULL,
PRIMARY KEY (StudentID));

Create table tblStudentsXBooks
(
StudentsXBooksID int auto_increment,
StudentID int,
BookID int,
IsActive int,
primary key(StudentsXBooksID),
Foreign key(StudentID) References tblstudentregistration(StudentID)
ON DELETE SET NULL
ON UPDATE CASCADE,
Foreign Key(BookID) References tblbookdetails(BookID)
ON DELETE SET NULL
ON UPDATE CASCADE
);


CREATE TABLE `msudatabase`.`tblstudentxsubjectsenroll` (
  `StudentXSubjectID` INT NOT NULL AUTO_INCREMENT,
  `StudentID` INT NOT NULL,
  `SubjectID` INT NOT NULL,
  `IsActive` INT NOT NULL,
  PRIMARY KEY (`StudentXSubjectID`));  

        
        
CREATE TABLE tblSubjectDetails (
SubjectID int(11) NOT NULL AUTO_INCREMENT,
SubjectCode varchar(100) NOT NULL,
DepartmentId int,
CourseID int(11) ,
IsActive bit NOT NULL,
UpdatedUserID int NOT NULL,
UpdatedDate datetime,
PRIMARY KEY (SubjectID),
FOREIGN KEY (DepartmentID) REFERENCES tblDepartmentDetails(DepartmentID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
FOREIGN KEY (CourseID) REFERENCES tblCourseDetails(CourseID)
        ON DELETE SET NULL
        ON UPDATE CASCADE);
        
ALTER TABLE `msudatabase`.`tblsubjectdetails` 
ADD COLUMN `SubjectName` VARCHAR(100) NULL AFTER `UpdatedDate`;
