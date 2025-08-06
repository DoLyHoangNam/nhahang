# Base image dùng nginx để phục vụ static files
FROM nginx:alpine

# Xóa default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy build từ FE vào nginx folder
COPY nhahangvietnam-main/dist/ /usr/share/nginx/html/

# Copy config nginx (tùy chọn)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
