# BÀI LÀM – HACKATHON 02

- **Mã đề:** 01
- **Họ tên:** [Điền họ tên]
- **Lớp:** [Điền lớp]
- **Link repository:** [Dán link GitHub sau khi upload]
- **Hệ điều hành (Windows/macOS):** Windows

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
# Tại thư mục gốc san-bong-website
Get-Location
Get-ChildItem -Force
Move-Item .\ghi_chu_ban_giao.txt .\docs\ghi_chu_ban_giao.txt
New-Item -ItemType Directory -Name backup
Copy-Item .\data\dat_san_thang_10.xlsx .\backup\dat_san_thang_10.xlsx
Remove-Item .\temp_002.tmp
Set-Location .\logs
Get-ChildItem -Force
Set-Location ..
Get-ChildItem -Recurse -Force
```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text
san-bong-website
|-- .env (file an, giu tai may; khong dua len GitHub)
|-- .env.example
|-- .gitignore
|-- README.md
|-- bai_lam.md
|-- tong_hop.ps1
|-- tong_hop.sh
|-- docs/
|   `-- ghi_chu_ban_giao.txt
|-- data/
|   `-- dat_san_thang_10.xlsx
|-- logs/
|   |-- access.log
|   |-- loi_500.txt
|   `-- tong_hop.txt
|-- backup/
|   `-- dat_san_thang_10.xlsx
|-- evidence/ (luu network.png va console.png sau khi chup)
`-- web/
    |-- index.html
    |-- style.css
    |-- app.js
    `-- images/
        `-- logo-san-bong.png

```

## 4.3. Lọc log truy cập website

### a) Lệnh lọc các dòng status=500

```shell
Select-String -Path .\logs\access.log -Pattern "status=500" | ForEach-Object { $_.Line } | Set-Content .\logs\loi_500.txt

```

### 2 dòng đầu tiên trong logs/loi_500.txt

```text
2026-10-28 08:24:34 POST /api/thanh-toan status=500
2026-10-28 08:28:45 POST /api/thanh-toan status=500
```

### b) Lệnh đếm số dòng status=404 và kết quả

```shell
(Select-String -Path .\logs\access.log -Pattern "status=404").Count

```

```text
4

```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass  # chi chay neu PowerShell chan script
.\tong_hop.ps1
```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO SU CO WEBSITE ===
2026-10-28 08:07:39 GET /tin-tuc status=404
2026-10-28 08:13:01 GET /dat-san-cu status=404
2026-10-28 08:34:07 GET /images/san-7.jpg status=404
2026-10-28 08:57:24 GET /khuyen-mai status=404
6

```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [x] README.md: Heading 1, mô tả có **in đậm** và *in nghiêng*, bảng, code block, task list, blockquote
- [x] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [x] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | --- | --- | --- |
| 1 | Network | `images/logo.png` – request 404 (Not Found) | Sửa đường dẫn thành `images/logo-san-bong.png` |
| 2 | Console | `Uncaught ReferenceError: hienThiBangGia is not defined` | Đổi lời gọi cuối `app.js` thành `hienThiBangGiaSan();` |

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

- **Context:** Khi mở `web/index.html` bằng Chrome/Edge, JavaScript tải từ `web/app.js` nhưng hàm khởi tạo bảng giá được gọi sai tên.

- **Expected:** Bảng giá hiển thị đầy đủ mã sân, loại sân và giá/giờ.

- **Actual:** Bảng giá chỉ hiện hàng tiêu đề, không có dữ liệu; Console báo lỗi tham chiếu hàm không tồn tại.

- **Log:** `Uncaught ReferenceError: hienThiBangGia is not defined` (kiểm tra Console trên máy để chép nguyên văn nếu trình duyệt hiển thị thêm vị trí dòng).


### Câu tìm kiếm Google

```text
site:stackoverflow.com "hienThiBangGia is not defined"

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/dat_san_thang_10.xlsx`, không cần ghi vào đây.
