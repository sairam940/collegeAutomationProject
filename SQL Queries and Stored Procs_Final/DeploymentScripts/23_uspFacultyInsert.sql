DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspFacultyInsert`(
IN i_FacultyCode varchar(100) ,
IN i_FacultyFirstName varchar(1000),
IN i_FacultyLastName varchar(1000) ,
i_Qualification varchar(100),
IN i_Designation Varchar(100),
OUT o_FacultyID int,
OUT o_isSameFacultyCodeExists int
)
BEGIN

IF EXISTS(Select FacultyNumber from tblFacultyDetails where FacultyCode=i_FacultyCode) THEN
set o_isSameFacultyCodeExists=1;
ELSE
BEGIN
set o_isSameFacultyCodeExists=0;
Insert into tblFacultydetails
(
FacultyFirstName,
FacultyLastName,
Qualification,
Designation,
FacultyCode
)
values
( i_FacultyFirstName,
 i_FacultyLastName,
 i_Qualification,
i_Designation,
i_FacultyCode
);
set o_FacultyID=(select FacultyNumber from tblfacultydetails order by 1 desc LIMIT 1);
END;
END IF;
END$$
DELIMITER ;
