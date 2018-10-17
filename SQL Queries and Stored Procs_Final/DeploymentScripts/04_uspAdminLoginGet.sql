DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspAdminLoginGet`(
IN i_UserName varchar(100),
IN i_AdminID int,
IN i_Password varchar(100) 
)
BEGIN
Select * from tblAdminRegistration where 
username=i_UserName and AdminID=i_AdminID and PasswordforUserName=i_Password;

END$$
DELIMITER ;
