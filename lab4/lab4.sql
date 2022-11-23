---Bài 1:---
SELECT IIF(LUONG>=LTB,'Không tăng lương','Tăng lương')
AS THUONG, TENNV, LUONG, LTB
FROM
(SELECT TENNV,LUONG,LTB FROM NHANVIEN,
(SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC
---
SELECT IIF(LUONG<=LTB,'NhanVien','TruongPhong')
AS PL,TENNV,LUONG,LTB
FROM 
(SELECT TENNV,LUONG,LTB FROM NHANVIEN,
(SELECT PHG,AVG(LUONG) AS 'LTB' FROM NHANVIEN GROUP BY PHG) AS TEMP
WHERE NHANVIEN.PHG=TEMP.PHG) AS ABC
---
SELECT TENNV = CASE PHAI
WHEN 'nam' then 'Mr. '+[TENNV]
WHEN N'Nữ' then 'Ms. '+[TENNV]
END
FROM NHANVIEN
---
SELECT TENNV,LUONG,THUE=CASE
WHEN LUONG BETWEEN 0 AND 25000 THEN LUONG*0.1
WHEN LUONG BETWEEN 25000 AND 30000 THEN LUONG*0.12
WHEN LUONG BETWEEN 30000 AND 40000 THEN LUONG*0.15
WHEN LUONG BETWEEN 40000 AND 50000 THEN LUONG*0.2
ELSE LUONG*0.25
END 
FROM NHANVIEN
--Bài 2:
declare @dem int=2
while @dem<(select count(MANV) from NHANVIEN)
	begin
		select HONV,TENLOT,TENNV,MANV from NHANVIEN WHERE CAST(MANV as int)=@dem
		set @dem=@dem+2
	end
---
declare @dem int=2
while @dem<(select count(MANV) from NHANVIEN)
	begin
		if @dem=4
		begin
			set @dem=@dem+2
			continue
		end
		if @dem%2=0
			select HONV,TENLOT,TENNV,MANV from NHANVIEN WHERE CAST(MANV as int)=@dem
			set @dem=@dem+2
	end
--Bài tập cho thêm---
---Viết chương trình tính tổng các số chẵn từ 1 tới 10.
DECLARE @TONG int=0, @DEM int=1
WHILE(@DEM<=10)
BEGIN
	SET @TONG = @TONG+@DEM
	SET @DEM = @DEM+1
END
PRINT @TONG
---Viết chương trình tính tổng các số chẵn từ 1 tới 10 nhưng bỏ số 4.
DECLARE @TONG int=0, @DEM int=1
WHILE(@DEM<=10)
BEGIN
	IF @DEM=4
		BEGIN
			SET @DEM=@DEM+1
			CONTINUE
		END	
	IF @DEM!=4
		SET @TONG = @TONG+@DEM
		SET @DEM = @DEM+1
END
PRINT @TONG
