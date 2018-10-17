DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspStudentDetailsInsert`(
IN i_FirstName varchar(100) ,
IN i_LastName varchar(100) ,
IN i_EmailAddress varchar(100) ,
IN i_contactNumber bigint ,
IN i_UserName varchar(100) ,
IN i_PasswordforUserName varchar(100),
OUT o_StudentID int 
)
Begin
Insert into tblstudentregistration
(
FirstName,
LastName,
EmailAddress,
contactNumber,
UserName,
PasswordforUserName
)
values
(
i_FirstName,
i_LastName,
i_EmailAddress,
i_contactNumber,
i_UserName,
i_PasswordforUserName);

set o_StudentID=(select studentid from tblstudentregistration order by 1 desc LIMIT 1);
END$$
DELIMITER ;
