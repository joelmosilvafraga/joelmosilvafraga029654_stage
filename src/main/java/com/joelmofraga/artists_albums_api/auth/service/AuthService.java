package com.joelmofraga.artists_albums_api.auth.service;

import com.joelmofraga.artists_albums_api.auth.domain.AppUser;
import com.joelmofraga.artists_albums_api.auth.domain.Role;
import com.joelmofraga.artists_albums_api.auth.dto.LoginRequest;
import com.joelmofraga.artists_albums_api.auth.dto.LoginResponse;
import com.joelmofraga.artists_albums_api.auth.dto.RegisterRequest;
import com.joelmofraga.artists_albums_api.auth.repository.RoleRepository;
import com.joelmofraga.artists_albums_api.auth.repository.UserRepository;
import com.joelmofraga.artists_albums_api.security.JwtService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {

    private static final String DEFAULT_ROLE_NAME = "USER"; // no banco: USER (sem ROLE_)
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthService(
            AuthenticationManager authenticationManager,
            JwtService jwtService,
            UserRepository userRepository,
            RoleRepository roleRepository,
            PasswordEncoder passwordEncoder
    ) {
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional(readOnly = true)
    public LoginResponse login(LoginRequest request) {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
            );
        } catch (AuthenticationException ex) {
            // evita vazar detalhes; mantém resposta padrão de credencial inválida
            throw new BadCredentialsException("Invalid credentials");
        }

        AppUser user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        String token = jwtService.generateToken(user);
        return new LoginResponse(token);
    }

    @Transactional
    public void register(RegisterRequest request) {
        String username = request.getUsername();

        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Username is required");
        }
        if (request.getPassword() == null || request.getPassword().isEmpty()) {
            throw new IllegalArgumentException("Password is required");
        }

        if (userRepository.existsByUsername(username)) {
            throw new IllegalStateException("Username already exists");
        }

        // Role no banco deve ser: USER (sem prefixo ROLE_)
        Role roleUser = roleRepository.findByName(DEFAULT_ROLE_NAME)
                .orElseGet(() -> roleRepository.save(new Role(DEFAULT_ROLE_NAME)));

        AppUser user = new AppUser();
        user.setUsername(username);
        user.setPasswordHash(passwordEncoder.encode(request.getPassword())); // <-- correto pro seu AppUser

        // vínculo N:N via tabela user_role (UserRole) usando o helper
        user.addRole(roleUser);

        userRepository.save(user);
    }
}
