package com.forohub.api.controller;

import com.forohub.api.dto.LoginRequestDTO;
import com.forohub.api.service.AuthService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestDTO request) {

        String token = authService.login(request);

        return ResponseEntity.ok(token);
    }
}