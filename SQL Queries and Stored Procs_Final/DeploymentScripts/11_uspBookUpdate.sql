DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookUpdate`(
IN i_BookCode varchar(100) ,
IN i_BookName varchar(1000),
IN i_BookAvailability int,
IN i_AdminID int
)
BEGIN
declare i_BookID int;
set i_BookID=(Select BookID from tblBookDetails where BookCode=i_BookCode and isactive=1);
Update tblBookDetails
 set BookName=i_BookName,
 BookAvailability=i_BookAvailability,
 UpdatedUserID=i_AdminID,
 UpdatedDate=current_timestamp()
where BookID=i_BookID and isactive=1;
END$$
DELIMITER ;
