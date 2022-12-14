--CAU 1
CREATE TABLE VatTu (
	MaVT CHAR(4) PRIMARY KEY,
	TenVT NVARCHAR(20),
	DVTinh NUMERIC,
	SLCon INT
)
GO

CREATE TABLE HDBan (
	MaHD VARCHAR(10) PRIMARY KEY,
	NgayXuat SMALLDATETIME,
	HoTenKhach NVARCHAR(20)
)
GO

CREATE TABLE HangXuat(
	MaHD VARCHAR(10),
	MaVT CHAR(4),
	DonGia MONEY,
	SLBan INT,
	CONSTRAINT pk_hx PRIMARY KEY(MaHD, MaVT)
)

GO
ALTER TABLE HangXuat ADD CONSTRAINT FK_HangXuat_HDBan
FOREIGN KEY (MAHD) REFERENCES HDBan (MAHD);

ALTER TABLE HangXuat ADD CONSTRAINT FK_HangXuat_VatTu
FOREIGN KEY (MAVT) REFERENCES VatTu (MAVT);

GO
INSERT INTO VatTu(MaVT,TenVT,DVTinh,SLCon) VALUE (N'A01', N'Xi măng', 'VND', 100)
INSERT INTO VatTu(MaVT,TenVT,DVTinh,SLCon) VALUE(N'A02', N'Cát', 'VND', 100)

INSERT INTO HDBan(MaHD,NgayXuat,HoTenKhach) VALUE(N'HD01',CAST(N'2022-12-13'AS DATE),N'PHẠM VĂN 1 ')
INSERT INTO HDBan(MaHD,NgayXuat,HoTenKhach) VALUE(N'HD02',CAST(N'2022-12-14'AS DATE),N'PHẠM VĂN 2 ')

INSERT INTO HangXuat(MaHD,MaVT,DonGia,SLBan) VALUE(N'HD01',N'A01',1000000, 200)
INSERT INTO HangXuat(MaHD,MaVT,DonGia,SLBan) VALUE(N'HD02',N'A01',1000000, 400)
INSERT INTO HangXuat(MaHD,MaVT,DonGia,SLBan) VALUE(N'HD03',N'A02',1000000, 300)
INSERT INTO HangXuat(MaHD,MaVT,DonGia,SLBan) VALUE(N'HD04',N'A02',1000000, 100)

--CAU 2
select top 1 MaHD, sum(DonGia) as TongTien from HangXuat group by MaHD,
DonGia order by DonGia desc

--CAU 3
CREATE FUNCTION get thu(@ngay datetime)
return nvarchar(100)
AS
BEGIN
declare @songaytrongtuan int;
set @songaytrongtuan = datepart(weekday, @ngay);
declare @thu nvarchar(100);
if(@songaytrongtuan=0)
BEGIN
SET @thu = N'Chủ Nhật'
END

if(@songaytrongtuan=1)
BEGIN
SET @thu = N'thứ 2'
END

if(@songaytrongtuan=2)
BEGIN
SET @thu = N'thứ 3'
END

if(@songaytrongtuan=3)
BEGIN
SET @thu = N'thứ 4'
END

if(@songaytrongtuan=4)
BEGIN
SET @thu = N'thứ 5'
END
if(@songaytrongtuan=5)
BEGIN
SET @thu = N'thứ 6'
END

if(@songaytrongtuan=6)
BEGIN
SET @thu = N'thứ 7'
END


GO
CREATE FUNCTION Cau3 (@mahd int(10))
RETURNS TABLE
AS
RETURN
    SELECT dbo.HDBan.MaHD, NgayXuat, MaVT, DonGia,SLBan, dbo.getThu(NgayXuat) as N'Ngày Thứ'
    FROM dbo.HangXuat
    WHERE dbo.HDBan.MaHD = dbo.HangXuat.MaHD AND dbo.HangXuat.MaHD=@mahd
    --test
    SELECT * FROM dbo.Cau3(2)
--CAU 4
CREATE PROCEDURE C4 
@thang int, @nam int 
AS
SELECT 
SUM(SLBan * DonGia)
FROM HangXuat HX
INNER JOIN HDBan HD ON HX.MaHD = HD.MaHD
where MONTH(HD.NgayXuat) = @THANG AND YEAR(HD.NgayXuat) = @NAM;
select top 1 MaHD, sum(DonGia) as TongTien from HangXuat group by MaHD,
DonGia order by DonGia desc
