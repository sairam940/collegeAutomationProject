INSERT INTO tbladminregistration
(FirstName,LastName,EmailAddress,ContactNumber,UserName,PasswordforUserName)
VALUES
('sairam','pullabhotla','sai.ram@gmail.com',1234567890,'sairamadmin','sairam');

INSERT INTO `msudatabase`.`tbldepartmentdetails`
(
`DepartmentName`,
`DepartmentCode`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'Computer Science',
'CS',
1,
1,
curdate());


INSERT INTO `msudatabase`.`tbldepartmentdetails`
(
`DepartmentName`,
`DepartmentCode`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'Public Health',
'PH',
1,
1,
curdate());

INSERT INTO `msudatabase`.`tbldepartmentdetails`
(
`DepartmentName`,
`DepartmentCode`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'Electrical and Electronics',
'EE',
1,
1,
curdate());

INSERT INTO `msudatabase`.`tbldepartmentdetails`
(
`DepartmentName`,
`DepartmentCode`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'Information Technology',
'IT',
1,
1,
curdate());

INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'CS001',
'Masters',
1,
1,
1,
current_timestamp(),
'Masters in Computer Science');


INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'PH001',
'Masters',
2,
1,
1,
current_timestamp(),
'Masters in Public Health');


INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'EE001',
'Masters',
3,
1,
1,
current_timestamp(),
'Masters in Electricals and Electronics');

INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'IT001',
'Masters',
4,
1,
1,
current_timestamp(),
'Masters in Information Technology');

INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'CS002',
'Bachelor',
1,
1,
1,
current_timestamp(),
'Bachelor of Computer Science');


INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'PH002',
'Bachelor',
2,
1,
1,
current_timestamp(),
'Bachelor of Public Health');


INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'EE002',
'Bachelor',
3,
1,
1,
current_timestamp(),
'Bachelor of Electricals and Electronics');

INSERT INTO `msudatabase`.`tblcoursedetails`
(
`CourseCode`,
`CourseType`,
`DepartmentId`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,`CourseName`)
VALUES
(
'IT002',
'Bachelor',
4,
1,
1,
current_timestamp(),
'Bachelor of Information Technology');


INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS01',
1,
1,
1,
1,
current_timestamp(),
'Algorithms and Datastructures');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS02',
1,
1,
1,
1,
current_timestamp(),
'Distributed Systems');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS03',
1,
1,
1,
1,
current_timestamp(),
'Computer Networks');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS04',
1,
1,
1,
1,
current_timestamp(),
'Operating Systems');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS05',
1,
1,
1,
1,
current_timestamp(),
'Professional Ethics');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH01',
2,
2,
1,
1,
current_timestamp(),
'Biostatistics');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH02',
2,
2,
1,
1,
current_timestamp(),
'Behavioral and Social Aspects of Public Health');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH03',
2,
2,
1,
1,
current_timestamp(),
'Public Health System');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH04',
2,
2,
1,
1,
current_timestamp(),
'Epidemiology');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH05',
2,
2,
1,
1,
current_timestamp(),
'Environmental Health');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH06',
2,
6,
1,
1,
current_timestamp(),
'Research Methods in Public Health');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH07',
2,
6,
1,
1,
current_timestamp(),
'Community Health Analysis');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH08',
2,
6,
1,
1,
current_timestamp(),
'Health Policy');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH09',
2,
6,
1,
1,
current_timestamp(),
'Biological Aspects of Public Health');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'PH10',
2,
6,
1,
1,
current_timestamp(),
'Management of Health Services Organization');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE01',
3,
3,
1,
1,
current_timestamp(),
'Digital Signal Procesing');


INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE02',
3,
3,
1,
1,
current_timestamp(),
'Power Circuits');


INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE03',
3,
3,
1,
1,
current_timestamp(),
'Electromechanics');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE04',
3,
3,
1,
1,
current_timestamp(),
'Electronic Circuits');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE05',
3,
3,
1,
1,
current_timestamp(),
'Fields and Waves');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE06',
3,
7,
1,
1,
current_timestamp(),
'Communication Networks');


INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE07',
3,
7,
1,
1,
current_timestamp(),
'MicroComputers');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE08',
3,
7,
1,
1,
current_timestamp(),
'Embedded DSP');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE09',
3,
7,
1,
1,
current_timestamp(),
'Electric Machinery');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'EE10',
3,
7,
1,
1,
current_timestamp(),
'Semsors and Instrumentation');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS06',
1,
5,
1,
1,
current_timestamp(),
'C Programming');


INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS07',
1,
5,
1,
1,
current_timestamp(),
'Basic Concepts of Programming');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS08',
1,
5,
1,
1,
current_timestamp(),
'Visual C#');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS09',
1,
5,
1,
1,
current_timestamp(),
'MicroProcessors');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'CS10',
1,
5,
1,
1,
current_timestamp(),
'Database Management Systems');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'IT01',
4,
4,
1,
1,
current_timestamp(),
'Introduction to Information Technology');

INSERT INTO `msudatabase`.`tblsubjectdetails`
(
`SubjectCode`,
`DepartmentId`,
`CourseID`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`,
`SubjectName`)
VALUES
(
'IT06',
4,
8,
1,
1,
current_timestamp(),
'Structured Programming');


INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK001',
1,
'Algorithm and DataStructures',
50,
1,
1,
current_timestamp());

INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK002',
2,
'Concepts of Health and Welfare',
50,
1,
1,
current_timestamp());

INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK003',
3,
'Digital Signal Processing',
50,
1,
1,
current_timestamp());

INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK004',
4,
'Microprocessors',
50,
1,
1,
current_timestamp());


INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK005',
1,
'ASP.Net - The Beginning',
1,
1,
2,
current_timestamp());

INSERT INTO `msudatabase`.`tblbookdetails`
(
`BookCode`,
`DepartmentId`,
`BookName`,
`BookAvailability`,
`IsActive`,
`UpdatedUserID`,
`UpdatedDate`)
VALUES
(
'BK006',
1,
'ASP.Net - The Beginning-Part2',
50,
1,
2,
current_timestamp());

Update tblBookDetails set MaximumBookAvailable=50 where BookID in (1,2,3,4,5,6);

select * from tblbookdetails;
Select * from tblstudentsXbooks 



INSERT INTO `msudatabase`.`tblfacultydetails`
(
`FacultyFirstName`,
`FacultyLastName`,
`Qualification`,
`Designation`,
`FacultyCode`)
VALUES
(
'Keerthi',
'Reddy',
'PHD',
'Professor',
'FC001');


INSERT INTO `msudatabase`.`tblfacultydetails`
(
`FacultyFirstName`,
`FacultyLastName`,
`Qualification`,
`Designation`,
`FacultyCode`)
VALUES
(
'Geetha',
'Priya',
'PHD',
'Professor',
'FC002');


INSERT INTO `msudatabase`.`tblfacultydetails`
(
`FacultyFirstName`,
`FacultyLastName`,
`Qualification`,
`Designation`,
`FacultyCode`
)
VALUES
(
'Praveen',
'Kumar',
'MS',
'Asst Professor',
'FC003');


INSERT INTO `msudatabase`.`tblfacultydetails`
(
`FacultyFirstName`,
`FacultyLastName`,
`Qualification`,
`Designation`,
`FacultyCode`)
VALUES
(
'Suresh',
'Kumar',
'MS',
'Asst Professor',
'FC004');