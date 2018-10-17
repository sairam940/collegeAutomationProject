DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCourseUpdate`(
IN i_CourseCode varchar(100) ,
IN i_CourseType varchar(100) ,
IN i_CourseName varchar(1000),
IN i_AdminID int
)
BEGIN
declare i_CourseID int;
set i_CourseID=(select CourseID from tblCourseDetails where CourseCode=i_CourseCode);
Update tblcoursedetails 
set CourseCode=i_CourseCode,
CourseName=i_CourseName,
UpdatedUserID=i_AdminID,
UpdatedDate=current_timestamp()
where CourseID=i_CourseID and isactive=1;
END$$
DELIMITER ;
