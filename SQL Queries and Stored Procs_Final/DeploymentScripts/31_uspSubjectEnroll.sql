DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspSubjectEnroll`(
IN i_SubjectCode varchar(12),
IN i_StudentID int,
out o_SubjectAlreadyEnrolled int
)
BEGIN
declare i_SubjectID int;
set i_SubjectID=(Select SubjectID from tblSubjectDetails where SubjectCode=i_SubjectCode);

IF EXISTS(Select StudentXSubjectID from tblStudentXSubjectsEnroll where StudentID=i_StudentID and SubjectID=i_SubjectID and IsActive=1) THen
set o_SubjectAlreadyEnrolled=1;
else

set o_SubjectAlreadyEnrolled=0;
INSERT INTO tblstudentxsubjectsenroll
(
`StudentID`,
`SubjectID`,
`IsActive`)
VALUES
(
i_StudentID,
i_SubjectID,
1);

END IF;
END$$
DELIMITER ;
