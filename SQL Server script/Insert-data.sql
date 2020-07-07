USE HighSchoolDB
GO



--Insert for User
INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1813365', -- Id - char(9)
          'nhat.nguyen1208', -- Username - varchar(20)
          '1234456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811568', -- Id - char(9)
          'binh.le2569', -- Username - varchar(20)
          '1234256', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811640', -- Id - char(9)
          'cuong.nguyen1605', -- Username - varchar(20)
          '1234156', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1811640', -- Id - char(9)
          'cuong.nguyen1605', -- Username - varchar(20)
          '123we456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810880', -- Id - char(9)
          'dung.truong2000', -- Username - varchar(20)
          '12345q6', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810867', -- Id - char(9)
          'duy.nguyenbkcs', -- Username - varchar(20)
          '123f456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810s887', -- Id - char(9)
          'dan.le.1231', -- Username - varchar(20)
          '123456', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810173', -- Id - char(9)
          'huy.nguyen_gh2k', -- Username - varchar(20)
          '1234a56', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1810198', -- Id - char(9)
          'hung.toduy', -- Username - varchar(20)
          '12345v6', -- Password - varchar(20)
          'HS'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '1812535', -- Id - char(9)
          'khang.hoang1998', -- Username - varchar(20)
          '12345z6', -- Password - varchar(20)
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
          '12345 6', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002603', -- Id - char(9)
          'anhpham', -- Username - varchar(20)
          '1234xc56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )
INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '008395', -- Id - char(9)
          'hueanh', -- Username - varchar(20)
          '1234as56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002883', -- Id - char(9)
          'anhtt', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '003778', -- Id - char(9)
          'trtanh', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002920', -- Id - char(9)
          'ntbinh', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '003711', -- Id - char(9)
          'thanhbinh', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '008231', -- Id - char(9)
          'kcuong', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )


INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002765', -- Id - char(9)
          'cuongpham', -- Username - varchar(20)
          '1234hj56', -- Password - varchar(20)
          'GV'  -- Permission - varchar(6)
          )

INSERT INTO dbo.[User]
        ( Id, Username, Password, Permission )
VALUES  ( '002919', -- Id - char(9)
          'chauvtn', -- Username - varchar(20)
          '12sd3456', -- Password - varchar(20)
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
        )

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

