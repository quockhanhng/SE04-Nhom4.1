# SE04-Nhom4.1

## Thành viên trong nhóm:

## Đàm Tiến Hùng - Trưởng nhóm
## Nguyễn Quốc Khánh
## Nguyễn Hồng Linh
## Nguyễn Quang Linh


# 1. Mục tiêu
* Hoàn thành 	dự án cuối kì đạt kết quả tốt nhất
* Nâng cao khả năng làm việc nhóm
* Nâng cao kỹ năng lập trình, xây dựng và phát triển phần mềm
* Nắm được cách hoạt động của các cổng thanh toán (VNPAY, PAYPAL)
* Nắm được nghiệp vụ ngân hàng, quy trình tạo một Order của cổng thanh toán
* Xây dựng một trang thương mại điện tử có chức năng thanh toán qua Payment Gateway

# 2. Giao diện
* Màu sắc chủ đạo của website phải hài hoà, dễ nhìn
    

# 3. Chức năng 
* Đăng ký, Đăng nhập: Để mua, bán hàng trên trang web, khách hàng cần đăng nhập vào tài khoản cá nhân đã được tạo. Khi không đăng nhập, khách hàng chỉ có thể xem mặt hàng trên trang web.
* Chức năng liên quan đến sản phẩm:
    * Thêm, xoá, sửa sản phẩm: Chức năng dành cho người bán hàng
    * Tìm kiếm sản phẩm: Khách hàng nhập tên sản phẩm vào ô tìm kiếm, hệ thống sẽ hiển thị kết quả các mặt hàng có thông tin phù 
    * Xem thông tin chi tiết sản phẩm: Khác hàng chọn vào sản phẩm cần xem thông tin, hệ thống sẽ hiển thị chi tiết thông tin về sản phẩm đó
    *Thêm sản phẩm vào giỏ hàng: Khách hàng nhấn thêm sản phẩm vào giỏ hàng, hệ thống sẽ tiến hành tạo mới giỏ hàng nếu chưa tồn tại, sau đó thêm sản phẩm đã chọn vào giỏ hàng.
* Chức năng liên quan đến giỏ hàng: Chức năng của người mua. Khách hàng có thể quản lý giỏ hàng của bản thân: thêm, xoá, sửa các sản phẩm trong giỏ 
* Chức năng thanh toán: Khách hàng chọn thanh toán giỏ hàng: Thực hiện thanh toán qua cổng thanh toán của VNPAY/PAYPAL
* Chức năng quản lý giao dịch: Chức năng của người mua, người bán - Quản lý lịch sử giao dịch của khách hàng.

# 4. Công nghệ và công cụ sử dụng
## 4.1. Công nghệ
* Ngôn ngữ lập trình: Ruby
* Framework: Ruby on Rails
## 4.2. Công cụ sử dụng
* IDE: RubyMine
* DBMS: MySQL

# 5. Hướng dẫn cài đặt và sử dụng
* Hướng dẫn cài đặt
  1. Cài đặt Ruby (version >= 2.7) 
  2. Cài đặt framework Ruby on Rails (version >= 6.0.0) 
  3. Cài đặt MySQL (version >= 8.0.0)
* Hướng dẫn sử dụng
  1. Clone repo từ github
  2. Run command: bundle install để cài đặt các thư viện được sử dụng dự án, lưu trữ và quản lý ở gemfile
  3.  Setting username password của mysql trong file config config/database.yml
  4. Run command: rails db:create để tạo database.
  5. Run command: rails db:migrate để tạo các bảng, các trường từ file schema.rb vào database trong mysql
  6. Run command: rails server để khởi động server.
     Port mặc định để truy cập server của rails là 3000. Truy cập trang chủ: localhost:3000