# Bash-Scripting-Final-Exam-2024-Linux
It is a part of my Final Exam at Saigon University.

<< This is the Section for step by step insight into my Project, Enjoy!! >>

Đây là Yêu cầu của Đề Bài:
Mô tả bài toán:
Một hệ thống thư viện, sau khi đã só hóa các quyển sách trong thư viện đã thu được các quyển sách dưới dạng tập tin và được đặt tên theo cấu trúc như sau: <Tên sách_Ten Tác giả_Năm xuất bản_Nhà xuất bản>.Ví dụ: OperatingSystem_Silberchartz_2019_Spring. Để tự đọng hóa việc quản lý, người ta dùng Bash Shell Scropt để thực hiện các yêu cầu quản lý. Đoạn Script khi được gọi sẽ có những lựa chọn như sau:

Hãy lựa chọn tính năng:
1. Liệt kê danh mục sách và ghi vào file lưu trữ.
2. Thống kê đầu sách của tác giả.
3. Cập nhật tên quyển sách.
4. Xóa 1 quyển sách.

Người dùng đặt tên file script là thuvien.sh và khi chạy sẽ gọi đoạn script đó nhưu sau:
bash thuvien.sh Sach Data
Trong đó, Sach là thư mục chứa toàn bộ các file sách mà thư viện đã số hóa. Data là file dữ liệu lưu trữ khi chạy đoạn Script.
Hãy thực hiện các mô tả sau để hoàn thành những yêu cầu như trên:

Câu 1: xây hàm lietke() để liệt kê toàn bộ tên quyển sách trong thư mục Sach và chép toàn bộ dữ liệu vào file Data
Dữ liệu của file Data sau khi hoàn thành sẽ có dạng như sau:
BaoMatMang_TranVanB_2009_NXBTre
ComputerNetwork_Albert_2000_Spring
LapTrinhMang_TranVanB_2005_NXBTre

Hãy lưu ý< trong file Data, mọi quyển sách chỉ nằm trên 1 hàng duy nhất. 
Hàm khi chạy thì gọi : lietke $1 $2

Câu 2: Build hàm thongketacgia():
 - Cho người dùng nhập tên tác giả
 - Hãy thực hiện đếm số sách của tác giả đó và xuất ra thông báo: "Tác giả <tên tác giả> có <tổng số sách> trong thư viện."
Chạy: thongketacgia $2

Câu 3:
Giả định khi nhập dữ liệu co thể xảy ra sai sót: xây hàm doiten():
Cho người dùng nhập tên của sách cũ và tên sách mới. Lưu ý: cấu trúc tên file phải đúng như mô tả
Hãy đổi tên file của quyển sách trong thư mục Sach và cập nhật lại tên trong file Data.
Khi chạy hàm: doiten $1 $2

Câu 4:
xây hàm xoasach() theo:
 - cho người dùng nhập tên của quyển sách đó.
- xóa quyển sách trong thư mục Sach.
- Hãy xóa dòng dữ liệu tương ứng với tên quyển sách trong file Data
 - Lấy thông tin ngày tháng tại thời điểm xóa, gắn vào đầu thông tin của quyển sách và chép dữ liệu này vào cuối file lichsu. File lichsu đã được tạo ra và cố định. Dữ liệu của file lichsu trong trường hợp xóa 2 file BaoMatMang_TranVanB_2009_NXBTre và ComputerNetwork_Albert_2000_Spring có dạng:

Tue May 7 21:02:07 -02 2024 BaoMatMang_TranVanB_2009_NXBTre

Tue May 7 21:02:43 -02 2024 ComputerNetwork_Albert_2000_Spring

Hàm khi chạy trong chương trình Shell : xoasach $1 $2

<<! CODING SECTION >>

Câu 1:

Câu 2:

Câu 3:

Câu 4:

