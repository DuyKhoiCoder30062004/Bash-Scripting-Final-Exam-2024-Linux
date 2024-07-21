#!/bin/bash
<<Block
lietke(){
  cd $1
  ls -1 > $2
}
thongketacgia(){
  read -p "Moi nhap vao ten tac gia: " tenTacGia
  tongSoSach=$(grep -c "$tenTacGia" Data)
  #In Bash scripting, when you enclose a command within double quotes ("), variables are not expanded inside the quotes. 
  #echo "Tac gia" $tenTacGia "co" "grep -c $tenTacGia $2" "trong thu vien"
  echo "Tac gia $tenTacGia co $tongSoSach cuon sach trong thu vien"
}
doiten(){
     
}
lietke $1 $2
thongketacgia $2

=> Trên đây là ý tưởng ban đầu nhưng về sau có hiệu chỉnh lại toàn bộ bài. 
Block

#!/bin/bash

lietke() {
    local sach_dir=$1
    local data_file=$2

    # Liệt kê toàn bộ file trong thư mục Sach và lưu vào file Data
    # Nếu sử dụng dấu ">>" thì bản chất nó sẽ thêm tên của file mới vào cuối dòng (nhưng như thế thì mỗi 1 lần kích hoạt hàm lietke() thì nó sẽ duplicate lại toàn bộ file có trong folder Sach
    ls "$sach_dir" > "$data_file"
}

thongketacgia() {
    local data_file=$1

    # Yêu cầu người dùng nhập tên tác giả
    # Mục đích của việc xài option -p(prompt) là để thực hiện việc tương tác giữa người dùng và Script (Bản chất là yêu cầu (prompt) từ phía người dùng để nhập từ bàn phím dữ liệu.)
    read -p "Nhập tên tác giả: " tacgia

    # Đếm số sách của tác giả
    # Output của grep là patterns mà nó tìm thấy được, bản thân nó là 1 chuỗi (String) => gán lại cho biến count thì cần phải dùng cú pháp $ ở trước lệnh grep của nó (trích xuất value từ kết quả câu lệnh grep, bỏ sang biến count ) 
    local count=$(grep -c "_${tacgia}_" "$data_file")

    # Xuất ra thông báo
    echo "Tác giả $tacgia có $count quyển sách trong thư viện."
}

doiten() {
    local sach_dir=$1
    local data_file=$2

    # Yêu cầu người dùng nhập tên sách cũ và tên sách mới
    # Prompt người dùng nhập vào data.
    read -p "Nhập tên sách cũ: " old_name
    read -p "Nhập tên sách mới: " new_name

    # Đổi tên file trong thư mục Sach
    # Muốn đổi tên file (sử dụng "cp" hoặc "mv" ) || "mv" thì đổi tên xong thay thế luôn tên của chính file, còn "cp" xảy ra trường hợp copy ra 2 file (1 file cũ và 1 file mới)
    mv "${sach_dir}/${old_name}" "${sach_dir}/${new_name}"

    # Cập nhật tên trong file Data
    # Sử dụng sed, có thể dùng "awk", "grep" tuy nhiên cách dùng sed sẽ nhanh, tiện hơn
    # Option -i có nghĩa: thay đổi nội dung bên trong file ngay lập tức mà không cần phải mở file(đó) lên tinh chỉnh.
    sed -i "s/$old_name/$new_name/" "$data_file"
}

xoasach() {
    local sach_dir=$1
    local data_file=$2
    local lichsu_file="lichsu" # Đặt tên file lịch sử cố định

    # Yêu cầu người dùng nhập tên của quyển sách
    read -p "Nhập tên quyển sách cần xóa: " book_name

    # Kiểm tra xem file sách có tồn tại trong thư mục hay không
    # f option: Force, kiểm tra sự tồn tại của file sách bất kỳ (theo đúng định dạng của 1 file sách đã định sẵn) có trong thư mục tên Sach(giả sử tên gì cũng được).
    # lệnh rm đã định sẵn syntax cho việc này cho nên (yêu cầu nhập đúng, vừa đủ, buộc lòng User phải nhập đúng y chang tên sách_tác giả_năm xuất bản_nhà xuất bản).
    if [ -f "${sach_dir}/${book_name}" ]; then
        # Xóa quyển sách trong thư mục Sach
        rm "${sach_dir}/${book_name}"

        # Xóa dòng dữ liệu tương ứng với tên quyển sách trong file Data
        sed -i "/${book_name}/d" "$data_file"

        # Lấy thông tin ngày tháng tại thời điểm xóa
        # Tương tự cách lấy Output bên trên của Grep
        local current_date=$(date)

        # Ghi thông tin vào cuối file lichsu
        echo "$current_date $book_name" >> "$lichsu_file"

        echo "Đã xóa quyển sách $book_name và cập nhật lịch sử."
    else
        echo "Không tìm thấy quyển sách $book_name trong thư mục $sach_dir."
    fi
}

# Kiểm tra các tham số đầu vào
if [ "$#" -lt 2 ]; then
    echo "Usage: bash thuvien.sh Sach Data"
    exit 1
fi
while true; do
# Lựa chọn tính năng
echo "Hãy lựa chọn tính năng:"
echo "1. Liệt kê danh mục sách và ghi vào file lưu trữ."
echo "2. Thống kê đầu sách của tác giả."
echo "3. Cập nhật tên quyển sách."
echo "4. Xóa 1 quyển sách."
echo "5. Thoát."

read -p "Lựa chọn của bạn: " choice

case $choice in
    1)
        lietke $1 $2
        ;;
    2)
        thongketacgia $2
        ;;
    3)
        doiten $1 $2
        ;;
    4)
        xoasach $1 $2
        ;;
    5)
        echo "Thoát chương trình."
        break
        ;;    
    *)
        echo "Lựa chọn không hợp lệ."
        ;;
esac
done
