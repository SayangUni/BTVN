--I
--2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM
ADD GHICHU VARCHAR(20)
--3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG
ADD LOAIKH TINYINT
--4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU VARCHAR(100)
--5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM
DROP COLUMN GHICHU
--6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, ...
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH VARCHAR(20)
--7. Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM
ADD CONSTRAINT SANPHAM_DVT CHECK (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')
--8. Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM
ADD CONSTRAINT SANPHAM_GIA CHECK(GIA > 500)
--9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE CTHD
ADD CONSTRAINT CTHD_SL CHECK(SL >= 1)
--10. Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG
ADD CONSTRAINT KH_NGDK_NGSINH CHECK(NGDK >= NGSINH)
II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * FROM SANPHAM, KHACHHANG
--3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM SET GIA=GIA+GIA/(100/5) 
WHERE NUOCSX='SINGAPORE'
--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM SET GIA =GIA/(100/5)+GIA 
WHERE NUOCSX='TRUNG QUOC' AND GIA >10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE KHACHHANG SET LOAIKH ='Vip' 
WHERE (NGDK<'2011/1/1' AND DOANHSO>=10000000) OR (NGDK>'2011/1/1' AND DOANHSO >=2000000)
III. Ngôn ngữ truy vấn dữ liệu có cấu trúc:
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX = 'Trung Quoc'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE SANPHAM.DVT = 'cay' OR SANPHAM.DVT = 'quyen'
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE SANPHAM.MASP LIKE 'B%'
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX = 'Trung Quoc'
AND SANPHAM.GIA >= 30000
AND SANPHAM.GIA <= 40000
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE (SANPHAM.NUOCSX = 'Trung Quoc' OR SANPHAM.NUOCSX = 'Thai Lan')
AND SANPHAM.GIA >= 30000
AND SANPHAM.GIA <= 40000
--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON
WHERE HOADON.NGHD IN ('1/1/2007', '2/1/2007')
--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA, DAY(HOADON.NGHD) AS NGAYHD
FROM HOADON
WHERE MONTH(HOADON.NGHD) = '1' AND YEAR(HOADON.NGHD) = '2007'
ORDER BY NGAYHD, TRIGIA DESC
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT HOADON.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH AND HOADON.NGHD = '1/1/2007'
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON, NHANVIEN
WHERE NHANVIEN.MANV = HOADON.MANV AND NHANVIEN.HOTEN = N'Nguyen Van B' AND HOADON.NGHD = '2006/10/28'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM, KHACHHANG, CTHD, HOADON
WHERE SANPHAM.MASP = CTHD.MASP AND CTHD.SOHD = HOADON.SOHD AND HOADON.MAKH = KHACHHANG.MAKH
AND KHACHHANG.HOTEN = N'Nguyen Van A' AND MONTH(HOADON.NGHD) = '10' AND YEAR(HOADON.NGHD) = '2006'
