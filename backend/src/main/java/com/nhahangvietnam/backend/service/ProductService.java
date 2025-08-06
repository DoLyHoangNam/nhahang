package com.nhahangvietnam.backend.service;

import com.nhahangvietnam.backend.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ProductService {
    
    Product createProduct(Product product);
    
    Product updateProduct(Long id, Product productDetails);
    
    void deleteProduct(Long id);
    
    Optional<Product> getProductById(Long id);
    
    Page<Product> getAllProducts(Pageable pageable);
    
    Page<Product> getAvailableProducts(Pageable pageable);
    
    Page<Product> getProductsByCategory(String category, Pageable pageable);
    
    Page<Product> getProductsByBrand(String brand, Pageable pageable);
    
    Page<Product> searchProducts(String keyword, Pageable pageable);
    
    Page<Product> getProductsByPriceRange(Double minPrice, Double maxPrice, Pageable pageable);
    
    List<Product> getProductsByCategory(String category);
    
    List<String> getAllCategories();
    
    List<String> getAllBrands();
} 