create database QLBH
go
use QLBH
go
create table KHACHHANG
(
MAKH char(4) not null,
HOTEN varchar(40) not null,
DCHI varchar(50) not null,
SODT varchar(20) not null,
NGSINH smalldatetime not null,
NGDK smalldatetime not null,
DOANHSO money not null,
CONSTRAINT pk_KHACHHANG PRIMARY KEY(MAKH)
)

create table NHANVIEN
(
MANV char(4) not null,
HOTEN varchar(40) not null,
SODT varchar(20) not null,
NGVL smalldatetime not null,
CONSTRAINT pk_NHANVIEN PRIMARY KEY(MANV)
)

create table SANPHAM
(
MASP char(4) not null,
TENSP varchar(40) not null,
DVT varchar(20) not null,
NUOCSX varchar(40) not null,
GIA money not null,
CONSTRAINT pk_SANPHAM PRIMARY KEY(MASP)
)

create table HOADON
(
SOHD int not null,
NGHD smalldatetime not null,
MAKH char(4) not null,
MANV char (4) not null,
TRIGIA money not null,
CONSTRAINT pk_HOADON PRIMARY KEY(SOHD)
)

create table CTHD
(
SOHD int not null,
MASP char(4) not null,
SL int not null,
CONSTRAINT pk_CTHD PRIMARY KEY(SOHD,MASP)
)
GO
ALTER TABLE dbo.HOADON ADD CONSTRAINT
	FK_HOADON_KHACHHANG FOREIGN KEY(MAKH) REFERENCES dbo.KHACHHANG(MAKH) 
	 	
GO
ALTER TABLE dbo.HOADON ADD CONSTRAINT
	FK_HOADON_NHANVIEN FOREIGN KEY(MANV) REFERENCES dbo.NHANVIEN(MANV)

GO
ALTER TABLE dbo.CTHD ADD CONSTRAINT
	FK_CTHD_HOADON FOREIGN KEY(SOHD) REFERENCES dbo.HOADON(SOHD) 
	
GO
ALTER TABLE dbo.CTHD ADD CONSTRAINT
	FK_CTHD_SANPHAM FOREIGN KEY(MASP) REFERENCES dbo.SANPHAM(MASP)
