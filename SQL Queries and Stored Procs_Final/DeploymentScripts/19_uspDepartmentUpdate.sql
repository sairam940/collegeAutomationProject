DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspDepartmentUpdate`(IN i_DepartmentCode varchar(100) ,
IN i_DepartmentName varchar(1000),
IN i_AdminID int
)
BEGIN
declare i_DepartmentID int;
set i_DepartmentID=(select departmentID from tblDepartmentDetails where DepartmentCode=i_DepartmentCode);
Update tblDepartmentDetails 
set DepartmentCode=i_DepartmentCode,
DepartmentName=i_DepartmentName,
UpdatedUserID=i_AdminID,
UpdatedDate=current_timestamp()
where DepartmentID=i_DepartmentID and isactive=1;
END$$
DELIMITER ;
