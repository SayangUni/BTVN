---1
CREATE FUNCTION diem_trung_binh
returns int
as
begin
return(SELECT AVG(DiemThi) AS N'Điểm trung bình'
FROM KetQua
GROUP BY DiemThi)
end

---2
