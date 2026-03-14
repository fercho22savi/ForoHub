package com.forohub.api.exception;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // ------------------------------
    // Maneja errores 404 (ID no encontrado)
    // ------------------------------
    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<Void> manejarError404(EntityNotFoundException e) {
        return ResponseEntity.notFound().build();
    }

    // ------------------------------
    // Maneja errores 400 (Validaciones de Bean Validation como @NotBlank)
    // ------------------------------
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<List<DatosErrorValidacion>> manejarError400(MethodArgumentNotValidException e) {
        List<DatosErrorValidacion> errores = e.getFieldErrors().stream()
                .map(DatosErrorValidacion::new)
                .toList();
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errores);
    }

    // ------------------------------
    // Maneja errores de lógica de negocio
    // ------------------------------
    @ExceptionHandler(IllegalStateException.class)
    public ResponseEntity<String> manejarErrorDeNegocio(IllegalStateException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }

    // ------------------------------
    // DTO interno para formatear errores de validación
    // ------------------------------
    private record DatosErrorValidacion(String campo, String error) {
        public DatosErrorValidacion(FieldError fe) {
            this(fe.getField(), fe.getDefaultMessage());
        }
    }
}