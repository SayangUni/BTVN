create database Sales
GO 
USE Sales
GO 
EXEC sp_addtype 'Mota', 'NVARCHAR(40)'
EXEC sp_addtype 'IDKH', 'CHAR(10)', 'NOT NULL'
EXEC sp_addtype 'DT', 'CHAR(12)'
GO
CREATE TABLE SanPham
(
Masp CHAR(6) NOT NULL,
TenSp VARCHAR(20) ,
NgayNhap DATE ,
DVT CHAR(10),
SoLuongTon INT  ,
DonGiaNhap MONEY ,
)

CREATE TABLE HoaDon 
(
MaHD CHAR(10) NOT NULL,
NgayLap date  ,
NgayGiao date ,
Makh IDKH ,
DienGiai Mota  ,
)

CREATE TABLE KhachHang
(
MaKH IDKH ,
TenKH NVARCHAR(30) ,
Diachi NVARCHAR(40),
Dienthoai DT ,

)

CREATE TABLE ChiTietHD
(
MaHD CHAR(10) NOT NULL,
Masp CHAR(6) NOT NULL,
Soluong INT ,
)

-- 3. Trong Table HoaDon, sửa cột DienGiai thành nvarchar(100).
ALTER TABLE HoaDon
ALTER COLUMN DienGiai NVARCHAR(100)
-- 4. Thêm vào bảng SanPham cột TyLeHoaHong float
ALTER TABLE SanPham
ADD TyLeHoaHong float
-- 5. Xóa cột NgayNhap trong bảng SanPham
ALTER TABLE SanPham
DROP COLUMN NgayNhap
--6. Tạo các ràng buộc khóa chính và khóa ngoại cho các bảng trên
GO
ALTER TABLE dbo.SanPham ADD CONSTRAINT
	PK_SanPham PRIMARY KEY CLUSTERED (Masp)

GO
ALTER TABLE dbo.KhachHang ADD CONSTRAINT
	PK_KhachHang PRIMARY KEY CLUSTERED (MaKH)

GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	PK_HoaDon PRIMARY KEY CLUSTERED (MaHD) 
GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	FK_HoaDon_KhachHang FOREIGN KEY
	(Makh) REFERENCES dbo.KhachHang(MaKH) 

GO
ALTER TABLE dbo.ChiTietHD ADD CONSTRAINT
	FK_ChiTietHD_HoaDon FOREIGN KEY
	(MaHD) REFERENCES dbo.HoaDon(MaHD) 
	
GO
ALTER TABLE dbo.ChiTietHD ADD CONSTRAINT
	FK_ChiTietHD_SanPham FOREIGN KEY
	(Masp) REFERENCES dbo.SanPham(Masp) 

--7. Thêm vào bảng HoaDon các ràng buộc sau:
ALTER TABLE HoaDon 
ADD CONSTRAINT check_NgayGiao_NgayLap CHECK (NgayGiao >= NgayLap),
    CONSTRAINT check_MaHD CHECK (MaHD LIKE '[a-zA-Z][a-zA-Z0-9][0-9][0-9][0-9][0-9]'),
    CONSTRAINT df_NgayLap DEFAULT CURRENT_TIMESTAMP FOR NgayLap;

--8. Thêm vào bảng Sản phẩm các ràng buộc sau:
ALTER TABLE SanPham 
ADD CONSTRAINT check_SoLuongTon CHECK (0>=SoLuongTon<=500),
    CONSTRAINT check_DonGiaNhap CHECK (DonGiaNhap>0),
ALTER TABLE SanPham ADD NgayNhap DATE DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE SanPham
ADD CONSTRAINT CK_SanPham_DVT CHECK (DVT IN ('KG', 'Thùng', 'Hộp', 'Cái'));
--9. Dùng lệnh T-SQL nhập dữ liệu vào 4 table trên, dữ liệu tùy ý, 
--chú ý các ràng buộc của mỗi Table
INSERT INTO KhachHang(MaKH,TenKH,Diachi,Dienthoai) 
	VALUES('aa1111','test','test','0000000000')
INSERT INTO KhachHang(MaKH,TenKH,Diachi,Dienthoai) 
	VALUES('aa1112','test1','test1','0000000001')

INSERT INTO HoaDon(MaHD,NgayLap,NgayGiao,Makh,DienGiai) 
	VALUES('bb1111','' ,'' , 'aa1111','test')
INSERT INTO HoaDon(MaHD,NgayLap,NgayGiao,Makh,DienGiai) 
	VALUES('bb1112','' ,'' , 'aa1112','test1')

INSERT INTO SanPham(Masp,TenSp,NgayNhap,DVT,SoLuongTon,DonGiaNhap) 
	VALUES('cc1111','test' ,'' , 'test',1,1111)
INSERT INTO SanPham(Masp,TenSp,NgayNhap,DVT,SoLuongTon,DonGiaNhap) 
	VALUES('cc1112','test' ,'' , 'test',2,1112)

INSERT INTO ChiTietHD(MaHD,Masp,Soluong) 
	VALUES('bb1111','cc1111' ,5)
INSERT INTO ChiTietHD(MaHD,Masp,Soluong) 
	VALUES('bb1112','cc1112' ,6)
--10.Xóa 1 hóa đơn bất kỳ trong bảng HoaDon. Có xóa được không? Tại sao? Nếu
--vẫn muốn xóa thì phải dùng cách nào?
DELETE FROM HoaDon WHERE MaHD='bb1112';
--11.Nhập 2 bản ghi mới vào bảng ChiTietHD với MaHD = ‘HD999999999’ và
--MaHD=’1234567890’. Có nhập được không? Tại sao?

--dạ thưa là không vì nó dính ràng buộcMaHD gồm 6 ký tự
	
--12.Đổi tên CSDL Sales thành BanHang
ALTER DATABASE sales SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE [sales] MODIFY NAME = [BanHang]
GO 
ALTER DATABASE BanHang SET MULTI_USER;
GO
--13.Tạo thư mục T:\QLBH, chép CSDL BanHang vào thư mục này, bạn có saochép được không? Tại sao? 
---được tại vì sql server có  chức năng export để đưa file sql ra để sao chép thư mục QLBH

---Muốn sao chép được bạn phải làm gì? Sau khi sao chép bạn thực hiện Attach vào lại SQL.
---nhấp chuột trái vào csdl BanHang rồi bấm task hàng cuối cùng sẽ có "export data" bấm vào đấy để sao chép file r.
---muốn thực hiện đưa file vào lại bấm chuột tái vào database rồi nhấp vào attach để  thưucj hiện đừa file vào lại sql server
 

