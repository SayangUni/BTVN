---Câu 1: (LO3) (5đ)
---Có 2 nhóm nhân viên với các công việc cụ thể sau:
--- Nhóm nhân viên hiệu chỉnh (nhập, sửa, xóa) và xem số liệu: thuộc role NhanVien, gồm
--nhân viên NV1 và NV2, chỉ được làm việc trên bảng PersonPhone.
-- Nhân viên quản lý QL xem số liệu: thuộc role db_datareader, làm việc trên bảng
--PersonPhone và bảng Person.
---Thực hiện các yêu cầu sau:
---a. Tạo các login; tạo các user khai thác CSDL AdventureWorks2008R2 cho các nhân viên (tên
--login trùng tên user) (1đ).
use AdventureWorks2008R2
CREATE LOGIN NV1
WITH PASSWORD = '123321';

CREATE LOGIN NV2
WITH PASSWORD = '123321';

CREATE LOGIN QL
WITH PASSWORD = '123321';
---b. Tạo role NhanVien, phân quyền cho role, thêm các user NV1, NV2, QL vào các role theo
---phân công ở trên để các nhân viên hoàn thành nhiệm vụ (1đ).
grant insert, select, update on Person.PersonPhone to [NV1]

grant insert, select, update on Person.PersonPhone to [NV2]
--Gán role NHANVIEN cho NV1 và NV2
GRANT NHANVIEN TO NV1, NV2;
Grant succeeded. 

GRANT SELECT ON Person.PersonPhone TO db_datareader;
GRANT SELECT ON Person.Person  TO db_datareader;
GO
--Gán role db_datareader cho QL
GRANT db_datareader TO QL;
Grant succeeded
---c. SV ghi chú lại Mã SV của mình. Đăng nhập phù hợp, mở cửa sổ query tương ứng và viết
---lệnh để:
---Nhân viên NV1 sửa số điện thoại của người có BusinessEntityID=(3 ký tự cuối của Mã SV
---của chính SV dự thi) thành 123-456-7890

select * from Person.PersonPhone where BusinessEntityID = 0115
insert into Person.PersonPhone values(0115, '123-456-7890' , 2 ,getdate())

-Nhân viên NV2 xóa số điện thoại của người có BusinessEntityID=(3 ký tự đầu của Mã SV
của chính SV dự thi).
-Sau cùng, nhân viên QL xem lại kết quả NV1 và NV2 đã làm
***Nhớ chụp hình cửa sổ query của 3 user trên.
(Lưu ý: Đặt tên các cửa sổ query làm việc ứng với các nhân viên là NV1, NV2, QL và lưu
các query này vào thư mục bài làm) (1đ).
d. Ai có thể xem dữ liệu bảng Person.Person? Giải thích. Viết lệnh kiểm tra quyền trên cửa sổ
query của user tương ứng (1đ).
-- e. Các nhân viên quản lý NV1, NV2, QL hoàn thành dự án, admin thu hồi quyền đã cấp. Xóa role NhanVien.
-- Thu hồi quyền
REVOKE Nhanvien FROM NV1,NV2,QL;
Revoke succeeded.
-- Xóa role NhanVien
DROP ROLE NhanVien 
--Hãy lên kế hoạch phục hồi cơ sở dữ liệu cho các hoạt động sau bằng cách viết các lệnh Backup
---tại các vị trí [...] để thực hiện Restore cơ sở dữ liệu theo yêu cầu ở câu d.
---a. Tạo một giao tác tăng lương (Rate) thêm 20% cho các nhân viên làm việc ở phòng
(Department.Name) ‘Production’ và ‘Production Control’. Tăng lương 15% cho các nhân
viên các phòng ban khác. [Ghi nhận dữ liệu đang có và Viết lệnh Full Backup]. (1đ)
b. Xóa mọi bản ghi trong bảng PurchaseOrderDetail. [Viết lệnh Differential Backup] (1đ).
c. Bổ sung thêm 1 số phone mới (Person.PersonPhone) tùy ý cho nhân viên có mã số nhân viên
(BusinessEntityID) là 4 ký tự cuối của Mã SV của chính SV dự thi, ModifiedDate=getdate().
[Ghi nhận dữ liệu đang có và Viết lệnh Log Backup] (1đ).
d. Xóa CSDL AdventureWorks2008R2. Phục hồi CSDL về trạng thái sau khi thực hiện bước
c. Kiểm tra xem dữ liệu phục hồi có đạt yêu cầu không (lương có tăng, các bản ghi có bị
xóa, có thêm số phone mới)? (1đ)
