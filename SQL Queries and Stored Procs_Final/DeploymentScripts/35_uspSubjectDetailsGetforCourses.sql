DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectDetailsGetforCourses`(IN in_Filter int)
BEGIN
Select SubjectCode,SubjectName from tblSubjectDetails where CourseID=in_Filter and isactive=1;
END$$
DELIMITER ;
