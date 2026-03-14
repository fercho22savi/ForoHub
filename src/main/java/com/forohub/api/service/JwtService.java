package com.forohub.api.service;

import com.forohub.api.model.Usuario;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
public class JwtService {

    // En producción debe ir en application.properties
    private final String SECRET_KEY = "Zm9yb2h1Yi1zZWNyZXQta2V5LWV4YW1wbGUtZHVtbXktdmFsdWUK";

    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 86400000))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public String extraerUsuario(String jwt) {
        return extraerClaim(jwt, Claims::getSubject);
    }

    public boolean isTokenValid(String jwt, UserDetails userDetails) {
        final String username = extraerUsuario(jwt);
        return (username.equals(userDetails.getUsername()) && !isTokenExpired(jwt));
    }

    private boolean isTokenExpired(String jwt) {
        return extraerClaim(jwt, Claims::getExpiration).before(new Date());
    }

    public <T> T extraerClaim(String jwt, Function<Claims, T> claimsResolver) {
        final Claims claims = extraerTodosLosClaims(jwt);
        return claimsResolver.apply(claims);
    }

    private Claims extraerTodosLosClaims(String jwt) {
        return Jwts.parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(jwt)
                .getBody();
    }

    private Key getSignInKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    public String generarToken(Usuario usuario) {

        Map<String, Object> claims = new HashMap<>();

        // guardar información adicional en el token
        claims.put("id", usuario.getId());
        claims.put("nombre", usuario.getNombre());
        claims.put("email", usuario.getEmail());

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(usuario.getEmail())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 86400000)) // 24 horas
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }
}