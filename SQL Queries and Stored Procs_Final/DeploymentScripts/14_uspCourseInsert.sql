DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCourseInsert`(
IN i_CourseCode varchar(100) ,
IN i_CourseType varchar(100),
IN i_CourseName varchar(100) ,
in_Filter varchar(100),
IN i_AdminID int,
OUT o_CourseID int,
OUT o_isSameCourseCodeExists int
)
BEGIN

IF EXISTS(Select CourseID from tblcoursedetails where CourseCode=i_CourseCode) THEN
set o_isSameCourseCodeExists=1;
ELSE
BEGIN
set o_isSameCourseCodeExists=0;
Insert into tblcoursedetails
(
CourseCode,
CourseType,
DepartmentID,
IsActive,
UpdatedUserID,
UpdatedDate,
CourseName
)
values
( i_CourseCode,
 i_CourseType,
 Cast(in_Filter as unsigned),
1,
i_AdminID,
current_timestamp(),
i_CourseName
);
set o_CourseID=(select CourseID from tblcoursedetails order by 1 desc LIMIT 1);
END;
END IF;
END$$
DELIMITER ;
