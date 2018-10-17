DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookDetailsGet`(in_Filter varchar(100))
Begin
IF(in_Filter="ALL") THEN
Select BookCode,BookName,BookAvailability from tblBookDetails where isactive=1;
ELSE 
Select BookCode,BookName,BookAvailability from tblBookDetails where 
DepartmentID=Cast(in_Filter as unsigned) and isactive=1;
end if;

END$$
DELIMITER ;
