DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspBookReturn`(
IN i_BookCode varchar(100) ,
IN i_StudentID int ,
OUT o_BookAvailability int,
OUT o_BookID int,
OUT o_IsBookCanBeReturned int,
OUT o_IsBookAlreadyReturned int
)
Begin

declare IsBookAlreadyReturned int;
declare MaximumAvailability int;

set o_BookAvailability=(select BookAvailability from tblBookDetails where BookCode=i_BookCode and isactive=1);
set o_BookID=(select BookID from tblBookDetails where BookCode=i_BookCode and isactive=1);
set MaximumAvailability=(Select MaximumBookAvailable from tblBookDetails where BookCode=i_BookCode and isactive=1);

if(o_BookAvailability<=MaximumAvailability) then
set o_IsBookCanBeReturned=1;
else 
set o_IsBookCanBeReturned=0;
end if;

set IsBookAlreadyReturned=(Select count(*) from tblStudentsXBooks where StudentID=i_StudentID and BookID=o_BookID and IsActive=1);
if(IsBookAlreadyReturned!=0) then 
set o_IsBookAlreadyReturned=1;
else
set o_IsBookAlreadyReturned=0;
end if;


if(o_IsBookAlreadyReturned=1 && o_IsBookCanBeReturned=1) then
Update tblBookDetails set BookAvailability=(BookAvailability+1) where BookCode= i_BookCode and isactive=1;
update tblStudentsXBooks set isActive=0 where StudentID=i_StudentID and BookID=o_BookID and isactive=1;
set o_BookAvailability=(select BookAvailability from tblBookDetails where BookCode=i_BookCode and isactive=1);
end if;

END$$
DELIMITER ;
