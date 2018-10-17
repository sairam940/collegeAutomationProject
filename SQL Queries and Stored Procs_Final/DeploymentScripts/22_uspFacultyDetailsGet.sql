DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspFacultyDetailsGet`()
BEGIN
Select FacultyCode,FacultyFirstName,FacultyLastName,Qualification,Designation from tblfacultydetails;
END$$
DELIMITER ;
