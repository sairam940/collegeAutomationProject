DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectDelete`(
IN i_SubjectCode varchar(100) ,
IN i_DepartmentCode varchar(1000),
IN i_CourseCode varchar(1000),
IN i_SubjectName varchar(1000),
IN i_AdminID int,
OUT o_issubjectcodeexists int
)
BEGIN
Declare i_SubjectID int;
Declare i_DepartmentID int;
Declare i_CourseID int;
set i_DepartmentID=(Select DepartmentID from tbldepartmentdetails where Departmentcode=i_DepartmentCode);
set i_CourseID=(Select CourseID from tblcoursedetails where Coursecode=i_CourseCode);
set i_SubjectID=(Select SubjectID from tblSubjectDetails where SubjectCode=i_SubjectCode and DepartmentID=i_DepartmentID and CourseID=i_CourseID );
IF EXISTS(Select SubjectID from tblSubjectDetails where SubjectCode=i_SubjectCode and DepartmentID=i_DepartmentID and CourseID=i_CourseID) THen
set o_issubjectcodeexists=1;
Update  tblsubjectdetails set  IsActive=0 where SubjectID=i_SubjectID;
else
set o_issubjectcodeexists=0;
END IF;
END$$
DELIMITER ;
