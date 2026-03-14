package com.forohub.api.service;

import com.forohub.api.model.Usuario;
import com.forohub.api.repository.UsuarioRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public class UsuarioService {
    @Autowired
    private UsuarioRepository repository;

    public List<Usuario> getAllUsers() {
        return null;
    }

    public Usuario getUserById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con ID: " + id));
    }

    public Usuario getUserByEmail(String email) {
        return repository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuario no encontrado con email: " + email));
    }

    public void deleteUser(Long id) {
        if (!repository.existsById(id)) {
            throw new EntityNotFoundException("No se puede eliminar: el usuario no existe.");
        }
        repository.deleteById(id);
    }

}
