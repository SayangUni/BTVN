use QLDA1
SELECT (HONV+ ' ' +TENLOT+ ' ' +TENNV) AS 'Họ Tên Nhân Viên Có Lương Trên Mức Lương Trung Bình Của Phòng "Nghiên cứu"'
FROM NHANVIEN
WHERE LUONG > (SELECT AVG(LUONG)
FROM NHANVIEN, PHONGBAN
WHERE PHG = MAPHG AND TENPHG = N'Nghiên cứu')