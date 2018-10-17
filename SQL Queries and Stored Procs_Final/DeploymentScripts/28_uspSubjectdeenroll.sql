DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectdeEnroll`(
IN i_SubjectCode varchar(12),
IN i_StudentID int,
out o_SubjectAlreadyEnrolled int
)
BEGIN
declare i_SubjectID int;
set i_SubjectID=(Select SubjectID from tblSubjectDetails where SubjectCode=i_SubjectCode);

IF EXISTS(Select StudentXSubjectID from tblStudentXSubjectsEnroll where StudentID=i_StudentID and SubjectID=i_SubjectID and Isactive=1) THen
set o_SubjectAlreadyEnrolled=1;
Update tblstudentxsubjectsenroll set IsActive=0 where StudentID=i_StudentID and SubjectID=i_SubjectID;
else
set o_SubjectAlreadyEnrolled=0;
END IF;
END$$
DELIMITER ;
