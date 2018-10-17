DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspFacultyDelete`(
i_FacultyCode varchar(45),
i_FacultyFirstName varchar(1000),
i_FacultyLastName varchar(1000),
i_Qualification varchar(45),
i_Designation varchar(45)
)
BEGIN
Declare i_FacultyID int;
Set i_FacultyID=(select FacultyNumber from tblFacultyDetails where FacultyCode=i_FacultyCode);
Delete from tblFacultyDetails where FacultyNumber=i_FacultyID;
END$$
DELIMITER ;
