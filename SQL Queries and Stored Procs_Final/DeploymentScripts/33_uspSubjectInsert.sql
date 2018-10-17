DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectInsert`(
IN i_SubjectCode varchar(100) ,
IN i_Departmentcode varchar(100),
IN i_CourseCode varchar(100) ,
IN i_SubjectName varchar(1000),
IN i_AdminID int,
OUT o_SubjectID int,
OUT o_isSameSubjectCodeExists int
)
BEGIN
declare i_DepartmentID int;
declare i_CourseID int;
set i_DepartmentID=(Select DepartmentID from tbldepartmentdetails where DepartmentCode=i_DepartmentCode);
set i_CourseID=(Select CourseID from tblcoursedetails where CourseCode=i_CourseCode);

IF EXISTS(Select SubjectCode from tblsubjectdetails where SubjectCode=i_SubjectCode) THEN
set o_isSameSubjectCodeExists=1;
ELSE
BEGIN
set o_isSameSubjectCodeExists=0;
Insert into tblSubjectdetails
(
SubjectCode,
DepartmentID,
CourseID,
IsActive,
UpdatedUserID,
UpdatedDate,
SubjectName
)
values
( i_SubjectCode,
 i_DepartmentID,
 i_CourseID,
1,
i_AdminID,
current_timestamp(),
i_SubjectName
);
set o_SubjectID=(select SubjectID from tblSubjectdetails order by 1 desc LIMIT 1);
END;
END IF;
END$$
DELIMITER ;
