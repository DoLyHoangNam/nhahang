# Nhà Hàng Việt Nam - Backend

Backend Spring Boot cho ứng dụng nhà hàng Việt Nam với kiến trúc MVC.

## Công nghệ sử dụng

- **Spring Boot 3.2.0**
- **Spring Security** với JWT
- **Spring Data JPA**
- **SQLite Database**
- **Maven**

## Cấu trúc dự án

```
backend/
├── src/main/java/com/nhahangvietnam/backend/
│   ├── config/                 # Cấu hình Spring Security
│   ├── controller/             # REST Controllers
│   ├── dto/                   # Data Transfer Objects
│   ├── model/                 # Entity classes
│   ├── repository/            # Data Access Layer
│   ├── security/              # JWT Security
│   ├── service/               # Business Logic Layer
│   └── NhahangVietnamBackendApplication.java
├── src/main/resources/
│   └── application.properties
└── pom.xml
```

## Yêu cầu hệ thống

- Java 17 hoặc cao hơn
- Maven 3.6+

## Cài đặt và chạy

### 1. SQLite Database

SQLite database sẽ được tạo tự động khi chạy ứng dụng lần đầu tiên. File database sẽ được tạo tại: `nhahangvietnam.db`

### 2. Cấu hình database

Cấu hình SQLite đã được thiết lập sẵn trong `src/main/resources/application.properties`. Không cần thay đổi gì thêm.

### 3. Chạy ứng dụng

```bash
# Di chuyển vào thư mục backend
cd backend

# Build project
mvn clean install

# Chạy ứng dụng
mvn spring-boot:run
```

Ứng dụng sẽ chạy tại: `http://localhost:8080`

## API Endpoints

### Authentication
- `POST /api/auth/signin` - Đăng nhập
- `POST /api/auth/signup` - Đăng ký
- `POST /api/auth/logout` - Đăng xuất

### Products
- `GET /api/product/all` - Lấy tất cả sản phẩm
- `GET /api/product/detail/{id}` - Lấy chi tiết sản phẩm
- `GET /api/all-products` - Lấy sản phẩm có phân trang
- `POST /api/product/add` - Thêm sản phẩm (ADMIN)
- `PUT /api/product/{id}` - Cập nhật sản phẩm (ADMIN)
- `DELETE /api/product/{id}` - Xóa sản phẩm (ADMIN)
- `GET /api/product/category/{category}` - Lấy sản phẩm theo danh mục
- `GET /api/product/search` - Tìm kiếm sản phẩm
- `GET /api/product/categories` - Lấy tất cả danh mục
- `GET /api/product/brands` - Lấy tất cả thương hiệu

### Users (ADMIN only)
- `GET /api/user/all` - Lấy tất cả users
- `GET /api/user/{id}` - Lấy user theo ID
- `PUT /api/user/{id}` - Cập nhật user
- `DELETE /api/user/{id}` - Xóa user
- `POST /api/user/{id}/block` - Chặn user
- `POST /api/user/{id}/unblock` - Bỏ chặn user

## Database Schema

### Users Table
- id (Primary Key)
- username (Unique)
- password (Encrypted)
- email (Unique)
- fullName
- phone
- address
- role (USER/ADMIN)
- isActive

### Products Table
- id (Primary Key)
- name
- description
- price
- image
- category
- brand
- size
- isAvailable
- stockQuantity
- createdAt
- updatedAt

### Orders Table
- id (Primary Key)
- user_id (Foreign Key)
- totalAmount
- status (PENDING/CONFIRMED/SHIPPING/DELIVERED/CANCELLED)
- shippingAddress
- phone
- customerName
- orderDate
- updatedAt

### Order_Items Table
- id (Primary Key)
- order_id (Foreign Key)
- product_id (Foreign Key)
- quantity
- price
- size

## JWT Authentication

Backend sử dụng JWT (JSON Web Token) cho authentication:

1. User đăng nhập qua `/api/auth/signin`
2. Server trả về JWT token
3. Client gửi token trong header `Authorization: Bearer <token>`
4. Server validate token cho các request được bảo vệ

## CORS Configuration

Backend đã được cấu hình CORS để cho phép frontend React (chạy trên port 5173) truy cập API.

## Tài khoản mặc định

Sau khi chạy ứng dụng lần đầu, bạn có thể tạo tài khoản admin qua API signup hoặc thêm trực tiếp vào database. 