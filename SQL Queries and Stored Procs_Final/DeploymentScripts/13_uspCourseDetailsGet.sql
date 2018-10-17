DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCourseDetailsGet`()
BEGIN
Select CourseCode,CourseType,CourseName from tblcoursedetails where IsActive=1;
END$$
DELIMITER ;
