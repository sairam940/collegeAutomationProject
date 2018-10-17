DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookTake1`(
IN i_BookCode varchar(100) ,
IN i_StudentID int ,
OUT o_BookAvailability int,
OUT o_IsMaxBookLimitReached int,
OUT o_BookAlreadyTaken int,
OUT o_BookID int)
BEGIN
declare Max_limit int;
declare Same_Book int;
set o_BookAvailability=(select BookAvailability from tblBookDetails where BookCode=i_BookCode and isactive=1);
set o_BookID=(select BookID from tblBookDetails where BookCode=i_BookCode and isactive=1);
set Max_limit=(select count(*) from tblStudentsXBooks where StudentID=i_StudentID and isactive=1);

if(Max_limit=5) then
set o_IsMaxBookLimitReached=1;
else
set o_IsMaxBookLimitReached=0;
End if;

set Same_Book=(select count(*) from tblStudentsXBooks where StudentID=i_StudentID and BookID=o_BookID and isactive=1);
if(Same_Book=0) then
set o_BookAlreadyTaken=0;
else
set o_BookAlreadyTaken=1;
end if;

if(o_BookAlreadyTaken=0 && o_IsMaxBookLimitReached=0) then
Update tblBookDetails set BookAvailability=(BookAvailability-1) where BookCode= i_BookCode and isactive=1;
Insert into tblStudentsXBooks(StudentID,BookID,IsActive) values (i_StudentID,o_BookID,1);
set o_BookAvailability=(select BookAvailability from tblBookDetails where BookCode=i_BookCode and isactive=1);
End if;

END$$
DELIMITER ;
