---1
CREATE FUNCTION diem_trung_binh(@msv char(10))
returns float
as
begin
declare @tb float
set @tb = (select avg(DIEMTHI)
from KETQUA
where MASV=@msv)
return @tb
end
---2

CREATE FUNCTION diem_trung_binhC1 (@msv char(5))
returns table
as
return
select s.masv, HOTEN, trungbinh=dbo.diemtb(s.masv)
from SINHVIEN s join KETQUA k on s.masv=k.masv
where MALOP=@malop
group by s.masv, HOTEN



go
CREATE FUNCTION diem_trung_binhC2 (@msv char(5))
returns @dsdiemtb table (masv char(5), tensv nvarchar(20), dtb float)
as
begin
insert @dsdiemtb
select s.masv, HOTEN, trungbinh=dbo.diemtb(s.MaSV)
from SINHVIEN s join KetQua k on s.MaSV=k.MaSV
where MALOP=@malop
group by s.masv, HOTEN
return
end
---3
go
create proc ktra @msv char(5)
as
begin
declare @n int
set @n=(select count(*) from KETQUA where MASV=@msv)
if @n=0
print 'sinh vien '+@msv + 'khong thi mon nao'
else
print 'sinh vien '+ @msv+ 'thi '+cast(@n as char(2))+ 'mon'
end

---4
go
create trigger updatesslop
on SINHVIEN
for insert
as
begin
declare @ss int
set @ss=(select count(*) from SINHVEN s
where MALOP in(select MALOP from inserted))
if @ss>10
begin
print 'Lop day'
rollback tran
end
else
begin
update LOP
set SiSo=@ss
where MALOP in (select MALOP from inserted)
end

--6.
grant Insert, Update on SINHVIEN to user1
grant select on SINHVIEN to user2


go
use QLSV
go
Create role Quanly
Grant select, insert, update to Quanly
exec Sp_AddRoleMember 'Quanly', 'user1'
exec Sp_AddRoleMember 'Quanly', 'user2'
