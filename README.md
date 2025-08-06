# Nhà Hàng Việt Nam - Full Stack Project

Dự án website nhà hàng Việt Nam với frontend React và backend Spring Boot.

## Cấu trúc dự án

```
nhahangvietnam-main/
├── nhahangvietnam-main/     # Frontend React
│   ├── src/
│   │   ├── admin/           # Admin dashboard
│   │   ├── api/             # API calls
│   │   ├── components/      # React components
│   │   ├── pages/           # Main pages
│   │   ├── redux/           # State management
│   │   └── ...
│   ├── package.json
│   └── ...
└── backend/                 # Backend Spring Boot
    ├── src/main/java/
    │   ├── config/          # Spring Security config
    │   ├── controller/      # REST Controllers
    │   ├── dto/            # Data Transfer Objects
    │   ├── model/          # Entity classes
    │   ├── repository/     # Data Access Layer
    │   ├── security/       # JWT Security
    │   ├── service/        # Business Logic Layer
    │   └── ...
    ├── pom.xml
    └── README.md
```

## Công nghệ sử dụng

### Frontend
- **React 18** với Vite
- **Redux Toolkit** cho state management
- **React Router** cho routing
- **Axios** cho HTTP requests
- **Bootstrap** cho UI components
- **Chart.js** cho biểu đồ

### Backend
- **Spring Boot 3.2.0**
- **Spring Security** với JWT
- **Spring Data JPA**
- **SQLite Database**
- **Maven**

## Cài đặt và chạy

### Yêu cầu hệ thống
- Node.js 16+ và npm
- Java 17+
- Maven 3.6+

### 1. SQLite Database

SQLite database sẽ được tạo tự động khi chạy ứng dụng lần đầu tiên. File database sẽ được tạo tại: `backend/nhahangvietnam.db`

### 2. Cấu hình Backend

Cấu hình SQLite đã được thiết lập sẵn. Không cần thay đổi gì thêm.

### 3. Chạy Backend
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

Backend sẽ chạy tại: `http://localhost:8080`

### 4. Chạy Frontend
```bash
cd nhahangvietnam-main
npm install
npm run dev
```

Frontend sẽ chạy tại: `http://localhost:5173`

## Tính năng chính

### Frontend
- **Trang chủ**: Hiển thị sản phẩm nổi bật, banner
- **Cửa hàng**: Xem và tìm kiếm sản phẩm
- **Chi tiết sản phẩm**: Xem thông tin chi tiết
- **Giỏ hàng**: Thêm, xóa, cập nhật sản phẩm
- **Thanh toán**: Xử lý đơn hàng
- **Đăng nhập/Đăng ký**: Authentication
- **Admin Dashboard**: Quản lý sản phẩm, users, đơn hàng

### Backend
- **Authentication**: JWT-based authentication
- **User Management**: CRUD operations cho users
- **Product Management**: CRUD operations cho products
- **Order Management**: Xử lý đơn hàng
- **Security**: Role-based access control
- **API Documentation**: RESTful APIs

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

### Users (ADMIN only)
- `GET /api/user/all` - Lấy tất cả users
- `PUT /api/user/{id}` - Cập nhật user
- `DELETE /api/user/{id}` - Xóa user
- `POST /api/user/{id}/block` - Chặn user
- `POST /api/user/{id}/unblock` - Bỏ chặn user

## Database Schema

### Users
- id, username, password, email, fullName, phone, address, role, isActive

### Products
- id, name, description, price, image, category, brand, size, isAvailable, stockQuantity

### Orders
- id, user_id, totalAmount, status, shippingAddress, phone, customerName, orderDate

### Order_Items
- id, order_id, product_id, quantity, price, size

## Kiến trúc MVC

### Model (Entity Classes)
- `User.java` - Entity cho user
- `Product.java` - Entity cho sản phẩm
- `Order.java` - Entity cho đơn hàng
- `OrderItem.java` - Entity cho chi tiết đơn hàng

### View (Controllers)
- `AuthController.java` - Xử lý authentication
- `ProductController.java` - Xử lý sản phẩm
- `UserController.java` - Xử lý users

### Controller (Services)
- `UserService.java` - Business logic cho users
- `ProductService.java` - Business logic cho products

## Security

- **JWT Authentication**: Token-based authentication
- **Role-based Access Control**: USER và ADMIN roles
- **Password Encryption**: BCrypt password hashing
- **CORS Configuration**: Cho phép frontend truy cập

## Deployment

### Backend
```bash
cd backend
mvn clean package
java -jar target/backend-0.0.1-SNAPSHOT.jar
```

### Frontend
```bash
cd nhahangvietnam-main
npm run build
```

## Tài khoản mặc định

Sau khi chạy ứng dụng, tạo tài khoản admin qua API signup hoặc thêm trực tiếp vào database.

## Hỗ trợ

Nếu gặp vấn đề, hãy kiểm tra:
1. Java 17+ đã được cài đặt
2. Node.js và npm đã được cài đặt
3. Port 8080 và 5173 không bị sử dụng bởi ứng dụng khác
4. File `nhahangvietnam.db` có thể được tạo trong thư mục backend 