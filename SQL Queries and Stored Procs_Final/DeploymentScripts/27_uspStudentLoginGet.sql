DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspStudentLoginGet`(
IN i_UserName varchar(100),
IN i_StudentID int,
IN i_Password varchar(100) 
)
BEGIN
Select * from tblstudentregistration where 
username=i_UserName and studentID=i_StudentID and PasswordforUserName=i_Password;

END$$
DELIMITER ;
