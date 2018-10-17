DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectDetailsGetforStudent`(IN i_StudentID int)
BEGIN
Select SubjectCode,SubjectName from tblSubjectDetails sd
inner join tblstudentXsubjectsenroll sse on sse.SubjectID=sd.SubjectID where sse.StudentID=i_StudentID and sse.isActive=1 and sd.isactive=1;

END$$
DELIMITER ;
