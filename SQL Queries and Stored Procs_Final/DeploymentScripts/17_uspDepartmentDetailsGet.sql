DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspDepartmentDetailsGet`()
BEGIN
Select DepartmentCode,DepartmentName from tblDepartmentDetails where IsActive=1;
END$$
DELIMITER ;
