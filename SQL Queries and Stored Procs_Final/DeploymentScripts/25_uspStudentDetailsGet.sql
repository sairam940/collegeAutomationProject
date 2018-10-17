DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspStudentDetailsGet`(IN i_StudentID int,
OUT o_FirstName varchar(100),
OUT o_LastName varchar(100),
OUT o_EmailAddress varchar(100),
OUT o_ContactNumber bigint
)
BEGIN
set o_FirstName=(Select FirstName from tblStudentRegistration where StudentID=i_StudentID);
set o_LastName=(Select LastName from tblStudentRegistration where StudentID=i_StudentID);
set o_EmailAddress=(Select EmailAddress from tblStudentRegistration where StudentID=i_StudentID);
set o_ContactNumber=(Select ContactNumber from tblStudentRegistration where StudentID=i_StudentID);
END$$
DELIMITER ;
