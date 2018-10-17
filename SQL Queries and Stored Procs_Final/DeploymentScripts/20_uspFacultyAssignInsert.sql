DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspFacultyAssignInsert`(
IN i_AssignFacultyCode varchar(100) ,
IN in_Filter int,
OUT o_isSameSubjectCodeAssigned int
)
BEGIN
declare i_FacultyId int;
set i_FacultyId=(Select FacultyNumber from tblFacultyDetails where FacultyCode=i_AssignFacultyCode);
IF EXISTS(Select SubjectID,FacultyID from tblFacultyXSubjects where FacultyID=i_FacultyID and SubjectID=in_Filter) THEN
set o_isSameSubjectCodeAssigned=1;
ELSE
BEGIN
set o_isSameSubjectCodeAssigned=0;
Insert into tblFacultyXSubjects
(
FacultyID,
SubjectID,
UpdatedDate,
IsActive
)
values
(
i_FacultyID,
Cast(in_Filter as unsigned),
current_timestamp(),
1
);
END;
END IF;
END$$
DELIMITER ;
