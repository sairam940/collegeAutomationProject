DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectDetailsGet`()
BEGIN
Select distinct sd.SubjectCode as SubjectCode,dd.DepartmentCode as DepartmentCode,cd.CourseCode as CourseCode,sd.SubjectName as SubjectName
from tblSubjectdetails sd 
inner join tblDepartmentDetails dd on dd.departmentID=sd.departmentid
inner join tblCourseDetails cd on cd.courseid=sd.courseid 
where  sd.isactive=1;

END$$
DELIMITER ;
