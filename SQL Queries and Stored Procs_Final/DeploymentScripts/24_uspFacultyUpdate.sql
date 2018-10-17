DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspFacultyUpdate`(
IN i_FacultyCode varchar(100) ,
IN i_FacultyFirstName varchar(100) ,
IN i_FacultyLastName varchar(1000),
IN i_Qualification varchar(100),
IN i_Designation varchar(100)
)
BEGIN
declare i_FacultyID int;
set i_FacultyID=(select FacultyID from tblfacultydetails where FacultyCode=i_FacultyCode);
Update tblfacultydetails 
set FacultyCode=i_FacultyCode,
FirstName=i_FacultyFirstName,
LastName=i_FacultyLastName,
Qualification=i_Qualification,
Designation=i_Designation
where FacultyNumber=i_FacultyID;
END$$
DELIMITER ;
