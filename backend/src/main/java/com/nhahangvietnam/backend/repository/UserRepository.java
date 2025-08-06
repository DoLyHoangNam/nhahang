package com.nhahangvietnam.backend.repository;

import com.nhahangvietnam.backend.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    Optional<User> findByUsername(String username);
    
    Optional<User> findByEmail(String email);
    
    Boolean existsByUsername(String username);
    
    Boolean existsByEmail(String email);
    
    Page<User> findByRole(User.ERole role, Pageable pageable);
    
    Page<User> findByIsActive(boolean isActive, Pageable pageable);
} 