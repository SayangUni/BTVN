---1. Tạo trigger trên bảng NHANVIEN cho thao tác UPDATE. Khi có thao tác cập nhật dữ
---liệu xảy ra trên cột TenNV, thông báo cho người dùng “Không được phép cập nhật” và hủy
---thao tác.

CREATE TRIGGER chanupdate
ON NHANVIEN
AFTER UPDATE
AS
    IF DATEPART(dw, GETDATE()) = 7 OR DATEPART(dw, GETDATE()) = 1
    BEGIN
        ROLLBACK
        RAISERROR(N'Không được phép cập nhậ', 16, 1)
        RETURN
    END
GO


delete from NHANVIEN where MANV='021'

2. Thêm cột TongGio vào trong bảng NHANVIEN. Viết trigger cho các thao tác
INSERT, UPDATE, DELETE trên bảng PHANCONG. Khi có mẩu tin được thêm vào, cập
nhật hay xóa thì TongGio được tính lại tương ứng cho nhân viên được phân công.
Lưu ý:
- Ban đầu, TongGio = 0
- TongGio là tổng thời gian phân công tham gia vào các dự án cho các nhân viên.

ALTER TABLE NHANVIEN
ADD NHANVIEN(int);

CREATE OR ALTER TRIGGER b2 ON NHANVIEN
FOR INSERT, UPDATE, DELETE
AS
DECLARE @Operation VARCHAR(15)
 
IF EXISTS (SELECT 0 FROM inserted)
BEGIN
   IF EXISTS (SELECT 0 FROM deleted)
   BEGIN 
      SELECT @Operation = 'UPDATE'
   END ELSE
   BEGIN
      SELECT @Operation = 'INSERT'
   END
END ELSE 
BEGIN
   SELECT @Operation = 'DELETE'
END 
PRINT @Operation


INSERT INTO NHANVIEN
(TongGio) VALUES (0);
 
UPDATE NHANVIEN
SET TongGio = 0

 
DELETE FROM NHANVIEN
WHERE TongGio = 0;

3. Tạo các trigger để kiểm tra ràng buộc liên thuộc tính giữa NgSinh và NgayBatDau trên
bảng NHANVIEN.
Trong đó: YEAR(NgayBatDau) - YEAR(NgSinh) &gt;= 18
4. Tạo trigger để kiểm tra ràng buộc trên bảng THANNHAN sao cho số lượng thân nhân
của một nhân viên không quá 05 người.
5. Tạo trigger cho thao tác xóa trên bảng DEAN để đảm bảo nguyên tắc: Mã đề án sẽ
không thể được xóa khi còn mẩu tin chứa mã đề án đó trên bảng PHANCONG.
6. Tạo trigger trên bảng PHONGBAN cho thao tác UPDATE. Khi có thao tác cập nhật dữ
liệu xảy ra trên cột MaPhong, tất cả dữ liệu trên các bảng có liên quan cũng phải thay đổi theo.go
