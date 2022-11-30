--Bài 1:
--Viết trigger DML:
-- Ràng buộc khi thêm mới nhân viên thì mức lương phải lớn hơn 15000, nếu vi phạm thì xuất thông báo “luong phải >15000’

create trigger trg_CheckLuong15000 
	on NHANVIEN
	for insert, update
as
	if (select LUONG from inserted)<15000
	begin
		print N'Lương < 15000'
		rollback tran
	end
	
  --test
SELECT * FROM NHANVIEN
INSERT INTO [dbo].[NHANVIEN] ([HONV],[TENLOT],[TENNV],[MANV],[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
VALUES(N'pham',N'minh',N'tuan','098','09-19-2002,' HCM','Nam',1000,'008',1)
GO

--cau 1b--
--Ràng buộc khi thêm mới nhân viên thì độ tuổi phải nằm trong khoảng 18 <= tuổi <=65.--

create trigger trg_CheckTuoi
	on NHANVIEN
	for insert
as
	declare @tuoi int;
	select @tuoi = DATEDIFF(YEAR, NGSINH, GETDATE())+1 from inserted
	if @tuoi < 18 or @tuoi > 65
	begin 
		print N'Tuổi của nhân viên không hợp lệ 18 <= tuổi <= 65'
		rollback transaction
	end
---Test
INSERT INTO [dbo].[NHANVIEN] ([HONV],[TENLOT],[TENNV] ,[MANV] ,[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
  VALUES(N'pham',N'minh',N'tuan','098','09-19-2002',' HCM','Nam',1000,'008',1)
GO
---câu 1c
CREATE TRIGGER trg_CheckUpdateOnAddress
   ON NHANVIEN
   FOR UPDATE
AS
   IF EXISTS (SELECT DCHI FROM inserted where DCHI LIKE '%HCM%')
   BEGIN
      PRINT N'Không thể cập nhật nhân viên ở HCM';
	  ROLLBACK TRAN;
   END;
---câu lệnh kiểm tra
UPDATE [dbo].[NHANVIEN]
   SET [PHAI] = 'Nam'
 WHERE MaNV = '001';
GO

----bài 2
CREATE TRIGGER trg_SumEmps
   ON NHANVIEN
   AFTER INSERT
AS
   DECLARE @male INT, @female INT;
   SELECT @female = count(Manv) FROM NHANVIEN WHERE PHAI = N'Nữ';
   SELECT @male = count(Manv) FROM NHANVIEN WHERE PHAI = N'Nam';
   PRINT N'Tổng số nhân viên là nữ: ' + cast(@female as varchar);
   PRINT N'Tổng số nhân viên là nam: ' + cast(@male as varchar);

---test
INSERT INTO [dbo].[NHANVIEN]([HONV],[TENLOT],[TENNV],[MANV],[NGSINH],[DCHI],[PHAI],[LUONG],[MA_NQL],[PHG])
VALUES ('A','B','C','345','7-12-1999','HCM','Nam',1000,'008',1)
GO
 --BÀI 2B
CREATE TRIGGER trg_SumEmpsForUpdate
ON NHANVIEN
AFTER update
AS
IF (select top 1 PHAI FROM deleted) != (select top 1 PHAI FROM inserted)
   BEGIN
      Declare @male int, @female int;
      SELECT @female = count(Manv) from NHANVIEN where PHAI = N'Nữ';
      SELECT @male = count(Manv) from NHANVIEN where PHAI = N'Nam';
      PRINT N'Tổng số nhân viên là nữ: ' + cast(@female as varchar);
      PRINT N'Tổng số nhân viên là nam: ' + cast(@male as varchar);
   END;
---test
UPDATE [dbo].[NHANVIEN]
   SET [HONV] = 'Tín'
      ,[PHAI] = N'Nữ'
 WHERE  MaNV = '345'
GO
---BÀI 2C
CREATE TRIGGER trg_SumForDelete
   on DEAN
   AFTER DELETE
AS
   SELECT MA_NVIEN, COUNT(MaDA) as 'Tổng sô đề án đã tham gia' from PHANCONG
      GROUP BY MA_NVIEN
go

--BÀI 3A
CREATE TRIGGER trg_deleteNhanThanNV ON NHANVIEN
INSTEAD OF DELETE 
AS
BEGIN
   DELETE FROM THANNHAN WHERE MA_NVIEN IN (SELECT MANV FROM deleted)
   DELETE FROM NHANVIEN WHERE MANV IN (SELECT MANV FROM deleted)
END

DELETE NHANVIEN WHERE MANV='001'
SELECT * FROM THANNHAN

--BÀI 3B
CREATE TRIGGER trg_NhanVien3b ON NHANVIEN
ALTER INSERT
AS 
BEGIN 
INSERT INTO PHANCONG VALUES((SELECT MANV FROM INSERTED),1,1,100)
END
INSERT INTO NHANVIEN
VALUES(N'pham',N'minh',N'tuan','098','09-19-2002',' HCM','Nam',1000,'008',1)
