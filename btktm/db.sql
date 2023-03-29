USE master
GO

 DROP DATABASE QLTV
GO
CREATE DATABASE QLTV
GO
USE QLTV
GO

CREATE TABLE NhanVien(
MaNV VARCHAR(10) PRIMARY KEY,
TenNV NVARCHAR(80) NOT NULL,
ChucVu BIT DEFAULT 0,
Email VARCHAR(60) NOT NULL,
TaiKhoan VARCHAR(50) NOT NULL UNIQUE,
MatKhau VARCHAR(32) NOT NULL,
)
GO

CREATE TABLE ChuDe(
MaCD INT IDENTITY(1,1) PRIMARY KEY,
TenCD NVARCHAR(80) UNIQUE NOT NULL,
)
GO

CREATE TABLE NhaXuatBan(
MaNXB INT IDENTITY(1,1) PRIMARY KEY,
TenNXB NVARCHAR(80) UNIQUE NOT NULL,
SDT VARCHAR(15) NOT NULL,
DiaChi NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE TacGia(
MaTG INT IDENTITY(1,1) PRIMARY KEY,
TenTG NVARCHAR(80) NOT NULL,
GioiTinh BIT DEFAULT 0,
NgaySinh DATE NOT NULL,
)
GO

CREATE TABLE Sach(
MaSach INT IDENTITY(1,1) PRIMARY KEY,
TieuDe NVARCHAR(80) NOT NULL,
TacGia VARCHAR(80) NOT NULL ,
MaNXB INT NOT NULL FOREIGN KEY REFERENCES NhaXuatBan(MaNXB),
NamXB INT NOT NULL,
MaCD INT NOT NULL FOREIGN KEY REFERENCES ChuDe(MaCD),
NgonNgu NVARCHAR(40) NOT NULL,
SoTrang INT NOT NULL,
SoLuong INT NOT NULL,
GiaTien INT NOT NULL,
)
GO

CREATE TABLE DocGia(
TheDG INT IDENTITY(1,1) PRIMARY KEY,
TenDG NVARCHAR(70) NOT NULL,
)

GO

 CREATE TABLE PhieuMuon(
 MaPM INT PRIMARY KEY,
 TheDG INT NOT NULL FOREIGN KEY REFERENCES dbo.DocGia(TheDG),
 NgayMuon DATE  DEFAULT GETDATE(),
 NgayHen DATE NOT NULL,
 MaNV VARCHAR(10) FOREIGN KEY REFERENCES dbo.NhanVien(MaNV),
 NgayTra DATE NULL,
 )

GO

CREATE TABLE PMCT(
MaPM INT NOT NULL,
MaSach INT NOT NULL,
TrangThai BIT DEFAULT 0,
PRIMARY KEY (MaPM,MaSach),
	CONSTRAINT FK_MaPM FOREIGN KEY (MaPM) REFERENCES PhieuMuon(MaPM),
	CONSTRAINT FK_MaSach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
)
GO

SET IDENTITY_INSERT [dbo].[TacGia] OFF

GO

INSERT INTO [dbo].[TacGia] VALUES(N'Phan Ý yên',0,'8-21-1992')
INSERT INTO [dbo].[TacGia] VALUES(N'Hà Thủy Nguyên',0,'10-10-1988')
INSERT INTO [dbo].[TacGia] VALUES(N'Triệu Yến Quỳnh',0,'3-7-1995')
INSERT INTO [dbo].[TacGia] VALUES(N'Mai Tuệ Vân',1,'1-10-1978')
INSERT INTO [dbo].[TacGia] VALUES(N'Lê Ái',0,'2-6-1994')
INSERT INTO [dbo].[TacGia] VALUES(N'Minh Hùng',1,'4-9-1990')
INSERT INTO [dbo].[TacGia] VALUES(N'Minh Anh',1,'2-5-1983')
INSERT INTO [dbo].[TacGia] VALUES(N'Lục Nguyên',1,'8-11-1988')
INSERT INTO [dbo].[TacGia] VALUES(N'Nguyễn Nhật Ánh',0,'9-3-1976')
INSERT INTO [dbo].[TacGia] VALUES(N'Trang Hạ',0,'2-4-1980')
INSERT INTO [dbo].[TacGia] VALUES(N'nguyễn Phong Việt',1,'5-13-1989')
INSERT INTO [dbo].[TacGia] VALUES(N'Anh Khang',1,'10-15-1991')
INSERT INTO [dbo].[TacGia] VALUES(N'Sơn Paris',1,'5-17-1987')
INSERT INTO [dbo].[TacGia] VALUES(N'Gào',0,'3-10-1982')
INSERT INTO [dbo].[TacGia] VALUES(N'nguyễn Ngọc Thạch',1,'2-26-1981')
INSERT INTO [dbo].[TacGia] VALUES(N'Đỗ Nhật Nam',1,'4-16-1996')
INSERT INTO [dbo].[TacGia] VALUES(N'Hamlet Trương',1,'12-25-1979')
INSERT INTO [dbo].[TacGia] VALUES(N'Iris Cao',0,'8-19-1989')
INSERT INTO [dbo].[TacGia] VALUES(N'Du Phong',1,'9-13-1992')
INSERT INTO [dbo].[TacGia] VALUES(N'Minh Mẫn',0,'5-4-1990')
INSERT INTO [dbo].[TacGia] VALUES(N'Tuệ Nghi',1,'9-14-1993')
INSERT INTO [dbo].[TacGia] VALUES(N'Đồng Hoa',0,'9-22-1978')
INSERT INTO [dbo].[TacGia] VALUES(N'Cố Mạn',0,'12-24-1976')
INSERT INTO [dbo].[TacGia] VALUES(N'Kawi Hồng Phương',0,'5-23-1989')
INSERT INTO [dbo].[TacGia] VALUES(N'Born',1,'10-5-1994')
INSERT INTO [dbo].[TacGia] VALUES(N'Bình Nguyên Lộc',1,'5-27-1967')
INSERT INTO [dbo].[TacGia] VALUES(N'Hữu Mai',0,'3-19-1962')
INSERT INTO [dbo].[TacGia] VALUES(N'Nguyễn Xuân Hoàng',1,'2-15-1980')
INSERT INTO [dbo].[TacGia] VALUES(N'Lê Dư',1,'9-26-1765')
INSERT INTO [dbo].[TacGia] VALUES(N'Lê Văn Trương',1,'12-1-1969')
INSERT INTO [dbo].[TacGia] VALUES(N'Phan Nhật Nam',1,'8-29-1961')
INSERT INTO [dbo].[TacGia] VALUES(N'Phạm Công Thiện',1,'1-23-1956')
INSERT INTO [dbo].[TacGia] VALUES(N'Nhật Tiến',1,'9-24-1967')
INSERT INTO [dbo].[TacGia] VALUES(N'Tôn Quang Phiệt',1,'2-24-1954')
INSERT INTO TacGia  VALUES (N'Benjamin Zander',1,'2/09/1988')
INSERT INTO TacGia  VALUES (N'Bennie Bough',1,'11/22/1994')
INSERT INTO TacGia  VALUES (N'Carol Kline',0,'12/19/1996')
INSERT INTO TacGia  VALUES (N'Daniel Shpiro',1,'1/29/1999')
INSERT INTO TacGia  VALUES (N'David Heinemeier Hansson',1,'12/03/1987')
INSERT INTO TacGia  VALUES (N'Diane V. Cirinclone',1,'12/19/1988')
INSERT INTO TacGia  VALUES (N'Fernando Trias De Bes',1,'2/19/1989')
INSERT INTO TacGia  VALUES (N'Gale Muller',1,'2/9/1979')
INSERT INTO TacGia  VALUES (N'Greg Hicks',1,'12/8/1991')
INSERT INTO TacGia  VALUES (N'Hạ Dịch Ân',0,'5/06/1978')
INSERT INTO TacGia  VALUES (N'Harvey McKinnon',1,'2/2/1992')
INSERT INTO TacGia  VALUES (N'Hoàng Minh dịch',1,'5/09/1994')
INSERT INTO TacGia  VALUES (N'Jasminka Petrovic',1,'1/09/1984')
INSERT INTO TacGia  VALUES (N'Jim Harter',1,'1/03/1980')
INSERT INTO TacGia  VALUES (N'Kent Healy',1,'5/29/1993')
INSERT INTO TacGia  VALUES (N'Linda Francis',1,'7/29/1991')
INSERT INTO TacGia  VALUES (N'Lothar J. Seiwert',1,'1/19/1986')
INSERT INTO TacGia  VALUES (N'Mark Victor Hansen',1,'8/03/1985')
INSERT INTO TacGia  VALUES (N'Nguyễn Duy Cần',1,'9/19/1988')
INSERT INTO TacGia  VALUES (N'Paustovsky',1,'2/3/1992')
INSERT INTO TacGia  VALUES (N'Phùng Chấn Dực',1,'6/2/1978')
INSERT INTO TacGia  VALUES (N'S. Truett Cathy',1,'2/15/1978')
INSERT INTO TacGia  VALUES (N'Steve Rivkin',1,'02/19/1983')
INSERT INTO TacGia  VALUES (N'Trương Thị Lan Anh',0,'2/04/1990')
INSERT INTO TacGia  VALUES (N'Ubee Hoàng',1,'5/11/1984')
INSERT INTO TacGia  VALUES (N'Werner Tiki Kustenmacher',1,'11/07/1981')
INSERT INTO TacGia  VALUES (N'Wilhelm Grimm',1,'10/29/1978')
INSERT INTO TacGia  VALUES (N'Ajahn Brahm',1,'5/27/1991')
INSERT INTO TacGia  VALUES (N'Alex Rovira',1,'2/20/1994')
INSERT INTO TacGia  VALUES (N'Alexander Grin',1,'2/1/1993')
INSERT INTO TacGia  VALUES (N'Alexandre Dumas',1,'6/16/1996')
INSERT INTO TacGia  VALUES (N'Anh Đức',1,'4/19/1997')
INSERT INTO TacGia  VALUES (N'Azim Jamal',1,'2/12/1978')
INSERT INTO TacGia  VALUES (N'Ben Renshaw',1,'3/6/1979')
INSERT INTO TacGia  VALUES (N'Boris Pasternak',1,'3/16/1985')
INSERT INTO TacGia  VALUES (N'Carol Kinsey Goman',1,'2/11/1984')
INSERT INTO TacGia  VALUES (N'Cecelia Ahern',1,'12/09/1967')
INSERT INTO TacGia  VALUES (N'Charles Dickens',1,'6/04/1985')
INSERT INTO TacGia  VALUES (N'Dale Carnegie',1,'4/07/1972')
INSERT INTO TacGia  VALUES (N'Đặng Huỳnh Mai Anh',0,'2/01/1970')
INSERT INTO TacGia  VALUES (N'Daniel Defoe',1,'2/08/1982')
INSERT INTO TacGia  VALUES (N'Daniel Gottlieb',1,'1/03/1972')
INSERT INTO TacGia  VALUES (N'David Niven',1,'2/18/1994')
INSERT INTO TacGia  VALUES (N'Dick Lyles',1,'12/20/1973')
INSERT INTO TacGia  VALUES (N'Đoàn Giỏi',1,'2/5/1993')

GO

SET IDENTITY_INSERT [dbo].[ChuDe] OFF
GO
 
INSERT INTO ChuDe  VALUES (N'Phổ Thông')
INSERT INTO ChuDe  VALUES (N'Giáo Trình')
INSERT INTO ChuDe  VALUES (N'Học Tập')
INSERT INTO ChuDe  VALUES (N'Tham Khảo')
INSERT INTO ChuDe  VALUES (N'Bổ Trợ')
INSERT INTO ChuDe  VALUES (N'Giải Trí')
INSERT INTO ChuDe  VALUES (N'Công Nghệ Thông Tin')
INSERT INTO ChuDe  VALUES (N'Đồ Họa')
INSERT INTO ChuDe  VALUES (N'Lập Trình')
INSERT INTO ChuDe  VALUES (N'Khách Sạn Du Lịch')
INSERT INTO ChuDe  VALUES (N'kinh Tế')
INSERT INTO ChuDe  VALUES (N'Ngoại Ngữ')
GO

SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF 
GO

INSERT INTO NhaXuatBan VALUES (N'Văn hóa','0912345678',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Văn nghệ','0912345679',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Thông tin truyền thông','0912345677',N'Thái Bình')
INSERT INTO NhaXuatBan VALUES (N'Lao động','0912345676',N'Sơn La')
INSERT INTO NhaXuatBan VALUES (N'Công thương','0912345675',N'Điện Biên')
INSERT INTO NhaXuatBan VALUES (N'Thanh niên','0912345674',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Tổng hợp TP.HCM','0912345673',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Tuổi trẻ','0912345672',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Phụ nữ','0912345671',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Tri thức','0912345670',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Thế giới','0912345661',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Kim đồng','0912345662',N'Hà Nội')
INSERT INTO NhaXuatBan VALUES (N'Hồng đức','0912345663',N'Hà Nội')
GO
INSERT INTO dbo.NhanVien
(MaNV,TenNV,ChucVu,Email,TaiKhoan,MatKhau)
VALUES
('NV01',  N'phạmm minh tuấn',  1, 'phamminhtuan475@gmail.com','tuan','1')



SET IDENTITY_INSERT [dbo].[Sach] OFF
GO

INSERT INTO Sach  VALUES (N'AQ Chỉ số vượt khó','1','1','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach  VALUES (N'Ai hiểu khách hàng người đó bán được hàng','2','2','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach  VALUES (N'Bài học vô giá từ những điều bình dị','3','3','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach  VALUES (N'Bí mật hành trình tình yêu','4','4','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach  VALUES (N'Bí mật ngôn ngữ cơ thể','5','5','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach  VALUES (N'Bí mật tình yêu Tập 1','7','6','2000','1',N'Tiếng Anh',600,250,300000)
INSERT INTO Sach VALUES (N'Nhật ký son môi', 2, 2, 2013, 1, N'Tiếng việt', 222, 150,120000)
INSERT INTO Sach VALUES (N'Giáo trình phương pháp học tốt', N'Tô Quang Phiệt', 1, 2012, 2, N'Tiếng việt', 244, 150,150000)
INSERT INTO Sach VALUES (N'Sách tham khảo nấu ăn', N'Nhật Tiến', 5, 2017, 4, N'Tiếng việt', 1022, 210,220000)
INSERT INTO Sach VALUES (N'Lập trình Java cơ bản', N'Lê Dư', 2, 2018, 7, N'Tiếng việt', 872, 330,196000)
INSERT INTO Sach VALUES (N'Học Toán siêu tốc', N'Nguyễn Xuân Hoàng', 4, 2003, 3, N'Tiếng việt', 152, 664,120000)
INSERT INTO Sach VALUES (N'Ôn tập môn Toán 12', N'Nguyễn Xuân Hoàng', 2, 2013, 3, N'Tiếng việt', 290, 50,160000)
INSERT INTO Sach VALUES (N'Toán lớp 12', N'Tô Quang Phiệt', 5, 2017, 1, N'Tiếng việt', 872, 321,320000)
INSERT INTO Sach VALUES (N'Lý lớp 12', N'Lê Dư', 5, 2017, 1, N'Tiếng việt', 122, 150,134500)
INSERT INTO Sach VALUES (N'Hóa lớp 12', N'Hữu Mai', 5, 2017, 1, N'Tiếng việt', 754, 230,254000)
INSERT INTO Sach VALUES (N'Văn lớp 12', N'Bình Nguyên Lộc', 5, 2017, 1, N'Tiếng việt', 264, 320,563000)
INSERT INTO Sach VALUES (N'Lập trình Java nâng cao', N'Hà Thủy Nguyên', 2, 2018, 9, N'Tiếng việt', 233, 50,220000)
INSERT INTO Sach VALUES (N'Thiết kế đồ họa cơ bản', N'Du Phong', 12, 2012, 8, N'Tiếng việt', 124, 650,215000)
INSERT INTO Sach VALUES (N'Thiết kế đồ họa nâng cao', N'Cố Mạn', 5, 2003, 8, N'Tiếng việt', 22, 110,160000)
INSERT INTO Sach VALUES (N'Cách làm giàu từ kinh doanh', N'Gào', 3, 2015, 11, N'Tiếng việt', 266, 150,120000)
INSERT INTO Sach VALUES (N'Lập trình SQL', N'Minh Mẫn', 7, 2013, 9, N'Tiếng việt', 265, 250,322000)
INSERT INTO Sach VALUES (N'Thiết kế đồ họa theo chủ đề', N'Đồng Hoa', 8, 2012, 1, N'Tiếng việt', 154, 140,190000)
INSERT INTO Sach VALUES (N'Ngôn ngữ Nga', N'Tuệ Nghi', 11, 2013, 12, N'Nga', 263, 112,266000)
INSERT INTO Sach VALUES (N'Bổ trợ kiến thức văn học', N'Lê Dư', 12, 2011, 5, N'Tiếng việt', 166, 230,175000)
INSERT INTO Sach VALUES (N'Ảnh hưởng của công nghệ thông tin', N'Lê Văn Trương', 3, 2019, 7, N'Tiếng việt', 166, 150,432000)
INSERT INTO Sach VALUES (N'Siêu lập trình Java', N'Đồng Hoa', 12, 2015, 9, N'Tiếng việt', 122, 320,532000)
INSERT INTO Sach VALUES (N'Giáo trình lớp 11', N'Lê Dư', 4, 2013, 2, N'Tiếng việt', 112, 50,120000)
INSERT INTO Sach VALUES (N'Toán lớp 12', N'Triệu yến Quỳnh', 4, 2013, 1, N'Tiếng việt', 552, 350,176000)
INSERT INTO Sach VALUES (N'Toán học lớp 6', N'Minh Anh', 2, 2013, 1, N'Tiếng việt', 4212, 150,190000)
INSERT INTO Sach VALUES (N'Lập trình C++', N'Minh Hùng', 1, 2013, 9, N'Tiếng việt', 400, 400,155000)
INSERT INTO Sach VALUES (N'Cách làm giàu', N'Lục Nguyên', 7, 2013, 11, N'Tiếng việt', 343, 170,390000)
INSERT INTO Sach VALUES (N'Bổ trợ kiến thức giao tiếp', N'Lê Ái', 8, 2013, 5, N'Tiếng Anh', 2122, 150,1520000)
INSERT INTO Sach VALUES (N'Học toán cùng công nghệ', N'Mai Tuệ Vân', 3, 2013, 1, N'Tiếng việt', 332, 12,210000)
INSERT INTO Sach VALUES (N'Văn học lớp 11', N'Anh Khang', 6, 2013, 1, N'Tiếng việt', 1262, 150,620000)
INSERT INTO Sach VALUES (N'Hóa học lớp 10', N'Nguyễn Phong Việt', 4, 2013, 1, N'Tiếng việt', 238, 321,156000)
INSERT INTO Sach VALUES (N'Sinh học lớp 8', N'Minh Anh', 2, 2013, 1, N'Tiếng việt', 234, 642,235000)

UPDATE [dbo].[Sach] SET TacGia=12 WHERE MaSach=1
UPDATE [dbo].[Sach] SET TacGia=23 WHERE MaSach=9
UPDATE [dbo].[Sach] SET TacGia=14 WHERE MaSach=10
UPDATE [dbo].[Sach] SET TacGia=24 WHERE MaSach=11
UPDATE [dbo].[Sach] SET TacGia=36 WHERE MaSach=12
UPDATE [dbo].[Sach] SET TacGia=15 WHERE MaSach=13
UPDATE [dbo].[Sach] SET TacGia=10 WHERE MaSach=14
UPDATE [dbo].[Sach] SET TacGia=18 WHERE MaSach=15
UPDATE [dbo].[Sach] SET TacGia=19 WHERE MaSach=16
UPDATE [dbo].[Sach] SET TacGia=40 WHERE MaSach=17
UPDATE [dbo].[Sach] SET TacGia=21 WHERE MaSach=18
UPDATE [dbo].[Sach] SET TacGia=15 WHERE MaSach=19
UPDATE [dbo].[Sach] SET TacGia=32 WHERE MaSach=20
UPDATE [dbo].[Sach] SET TacGia=15 WHERE MaSach=21
UPDATE [dbo].[Sach] SET TacGia=14 WHERE MaSach=22
UPDATE [dbo].[Sach] SET TacGia=18 WHERE MaSach=23
UPDATE [dbo].[Sach] SET TacGia=19 WHERE MaSach=24
UPDATE [dbo].[Sach] SET TacGia=26 WHERE MaSach=25
UPDATE [dbo].[Sach] SET TacGia=22 WHERE MaSach=26
UPDATE [dbo].[Sach] SET TacGia=28 WHERE MaSach=27
UPDATE [dbo].[Sach] SET TacGia=28 WHERE MaSach=28
UPDATE [dbo].[Sach] SET TacGia=55 WHERE MaSach=29
UPDATE [dbo].[Sach] SET TacGia=18 WHERE MaSach=30
UPDATE [dbo].[Sach] SET TacGia=12 WHERE MaSach=31
UPDATE [dbo].[Sach] SET TacGia=19 WHERE MaSach=32
UPDATE [dbo].[Sach] SET TacGia=35 WHERE MaSach=33
UPDATE [dbo].[Sach] SET TacGia=31 WHERE MaSach=34
UPDATE [dbo].[Sach] SET TacGia=20 WHERE MaSach=35
UPDATE [dbo].[Sach] SET TacGia=23 WHERE MaSach=36

GO

INSERT INTO dbo.DocGia
(TenDG)VALUES
(N'phạm minh tuấn'),(N'hà chí bảo '),(N'nguyễn mạnh hùng vĩ')
	GO
    
CREATE PROC sp_thong_ke_sach_theo_chu_de
AS BEGIN
	SELECT TenCD, 
		COUNT(Sach.MaCD) 'so luong sach'
	FROM Sach
	INNER JOIN ChuDe ON ChuDe.MaCD = Sach.MaCD
	GROUP BY Sach.MaCD, TenCD
END
GO

CREATE PROC sp_thong_ke_sach_theo_nxb
AS BEGIN
	SELECT TenNXB, 
		COUNT(Sach.MaNXB) 'so luong sach' 
	FROM Sach
	INNER JOIN NhaXuatBan ON NhaXuatBan.MaNXB = Sach.MaNXB
	GROUP BY Sach.MaNXB, TenNXB
END
GO

CREATE PROC sp_thong_ke_sach_theo_tac_gia
AS BEGIN
	SELECT TenTG, 
		(
			SELECT COUNT(MaSach) 
			FROM Sach 
			WHERE MaSach IN (
				SELECT dbo.fn_thong_ke_tac_gia(TenTG, TacGia, MaSach) 
				FROM Sach
			)
		)
	FROM TacGia
END

GO

CREATE PROC sp_thong_ke_sach_theo_ngon_ngu
AS BEGIN
	SELECT NgonNgu, COUNT(MaSach) FROM Sach 
	WHERE NgonNgu IN (SELECT NgonNgu FROM Sach)
	GROUP BY NgonNgu
END

GO

create function fn_select_pmct (@mapm int)
returns nvarchar(max)
begin
	DECLARE @chuoi_tieu_de nvarchar(max)
	select @chuoi_tieu_de = COALESCE(@chuoi_tieu_de + ', ', '') + tieude
	from sach where masach in (select masach from pmct where mapm = @mapm)
	return (select @chuoi_tieu_de)
end 

GO

CREATE PROC sp_insert_pmct
(
	@chuoi_ma_sach varchar(MAX),
	@ma_phieu int 
)
AS BEGIN
	DECLARE @ma_sach INT

	WHILE CHARINDEX(',', @chuoi_ma_sach) != 0
	BEGIN
		SET @ma_sach = LTRIM(RTRIM(SUBSTRING(@chuoi_ma_sach, 0, CHARINDEX(',', @chuoi_ma_sach))))
		SET @chuoi_ma_sach = LTRIM(RTRIM(SUBSTRING(@chuoi_ma_sach, CHARINDEX(',', @chuoi_ma_sach)+1, LEN(@chuoi_ma_sach))))
		INSERT INTO PMCT(MaPM, MaSach) VALUES (@ma_phieu, @ma_sach)
		update dbo.Sach set SoLuong = SoLuong-1 where MaSach = @ma_sach
	END

	INSERT INTO PMCT(MaPM, MaSach) VALUES (@ma_phieu, LTRIM(RTRIM(@chuoi_ma_sach)))
	update sach set soluong = soluong-1 where MaSach = LTRIM(RTRIM(@chuoi_ma_sach))
END 
				
GO

create proc sp_delete_pmct(@mapm int)
as BEGIN
update dbo.Sach set SoLuong = SoLuong+1 
	where MaSach in (select MaSach from dbo.PMCT where MaPM = @mapm)
	delete from dbo.PMCT where MaPM = @mapm
end
GO

create proc sp_traSach(@mapm int)
as BEGIN

	UPDATE dbo.PMCT SET TrangThai = 1 WHERE dbo.PMCT.MaPM = @mapm 
	UPDATE dbo.PhieuMuon SET NgayTra = GETDATE() WHERE dbo.PhieuMuon.MaPM=@mapm
	update dbo.Sach set SoLuong = SoLuong+1 where MaSach in (select MaSach from dbo.PMCT where MaPM = @mapm)

end
GO

CREATE FUNCTION fn_loang_ngoang_vl(@tacgia nvarchar(80))
RETURNS nvarchar(300)
AS BEGIN
	DECLARE @x NVARCHAR(MAX)
	SET @x = N''

	DECLARE @ma INT 
	DECLARE @tentg NVARCHAR(MAX)

	WHILE CHARINDEX(',', @tacgia) != 0
		BEGIN
			SET @ma = SUBSTRING(@tacgia, 0, CHARINDEX(',', @tacgia))
	
			SET @tacgia = LTRIM(RTRIM(SUBSTRING(@tacgia, CHARINDEX(',', @tacgia) + 1, LEN(@tacgia))))

			SET @tentg = (SELECT TenTG FROM TacGia WHERE MaTG = @ma)

			SET @x += @tentg + N', '
		END 

	SET @tentg = (SELECT TenTG FROM TacGia WHERE MaTG = @tacgia)
	SET @x += @tentg
	
	RETURN (SELECT @x)
END

GO

CREATE FUNCTION fn_thong_ke_tac_gia (
	@tentg NVARCHAR(80),
	@a VARCHAR(MAX),
	@masach INT
)
RETURNS INT
AS BEGIN
	DECLARE @matg INT
	SET @matg = (SELECT MaTG FROM TacGia WHERE TenTG = @tentg)

	DECLARE @b INT

	WHILE CHARINDEX(',', @a) != 0
		BEGIN
			SET @b = LTRIM(RTRIM(SUBSTRING(@a, 0, CHARINDEX(',', @a))))
			SET @a = LTRIM(RTRIM(SUBSTRING(@a, CHARINDEX(',', @a) + 1, LEN(@a))))
			IF @b = @matg
				BEGIN
					RETURN (SELECT @masach)
					BREAK
				END
		END

	IF LTRIM(RTRIM(@a)) = @matg
		BEGIN
			RETURN (SELECT @masach)
		END 

	RETURN NULL
END

go

create proc sp_danh_sach_pm_theo_thang
(
	@thang int,
	@nam int
)
as begin
	select docgia.thedg, 
		tendg, 
		convert(varchar, NgayMuon, 105),
		convert(varchar, Ngayhen, 105)
	from docgia
	inner join phieumuon on DocGia.thedg = phieumuon.thedg
	where month(ngaymuon) = @thang and year(ngaymuon) = @nam
end
go

create proc sp_so_pm_theo_thang(@year int)
as begin
	WITH months(MonthNumber) AS
	(
		SELECT cast(1 as int)
		UNION ALL
		SELECT MonthNumber + 1
		FROM months
		WHERE MonthNumber < 12
	)
	select *, 
		(
			select count(mapm) 
			from phieumuon 
			where month(ngaymuon) = monthnumber and year(ngaymuon) = @year
		) 
	from months
end
go

create proc sp_select_PM_qua_han
as begin
	select mapm,
		docgia.thedg, 
		tendg,
		convert(varchar, ngaymuon, 105),
		convert(varchar, ngayhen, 105)	
	from docgia
	inner join phieumuon on DocGia.thedg = phieumuon.thedg
	where getdate() > ngayhen and ngaytra is null
end
go

create proc sp_so_luot_muon_tung_dau_sach
(
	@thang int,
	@nam int
)
as begin
	select tieude, 
		sotrang, 
		ngonngu,
		count(pmct.masach) luotmuon
	from sach
	inner join pmct on sach.masach = pmct.masach
	inner join PhieuMuon on PhieuMuon.MaPM = pmct.MaPM
	where month(ngaymuon) = @thang and year(ngaymuon) = @nam
	group by tieude, sotrang, ngonngu
end
go

create proc sp_so_dau_sach_muon_theo_thang(@nam int)
as begin
	with months(monthnumber) as
	(
		select cast(1 as int)
		union all
		select monthnumber + 1
		from months
		where monthnumber < 12
	)
	select *,
		(
			select count(tieude) 
			from 
			(
				select distinct tieude
				from sach
				inner join pmct on sach.masach = pmct.masach
				inner join PhieuMuon on PhieuMuon.MaPM = pmct.MaPM
				where month(ngaymuon) = monthnumber and year(ngaymuon) = @nam
			) as t1
		) 
	from months
end
GO

create trigger tg_tra_sach on PhieuMuon for insert 
as if (select NgayMuon from inserted) < (select NgayHen from inserted)
begin
print N'Phải trả sách trước ngày hẹn'
rollback transaction
end
