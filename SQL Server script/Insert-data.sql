USE HighSchoolDB
GO



--Insert for User
INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1813365', -- Id - char(9)
          'nhat.nguyen1208', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811568', -- Id - char(9)
          'binh.le2569', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811640', -- Id - char(9)
          'cuong.nguyen1605', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811640', -- Id - char(9)
          'cuong.nguyen1605', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810880', -- Id - char(9)
          'dung.truong2000', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810867', -- Id - char(9)
          'duy.nguyenbkcs', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810887', -- Id - char(9)
          'dan.le.1231', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810173', -- Id - char(9)
          'huy.nguyen_gh2k', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810198', -- Id - char(9)
          'hung.toduy', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1812535', -- Id - char(9)
          'khang.hoang1998', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810235', -- Id - char(9)
          'khiem.nguyen159', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '000529', -- Id - char(9)
          'dtanh', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002603', -- Id - char(9)
          'anhpham', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )
INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '008395', -- Id - char(9)
          'hueanh', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002883', -- Id - char(9)
          'anhtt', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '003778', -- Id - char(9)
          'trtanh', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002920', -- Id - char(9)
          'ntbinh', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '003711', -- Id - char(9)
          'thanhbinh', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '008231', -- Id - char(9)
          'kcuong', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )


INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002765', -- Id - char(9)
          'cuongpham', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002919', -- Id - char(9)
          'chauvtn', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )
SELECT * FROM dbo.Student

--Insert for Student

INSERT INTO dbo.Student
VALUES  ( '1813365' , -- Id - char(9)
          N'Nguyễn Hoàng Nhật' , -- Fullname - nvarchar(50)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-08-12'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1811568' , -- Id - char(9)
          N'Lê Đỗ Thanh Bình' , -- Fullname - nvarchar(50)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-10-19'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1811640' , -- Id - char(9)
          N'Nguyễn Đăng Cương' , -- Fullname - nvarchar(50)
          N'Quảng Nam' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-05-16'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1810880' , -- Id - char(9)
          N'Trương Việt Dũng' , -- Fullname - nvarchar(50)
          N'Quảng Trị' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-05-22'  -- Birthdate - date
        )


INSERT INTO dbo.Student
VALUES  ( '1810867' , -- Id - char(9)
          N'Nguyễn Đỗ Quốc Duy' , -- Fullname - nvarchar(50)
          N'Huế' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-09-25'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1810887' , -- Id - char(9)
          N'Lê Trung Đan' , -- Fullname - nvarchar(50)
          N'Bình Định' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-12-31'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1810173' , -- Id - char(9)
          N'Nguyễn Gia Huy' , -- Fullname - nvarchar(50)
          N'Gia Lai' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-07-02'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1810198' , -- Id - char(9)
          N'Tô Duy Hưng' , -- Fullname - nvarchar(50)
          N'Phú Yên' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-06-16'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1812535' , -- Id - char(9)
          N'Hoàng Gia Khang' , -- Fullname - nvarchar(50)
          N'Phú Yên' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '1998-10-05'  -- Birthdate - date
        )

INSERT INTO dbo.Student
VALUES  ( '1810235' , -- Id - char(9)
          N'Nguyễn Khiêm' , -- Fullname - nvarchar(50)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          'M' , -- Gender - char(1)
          '2000-02-19'  -- Birthdate - date
        )

SELECT * FROM dbo.Student

-- Add foreign key for Group_id in TABLE Teacher reference to id in TABLE GROUP
ALTER TABLE dbo.Teacher ADD CONSTRAINT fk_id_teacher_group_id_group FOREIGN KEY(Group_id) REFERENCES dbo.[Group](Id)


--Insert for  Group

INSERT INTO dbo.[Group]
        ( Id, Name, Date )
VALUES  ( 1, -- Id - int
          N'Toán học', -- Name - nvarchar(20)
          '1950-03-07'  -- Date - date

INSERT INTO dbo.[Group]
        ( Id, Name, Date )
VALUES  ( 2, -- Id - int
          N'Vật lý', -- Name - nvarchar(20)
          '1951-09-18'  -- Date - date
          )

INSERT INTO dbo.[Group]
        ( Id, Name, Date )
VALUES  ( 3, -- Id - int
          N'Hóa học', -- Name - nvarchar(20)
          '1954-01-11'  -- Date - date
          )

INSERT INTO dbo.[Group]
        ( Id, Name, Date )
VALUES  ( 4, -- Id - int
          N'Sinh học', -- Name - nvarchar(20)
          '1960-03-19'  -- Date - date
          )

SELECT * FROM dbo.[Group]

-- Insert for Teacher
SELECT * FROM dbo.Teacher

INSERT INTO dbo.Teacher
VALUES  ( '000529' , -- Id - char(9)
          N'Dương Tuấn Anh' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'dtanh@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000000' , -- Phonenumber - char(11)
          '000000000000' , -- Identitycardnumber - varchar(12)
          '1990-7-12' , -- Birthdate - date
          1  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '002603' , -- Id - char(9)
          N'Phạm Hoàng Anh' , -- Fullname - nvarchar(50)
          'F' , -- Gender - char(1)
          'anhpham@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000001' , -- Phonenumber - char(11)
          '000000000001' , -- Identitycardnumber - varchar(12)
          '1991-5-19' , -- Birthdate - date
          1  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '008395' , -- Id - char(9)
          N'La Huệ Anh' , -- Fullname - nvarchar(50)
          'F' , -- Gender - char(1)
          'hueanh@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000002' , -- Phonenumber - char(11)
          '000000000002' , -- Identitycardnumber - varchar(12)
          '1994-01-01' , -- Birthdate - date
          1  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '002883' , -- Id - char(9)
          N'Trương Tuấn Anh' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'anhtt@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000003' , -- Phonenumber - char(11)
          '000000000003' , -- Identitycardnumber - varchar(12)
          '1989-05-19' , -- Birthdate - date
          2  -- Group_id - int
        )


INSERT INTO dbo.Teacher
VALUES  ( '003778' , -- Id - char(9)
          N'Trần Tuấn Anh' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'trtanh@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000004' , -- Phonenumber - char(11)
          '000000000004' , -- Identitycardnumber - varchar(12)
          '1989-05-25' , -- Birthdate - date
          3  -- Group_id - int
        )


INSERT INTO dbo.Teacher
VALUES  ( '002920' , -- Id - char(9)
          N'Nguyễn Thanh Bình' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'ntbinh@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000005' , -- Phonenumber - char(11)
          '000000000005' , -- Identitycardnumber - varchar(12)
          '1989-05-25' , -- Birthdate - date
          3  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '003711' , -- Id - char(9)
          N'Trần Thanh Bình' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'thanhbinh@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000006' , -- Phonenumber - char(11)
          '000000000006' , -- Identitycardnumber - varchar(12)
          '1989-05-25' , -- Birthdate - date
          3  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '008231' , -- Id - char(9)
          N'Nguyễn Thị Kim Cương' , -- Fullname - nvarchar(50)
          'F' , -- Gender - char(1)
          'kcuong@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000009' , -- Phonenumber - char(11)
          '000000000009' , -- Identitycardnumber - varchar(12)
          '1980-05-26' , -- Birthdate - date
          4  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '002765' , -- Id - char(9)
          N'Phạm Quốc Cường' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'kcuong@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000007' , -- Phonenumber - char(11)
          '000000000007' , -- Identitycardnumber - varchar(12)
          '1980-05-26' , -- Birthdate - date
          4  -- Group_id - int
        )

INSERT INTO dbo.Teacher
VALUES  ( '002919' , -- Id - char(9)
          N'Võ Thị Ngọc Châu' , -- Fullname - nvarchar(50)
          'M' , -- Gender - char(1)
          'chauvtn@gmail.com' , -- Email - varchar(20)
          N'Hồ Chí Minh' , -- Address - nvarchar(100)
          '0000000008' , -- Phonenumber - char(11)
          '000000000008' , -- Identitycardnumber - varchar(12)
          '1980-05-26' , -- Birthdate - date
          4  -- Group_id - int
        )


SELECT * FROM dbo.Teacher


--Insert for GroupLeader

INSERT INTO dbo.GroupLeader
        ( Id_leader, start_date, Id_group )
VALUES  ( '002603', -- Id_leader - char(9)
          '2015-07-08', -- start_date - date
          1  -- Id_group - int
          )

INSERT INTO dbo.GroupLeader
        ( Id_leader, start_date, Id_group )
VALUES  ( '002883', -- Id_leader - char(9)
          '2016-07-09', -- start_date - date
          2  -- Id_group - int
          )

INSERT INTO dbo.GroupLeader
        ( Id_leader, start_date, Id_group )
VALUES  ( '008231', -- Id_leader - char(9)
          '2018-06-09', -- start_date - date
          4  -- Id_group - int
          )

INSERT INTO dbo.GroupLeader
        ( Id_leader, start_date, Id_group )
VALUES  ( '003778      ', -- Id_leader - char(9)
          '2018-05-09', -- start_date - date
          3  -- Id_group - int
          )

SELECT * FROM dbo.[User]

-- Insert for Subject

INSERT INTO dbo.Subject
VALUES  ( 'T10HH' , -- Id - char(6)
          N'Hình học 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Toán học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          1  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'T10DS' , -- Id - char(6)
          N'Đại số 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Toán học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          1  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'T10GT' , -- Id - char(6)
          N'Giải tích 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Toán học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          1  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'L10CH' , -- Id - char(6)
          N'Cơ học 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Vật lý 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          2  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'L10NH' , -- Id - char(6)
          N'Nhiệt học 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Vật lý 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          2  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'L10QH' , -- Id - char(6)
          N'Quang học 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Vật lý 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          2  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'H10VC' , -- Id - char(6)
          N'Hóa vô cơ 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Hóa học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          3  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'H10HC' , -- Id - char(6)
          N'Hóa hữu cơ 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Hóa học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          3  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'S10TB' , -- Id - char(6)
          N'Sinh học tế bào 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Sinh học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          4  -- Id_group - int
        )

INSERT INTO dbo.Subject
VALUES  ( 'S10VSV' , -- Id - char(6)
          N'Sinh học vi sinh vật 10' , -- name - nvarchar(30)
          3 , -- num_periods - int
          N'Sinh học 10' , -- syllabus - nvarchar(50)
          20 , -- ratio_score_15 - int
          30 , -- ratio_score_45 - int
          50 , -- ratio_score_final - int
          4  -- Id_group - int
        )


SELECT * FROM dbo.Subject

-- Insert for Teacher_Subject

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '000529', -- Id_teacher - char(9)
          'T10GT'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '000529', -- Id_teacher - char(9)
          'T10DS'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '002603', -- Id_teacher - char(9)
          'T10HH'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '002765', -- Id_teacher - char(9)
          'S10VSV'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '002883', -- Id_teacher - char(9)
          'L10CH'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '002919', -- Id_teacher - char(9)
          'S10TB'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '002920', -- Id_teacher - char(9)
          'H10VC'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '003711', -- Id_teacher - char(9)
          'H10VC'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '003778', -- Id_teacher - char(9)
          'H10HC'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '008231', -- Id_teacher - char(9)
          'S10VSV'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '008395', -- Id_teacher - char(9)
          'T10GT'  -- Id_subject - char(6)
          )

INSERT INTO dbo.Teacher_Subject
        ( Id_teacher, Id_subject )
VALUES  ( '008395', -- Id_teacher - char(9)
          'T10HH'  -- Id_subject - char(6)
          )
SELECT * FROM dbo.Teacher_Subject

-- Insert for Year

INSERT INTO dbo.Year
        ( Id, name )
VALUES  ( '2020', -- Id - char(10)
          'Năm 2020'  -- name - varchar(15)
          )

INSERT INTO dbo.Year
        ( Id, name )
VALUES  ( '2019', -- Id - char(10)
          'Năm 2019'  -- name - varchar(15)
          )

--Insert for Semester

INSERT INTO dbo.Semester
VALUES  ( '2019' , -- Id_Year - char(10)
          'HKI' , -- Id_Semester - char(5)
          'HK I' , -- name - varchar(15)
          '2018-08-10' , -- start_date - date
          '2019-01-10'  -- end_date - date
        )

INSERT INTO dbo.Semester
VALUES  ( '2019' , -- Id_Year - char(10)
          'HKII' , -- Id_Semester - char(5)
          'HK II' , -- name - varchar(15)
          '2019-02-10' , -- start_date - date
          '2019-06-20'  -- end_date - date
        )

INSERT INTO dbo.Semester
VALUES  ( '2020' , -- Id_Year - char(10)
          'HKI' , -- Id_Semester - char(5)
          'HK I' , -- name - varchar(15)
          '2019-08-10' , -- start_date - date
          '2020-01-10'  -- end_date - date
        )

INSERT INTO dbo.Semester
VALUES  ( '2020' , -- Id_Year - char(10)
          'HKII' , -- Id_Semester - char(5)
          'HK II' , -- name - varchar(15)
          '2020-02-10' , -- start_date - date
          '2020-06-20'  -- end_date - date
        )

-- Note: Nên sửa name thành nvarchar

SELECT * FROM dbo.Semester

--Insert for Building
INSERT INTO dbo.Building
        ( Id, name, start_date )
VALUES  ( 'H1', -- Id - char(4)
          N'Dãy H1', -- name - nvarchar(20)
          '1950-07-08'  -- start_date - date
          )

INSERT INTO dbo.Building
        ( Id, name, start_date )
VALUES  ( 'H2', -- Id - char(4)
          N'Dãy H2', -- name - nvarchar(20)
          '1950-07-08'  -- start_date - date
          )

INSERT INTO dbo.Building
        ( Id, name, start_date )
VALUES  ( 'H3', -- Id - char(4)
          N'Dãy H3', -- name - nvarchar(20)
          '1955-03-08'  -- start_date - date
          )

--Insert for Room
INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          N'Phòng 01 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '02' , -- Id_room - char(6)
          N'Phòng 02 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          N'Phòng 03 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          N'Phòng 04 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )

--- Bổ sung
INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          N'Phòng 01 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '02' , -- Id_room - char(6)
          N'Phòng 02 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          N'Phòng 03 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H2' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          N'Phòng 04 H2' , -- name - nvarchar(20)
          40  -- capacity - int
        )

-----
INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          N'Phòng 01 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '02' , -- Id_room - char(6)
          N'Phòng 02 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          N'Phòng 03 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

INSERT INTO dbo.Room
VALUES  ( 'H3' , -- Id_building - char(4)
          '04' , -- Id_room - char(6)
          N'Phòng 04 H3' , -- name - nvarchar(20)
          40  -- capacity - int
        )

--- End

INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '05' , -- Id_room - char(6)
          N'Phòng 05 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )
INSERT INTO dbo.Room
VALUES  ( 'H1' , -- Id_building - char(4)
          '06' , -- Id_room - char(6)
          N'Phòng 06 H1' , -- name - nvarchar(20)
          40  -- capacity - int
        )
SELECT * FROM dbo.Room
--Insert for Class
INSERT INTO dbo.Class
VALUES  ( '10T1_2019' , -- Id - char(9)
          N'10 Toán 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          '1810173' , -- Id_monitor - char(9)
          '000529'  -- Id_form_teacher - char(9)
        )

INSERT INTO dbo.Class
VALUES  ( '10L1_2019' , -- Id - char(9)
          N'10 Lý 1' , -- name - nvarchar(20)
          '2019' , -- Id_Year - char(10)
          'H1' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          '1810887' , -- Id_monitor - char(9)
          '002603'  -- Id_form_teacher - char(9)
        )


INSERT INTO dbo.Class
VALUES  ( '11T1_2020' , -- Id - char(9)
          N'11 Toán 1' , -- name - nvarchar(20)
          '2020' , -- Id_Year - char(10)
          'H2' , -- Id_building - char(4)
          '01' , -- Id_room - char(6)
          '1810173' , -- Id_monitor - char(9)
          '000529'  -- Id_form_teacher - char(9)
        )

INSERT INTO dbo.Class
VALUES  ( '11L1_2020' , -- Id - char(9)
          N'11 Lý 1' , -- name - nvarchar(20)
          '2020' , -- Id_Year - char(10)
          'H2' , -- Id_building - char(4)
          '03' , -- Id_room - char(6)
          '1810887' , -- Id_monitor - char(9)
          '002603'  -- Id_form_teacher - char(9)
        )

--Insert for Join_Class
insert INTO dbo.Join_Class
VALUES  ( '10T1_2019' , -- Id_class - char(9)
          '1810173' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10T1_2019' , -- Id_class - char(9)
          '1810198' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10T1_2019' , -- Id_class - char(9)
          '1810235' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10T1_2019' , -- Id_class - char(9)
          '1810867' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10T1_2019' , -- Id_class - char(9)
          '1810880' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )

---
insert INTO dbo.Join_Class
VALUES  ( '11T1_2020' , -- Id_class - char(9)
          '1810173' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11T1_2020' , -- Id_class - char(9)
          '1810198' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11T1_2020' , -- Id_class - char(9)
          '1810235' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11T1_2020' , -- Id_class - char(9)
          '1810867' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11T1_2020' , -- Id_class - char(9)
          '1810880' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )

---
insert INTO dbo.Join_Class
VALUES  ( '10L1_2019' , -- Id_class - char(9)
          '1810887' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10L1_2019' , -- Id_class - char(9)
          '1811568' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10L1_2019' , -- Id_class - char(9)
          '1811640' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10L1_2019' , -- Id_class - char(9)
          '1812535' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '10L1_2019' , -- Id_class - char(9)
          '1813365' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
---
insert INTO dbo.Join_Class
VALUES  ( '11L1_2020' , -- Id_class - char(9)
          '1810887' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11L1_2020' , -- Id_class - char(9)
          '1811568' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11L1_2020' , -- Id_class - char(9)
          '1811640' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11L1_2020' , -- Id_class - char(9)
          '1812535' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
insert INTO dbo.Join_Class
VALUES  ( '11L1_2020' , -- Id_class - char(9)
          '1813365' , -- Id_student - char(9)
          N'' , -- conduct - nvarchar(10)
          N''  -- title - nvarchar(15)
        )
---
SELECT * FROM dbo.Student
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Join_Class
SELECT * FROM dbo.Year
SELECT * FROM dbo.Semester
SELECT * FROM dbo.Room
SELECT * FROM dbo.Class

--Insert for Dependents
INSERT dbo.Dependents
(
    Id_student,
    Fullname,
    Address,
    Phonenumber,
    Relationship
)
VALUES
(   '1810173',  -- Id_student - varchar(9)
    N'Nguyễn Thị Vân Anh',  -- Fullname - varchar(50)
    N'Gia Lai', -- Address - nvarchar(100)
    '0111111111',  -- Phonenumber - char(11)
    N'Cô ruột'  -- Relationship - nvarchar(20)
),
(
	'1810198',
	N'Lê Văn Bảo',
	N'Phú Yên',
	'02222222222',
	N'Bác'
),
(
	'1810235',
	N'Nguyễn Thanh Tuấn',
	N'Hồ Chí Minh',
	'0333333333',
	N'Ba'
),
(
	'1810867',
	N'Nguyễn Quốc Cường',
	N'Huế',
	'04444444444',
	N'Ba'
),
(
	'1810880',
	N'Nguyễn Thị Thanh Ngân',
	N'Quảng Trị',
	'0555555555',
	N'Mẹ'
),
(
	'1810887',
	N'Lê Văn Hiếu',
	N'Bình Định',
	'06666666666',
	N'Chú ruột'
),
(
	'1811640',
	N'Nguyễn Việt Cường',
	N'Quảng Nam',
	'07777777777',
	N'Ba'
),
(
	'1812535',
	N'Hoàng Ngọc Tường',
	N'Phú Yên',
	'0888888888',
	N'Ba'
),
(
	'1813365',
	N'Nguyễn Thùy Dương',
	N'Hồ Chí Minh',
	'0999999999',
	N'Mẹ'
),
(   '1810173',  -- Id_student - varchar(9)
    N'Nguyễn Phương Nam',  -- Fullname - varchar(50)
    N'Gia Lai', -- Address - nvarchar(100)
    '0101111111',  -- Phonenumber - char(11)
    N'Bác ruột'  -- Relationship - nvarchar(20)
), 
(
	'1813365',
	N'Nguyễn Hữu Hòa',
	N'Hồ Chí Minh',
	'0929999999',
	N'Ba'
),
(
	'1810880',
	N'Trương Tuấn Khang',
	N'Quảng Trị',
	'0555555555',
	N'Anh ruột'
),
(
	'1810887',
	N'Tô Thị Mỹ',
	N'Bình Định',
	'06666666666',
	N'Chị ruột'
)