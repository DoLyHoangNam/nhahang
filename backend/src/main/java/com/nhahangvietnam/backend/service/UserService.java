package com.nhahangvietnam.backend.service;

import com.nhahangvietnam.backend.dto.SignupRequest;
import com.nhahangvietnam.backend.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface UserService {
    
    User createUser(SignupRequest signupRequest);
    
    Optional<User> findByUsername(String username);
    
    Optional<User> findByEmail(String email);
    
    Boolean existsByUsername(String username);
    
    Boolean existsByEmail(String email);
    
    Page<User> getAllUsers(Pageable pageable);
    
    Page<User> getUsersByRole(User.ERole role, Pageable pageable);
    
    Page<User> getActiveUsers(Pageable pageable);
    
    User updateUser(Long id, User userDetails);
    
    void deleteUser(Long id);
    
    User blockUser(Long id);
    
    User unblockUser(Long id);
} 