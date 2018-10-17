DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookDetailsByBookCodeGet`(IN i_BookCode varchar(25))
BEGIN
Select BookCode,BookName,BookAvailability from tblbookdetails where BookCode=i_BookCode and isactive=1;
END$$
DELIMITER ;
