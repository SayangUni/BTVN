create database QLSV
go
use QLSV
go
create table LOP
(
MALOP nvarchar(20),
TENLOP nvarchar(15),
sISO int not null,
constraint PK_LOP primary key(MALOP)
)

create table SINHVIEN
(
MASV nvarchar(20),
HOTEN nvarchar(50),
NGAYSINH datetime,
MALOP nvarchar(20),
constraint PK_SINHVIEN primary key(MASV)
)

create table MONHOC
(
MAMONHOC nvarchar(20),
TENMONHOC nvarchar(50),
constraint PK_MONHOC primary key(MAMONHOC)
)

create table KETQUA
(
MASV nvarchar(20),
MAMONHOC nvarchar(20),
DIEMTHI int,
constraint PK_KETQUA primary key (MASV, MAMONHOC)
)

GO
ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT
FKsinhvien FOREIGN KEY(MALOP) REFERENCES dbo.LOP(MALOP) 
GO
ALTER TABLE dbo.KETQUA ADD CONSTRAINT
FKketqua FOREIGN KEY(MAMONHOC) REFERENCES dbo.MONHOC(MAMONHOC) 

insert into LOP values ('B001', 'CNTT3', 31)
insert into LOP values ('B002', 'CNTT4', 31)
insert into SINHVIEN values ('A001', N'Phạm Minh Tuấn', '11-01-2002', 'B001')
insert into SINHVIEN values ('A002', N'Nguyễn Mạnh Hùng Vĩ', '11-10-2002', 'B002')
insert into SINHVIEN values ('A003', N'Nguyễn Ngọc Tú', '1-01-2002', 'B002')
insert into SINHVIEN values ('A004', N'Long Cẩm Tú', '2-04-2000', 'B001')
insert into MONHOC values ('C001', 'HQTCSDL')
insert into MONHOC values ('C002', 'CSDLNC')
insert into KETQUA values ('A001', 'C001', 7)
insert into KETQUA values ('A002', 'C002', 5
insert into KETQUA values ('A003', 'C001', 9)
insert into KETQUA values ('A004', 'C002', 8)
