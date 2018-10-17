DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspDepartmentInsert`(
IN i_DepartmentCode varchar(100) ,
IN i_DepartmentName varchar(100) ,
IN i_AdminID int,
OUT o_DepartmentID int,
OUT o_isSameDepartmentCodeExists int
)
BEGIN

IF EXISTS(Select DepartmentID from tblDepartmentDetails where DepartmentCode=i_DepartmentCode) THEN
set o_isSameDepartmentCodeExists=1;
ELSE
BEGIN
set o_isSameDepartmentCodeExists=0;
Insert into tblDepartmentDetails
(
DepartmentName,
DepartmentCode,
IsActive,
UpdatedUserID,
UpdatedDate
)
values
( i_DepartmentName,
 i_DepartmentCode,
1,
i_AdminID,
current_timestamp()
);
set o_DepartmentID=(select DepartmentID from tblDepartmentDetails order by 1 desc LIMIT 1);
END;
END IF;
END$$
DELIMITER ;
