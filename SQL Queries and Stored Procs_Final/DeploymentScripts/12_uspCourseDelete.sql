DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCourseDelete`(
IN i_CourseCode varchar(100) ,
IN i_CourseType varchar(1000),
IN i_CourseName varchar(1000),
IN i_AdminID int,
OUT o_iscoursecodeexists int
)
BEGIN
Declare i_CourseID int;
set i_CourseID=(Select CourseID from tblCourseDetails where Coursecode=i_CourseCode);
IF EXISTS(Select CourseID from tblCourseDetails where Coursecode=i_CourseCode) THen
set o_iscoursecodeexists=1;
Update  tblcoursedetails set  IsActive=0 where CourseID=i_CourseID;
else
set o_iscoursecodeexists=0;
END IF;
END$$
DELIMITER ;
