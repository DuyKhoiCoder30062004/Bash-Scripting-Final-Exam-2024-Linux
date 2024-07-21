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
5. Thoát ra chương trình.
   
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
<< Hình ảnh nguyên trạng bên trong folder Sach, có hiển thị file Data và các tên loại sách dưới dạng files.
![image](https://github.com/user-attachments/assets/8a44943a-ef34-4295-920d-178b4160b2f9)
![image](https://github.com/user-attachments/assets/edeae317-a784-435b-85c7-9b5ddcb1a790)
<< File Data (Trước khi chạy hàm lietke)
![image](https://github.com/user-attachments/assets/b837967b-5a9d-47c5-a83c-e87de26773d1)
<< Khi chạy hàm lietke dựa vào lựa chọn 1 trong "Menu"
![image](https://github.com/user-attachments/assets/8e0424d8-2d58-4e57-93fa-573b1a862178)
<< Sau khi thực hiện xong chức năng đầu tiên! 
<< Output #1 
![image](https://github.com/user-attachments/assets/4e0c2310-7461-421d-a54e-623d329fca20)

<< !DONE 1/4 


Câu 2:
<< Trước khi thực hiện chức năng 2 , ta xem lại trong folder Sach có những file gì hiện hành
![image](https://github.com/user-attachments/assets/55d8a65d-115f-41b7-b9c0-acc626a1da8d)
<< Tiến hành thực thi chức năng 2 (( Output #2))
![image](https://github.com/user-attachments/assets/26e45705-9d8d-4c60-91dd-15cbb1e8f0fc)
![image](https://github.com/user-attachments/assets/33c00d5c-8f01-4cdc-8353-4e73da30c1ca)
![image](https://github.com/user-attachments/assets/d884de80-16ca-4a8d-a3c3-5647c54dc2dd)
<< Dễ nhận thấy khi thống kê, nếu xuất hiện tên tác giả đó ở trong thư mục, nếu không xuất hiện, ngay lập tức sẽ ra kết quả "Tác giả ... có 0 quyển sách trong thư viện.

<< !DONE 2/4


Câu 3:
<< Trước khi thực hiện chức năng 3, hãy kiểm tra lại 1 lần nữa những file có bên trong folder Sach
![image](https://github.com/user-attachments/assets/9e86b6e2-0c92-4948-b0ca-a1a0315582e0)
<< Tiến hành thực thi chức năng 3
<< Giả sử quyển sách tên "BaoMatMang_TranVanB_2009_NXBTre" bị sai khi ta đặt tên cho nó, ta chuyển lại từ tên cũ sang tên mới
mà ta muốn. Tuy nhiên, ta cần thay đổi tên theo cú pháp: <Tên sách_Tên tác giả_Năm xuất bản_Nhà xuất bản> (( Theo như đề bài yêu cầu ))
![image](https://github.com/user-attachments/assets/2e10dfd9-071e-4461-9b73-c76221efb2c2)
<< Ảnh sau khi ta đổi tên cho file lẫn trong file "Data", (( Đổi lẫn cả ngoài vào trong ))
<< Output #3
![image](https://github.com/user-attachments/assets/4509c770-bf29-4b5e-9214-e9dd0e03e270)
![image](https://github.com/user-attachments/assets/a0fef844-133a-4318-8b54-95109c952651)
![image](https://github.com/user-attachments/assets/0d12fefe-f522-4cf6-8ee6-1de3be81474b)


<< !DONE 3/4

Câu 4:
<< Trước khi thực hiện chức năng 4, ta cần 1 lần nữa kiểm tra lại trong folder Sach - các files bên trong.
![image](https://github.com/user-attachments/assets/be5761ff-9d2e-4b93-8777-4e622ee8552a)

<< Giả sử ta muốn xóa quyển sách tên là "Linux_Ben_2011_Oxford"
<< Sau khi xóa xong, lịch sử xóa sẽ hiển thị trong file tên "lichsu" , sau đó, nội dung trong file sẽ cập nhật sách bị xóa (dựa theo format đề cho)
![image](https://github.com/user-attachments/assets/eb3f7a4e-d607-4f4d-a23f-94e3a67658c4)
![image](https://github.com/user-attachments/assets/a23edbd7-3629-49e8-ae39-259be7dc1ea2)

<< Ta kiểm tra 1 lần cuối bên trong file "Data" ( Kết quả: quyển sách đã bị xóa )
![image](https://github.com/user-attachments/assets/97d5170e-8d1c-42c3-bea2-ef54a86ead2e)

<< !DONE 4/4

<< The Source Code is inside the thuvien.sh file >>
<< Thanks for your watching, Hope you get valuables from this README.md , feel free to have a say in the Comment!!
<< I hope to see corrections or any contributions that can improve the source code above.
