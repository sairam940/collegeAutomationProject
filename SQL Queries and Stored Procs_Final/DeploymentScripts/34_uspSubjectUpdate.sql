DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectUpdate`(
IN i_SubjectCode varchar(100) ,
IN i_DepartmentCode varchar(100) ,
IN i_CourseCode varchar(1000),
IN i_SubjectName varchar(1000),
IN i_AdminID int
)
BEGIN
declare i_SubjectID int;
declare i_CourseID int;
declare i_DepartmentID int;
set i_SubjectID=(select SubjectId from tblsubjectdetails where SubjectCode=i_SubjectCode);
set i_CourseID=(select CourseID from tblCourseDetails where CourseCode=i_CourseCode);
set i_DepartmentID=(select DepartmentId from tbldepartmentdetails where DepartmentCode=i_DepartmentCode);
Update tblsubjectdetails 
set SubjectCode=i_SubjectCode,
DepartmentID=i_DepartmentID,
CourseID=i_CourseID,
SubjectName=i_SubjectName,
UpdatedUserID=i_AdminID,
UpdatedDate=current_timestamp()
where SubjectID=i_SubjectID and isactive=1;
END$$
DELIMITER ;
