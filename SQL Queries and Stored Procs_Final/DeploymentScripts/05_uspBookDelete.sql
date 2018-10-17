DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookDelete`(
IN i_BookCode varchar(100) ,
IN i_BookName varchar(1000),
IN i_BookAvailability int,
IN i_AdminID int
)
BEGIN
declare i_BookID int;
set i_BookID=(Select BookID from tblBookDetails where BookCode=i_BookCode);
Update tblBookDetails
 set IsActive=0,
 UpdatedUserID=i_AdminID,
 UpdatedDate=current_timestamp()
where BookID=i_BookID;
END$$
DELIMITER ;
