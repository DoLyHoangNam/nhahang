# Nhà Hàng Việt Nam - E-commerce Website

## Mô tả
Website bán hàng trực tuyến với backend Java Spring Boot và frontend React.

## Cấu trúc dự án
- `backend/` - Java Spring Boot API
- `nhahangvietnam-main/` - React Frontend

## Jenkins CI/CD Setup

### Cấu hình Jenkins Pipeline
- **Repository:** https://github.com/DoLyHoangNam/nhahang
- **Pipeline:** nhahang-pipeline
- **Webhook:** Tự động trigger khi push code
- **Build:** Backend Java + Frontend React

### Các stage trong pipeline:
1. **Clone** - Clone code từ GitHub
2. **Check Environment** - Kiểm tra tools
3. **Build Backend** - Build Java Spring Boot
4. **Test Backend** - Chạy unit tests
5. **Build Frontend** - Build React
6. **Package Backend** - Tạo JAR file
7. **Archive Artifacts** - Lưu trữ artifacts
8. **Deploy** - Chuẩn bị deploy

### Cách sử dụng:
```bash
# Chỉ cần push code
git add .
git commit -m "Update code"
git push

# Jenkins sẽ tự động:
# - Nhận webhook từ GitHub
# - Trigger pipeline
# - Build và test code
# - Deploy nếu thành công
```

## Cài đặt và chạy

### Backend
```bash
cd backend
mvn spring-boot:run
```

### Frontend
```bash
cd nhahangvietnam-main
npm install
npm run dev
```

## Công nghệ sử dụng
- **Backend:** Java Spring Boot, JPA, Security, JWT
- **Frontend:** React, Redux, Vite
- **Database:** SQLite
- **CI/CD:** Jenkins, GitHub Webhooks 