---a. Tạo các login; tạo các user khai thác CSDL AdventureWorks2008R2 cho các nhân viên nêu
---trên (tên login trùng tên user). (1đ)
EXEC sp_addlogin 'NV';  
EXEC sp_addlogin 'TN';  
EXEC sp_addlogin 'QL';
--nếu dùng SQL Server Authentication
CREATE LOGIN NV
WITH PASSWORD = '123321';

CREATE LOGIN TN
WITH PASSWORD = '123321';

CREATE LOGIN QL
WITH PASSWORD = '123321';
---b. Phân quyền để các nhân viên hoàn thành nhiệm vụ được phân công. Lưu ý : Admin chỉ cấp
---quyền cho trưởng nhóm TN và quản lý QL. Quyền của nhân viên NV được trưởng nhóm cấp.
use AdventureWorks2008R2;
GRANT VIEW DEFINITION ON AVAILABILITY GROUP::NT TO NV;  
GO  
GRANT SELECT ON OBJECT::Production.ProductInvento TO QL;  
GO  
GRANT SELECT ON OBJECT::Production.ProductInvento TO NT;  
GO 
GRANT SELECT ON OBJECT::NT TO NV;  
GO 
---c. Đăng nhập phù hợp, mở cửa sổ query tương ứng và viết lệnh để:
--- trưởng nhóm TN sửa 1 dòng dữ liệu tùy ý,
--- nhân viên NV xóa 1 dòng dữ liệu tùy ý và
--- nhân viên QL xem lại kết quả thực hiện của 2 user trên.
---(Lưu ý: Đặt tên các cửa sổ query làm việc ứng với các nhân viên là TN, NV, QL và lưu các query
----này vào thư mục bài làm) (3đ)
---d. Ai có thể sửa được dữ liệu bảng Production.Product ? Viết lệnh cụ thể và giải thích vì sao?

---e. Nhân viên NV nghỉ việc, trưởng nhóm hãy thu hồi quyền cấp cho nhân viên NV này. (1đ)
REVOKE CREATE TABLE FROM NV; 
---f. Nhóm 1 hoàn thành dự án, admin hãy vô hiệu hóa các hoạt động của nhóm này trên CSDL

REVOKE CREATE TABLE FROM NT;
REVOKE CREATE TABLE FROM NV; 
--Câu 2:Thực hiện chuỗi các thao tác sau để có thể phục hồi database khi có sự cố ở thời điểm T8?
Yêu cầu :
- Các backup được ghi vào cùng một thiết bị
- Thực hiện 3 dạng backup
T1 : [thực hiện Full Backup]
T2 : Cập nhật tăng mức tồn kho an toàn SafetyStockLevel trong table Production.Product lên
10% cho các mặt hàng là nguyên liệu sản xuất
T3 : [thực hiện Differential Backup]
T4 : Xóa mọi bản ghi trong bảng Person.Emailaddress
T5 : [thực hiện Differential Backup]
T6 : Thêm một dòng trong table Person.ContactType
T7 : [thực hiện Log Backup]
T8 : Xóa CSDL AdventureWorks2008R2.
T9 : Phục hồi CSDL về trạng thái ở T7
T10 : Kiểm tra xem DB phục hồi có ở trạng thái T7 không ? 
