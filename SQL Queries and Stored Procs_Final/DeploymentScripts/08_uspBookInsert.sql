DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookInsert`(
IN i_BookCode varchar(100) ,
IN i_DepartmentID varchar(100) ,
IN i_BookName varchar(100) ,
IN i_BookAvailability bigint ,
IN i_AdminID varchar(100) ,
IN i_MaxBookAvailability varchar(100),
OUT o_BookID int
)
BEGIN
Insert into tblBookDetails
(
BookCode,
DepartmentID,
BookName,
BookAvailability,
UpdatedUserID,
UpdatedDate,
MaximumBookAvailable,
IsActive
)
values
( i_BookCode,
 i_DepartmentID,
i_BookName,
i_BookAvailability,
i_AdminID,
current_timestamp(),
i_MaxBookAvailability,
1);

set o_BookID=(select BookID from tblBookDetails order by 1 desc LIMIT 1);
END$$
DELIMITER ;
