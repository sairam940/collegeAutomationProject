DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspDepartmentDelete`(
IN i_DepartmentCode varchar(100) ,
IN i_DepartmentName varchar(1000),
IN i_AdminID int,
OUT o_isbookcodeexists int
)
BEGIN
Declare i_DepartmentID int;
set i_DepartmentID=(Select DepartmentID from tblDepartmentDetails where Departmentcode=i_DepartmentCode);
IF EXISTS(Select DepartmentID from tblDepartmentDetails where Departmentcode=i_DepartmentCode) THen
set o_isbookcodeexists=1;
Update  tblDepartmentDetails set  IsActive=0 where DepartmentID=i_DepartmentID;
else
set o_isbookcodeexists=0;
END IF;
END$$
DELIMITER ;
