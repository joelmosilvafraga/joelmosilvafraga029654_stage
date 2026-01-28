package com.joelmofraga.artists_albums_api.auth.dto;

public class LoginResponse {
    private String token;
    private String tokenType = "Bearer";

    public LoginResponse(String token) { this.token = token; }

    public String getToken() { return token; }
    public String getTokenType() { return tokenType; }
}
