# 🚀 ForoHub API

API REST desarrollada con **Spring Boot** que permite gestionar un sistema de foro donde los usuarios pueden crear tópicos, responder discusiones y administrar perfiles.

Este proyecto implementa buenas prácticas de arquitectura backend utilizando **Spring Security, JWT, JPA, Flyway y MySQL**.

---

# 📌 Tecnologías utilizadas

* ☕ Java 17
* 🚀 Spring Boot
* 🔐 Spring Security
* 🪪 JWT Authentication
* 🗄️ Spring Data JPA
* 🐬 MySQL
* 🛫 Flyway (migraciones de base de datos)
* 📦 Maven
* 🧠 Lombok

---

# 🏗️ Arquitectura del proyecto

El proyecto sigue una arquitectura por capas:

```
src/main/java/com/forohub/api

├── controller
├── dto
├── model
├── repository
├── security
├── service
└── ForoHubApplication.java
```

### Descripción

* **controller** → Expone los endpoints REST
* **dto** → Objetos de transferencia de datos
* **model** → Entidades JPA
* **repository** → Interfaces de acceso a datos
* **security** → Configuración de seguridad y JWT
* **service** → Lógica de negocio

---

# 🗄️ Base de datos

El proyecto utiliza **MySQL** con migraciones automáticas mediante **Flyway**.

### Migraciones incluidas

```
V1__crear_tabla_usuarios.sql
V2__crear_tabla_perfiles.sql
V3__crear_tabla_usuario_perfil.sql
V4__crear_tabla_topicos.sql
V5__crear_tabla_respuestas.sql
V6__insertar_perfiles_iniciales.sql
V7__insertar_usuario_admin.sql
```

---

# ⚙️ Configuración

Archivo `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/forohub
spring.datasource.username=root
spring.datasource.password=root123

spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=true
```

---

# 🔐 Autenticación

La API utiliza **JWT (JSON Web Token)** para autenticar usuarios.

Flujo de autenticación:

1. Usuario envía credenciales al endpoint `/login`
2. El sistema valida usuario y contraseña
3. Se genera un **token JWT**
4. El token se usa en los endpoints protegidos

Ejemplo de header:

```
Authorization: Bearer TOKEN_JWT
```

---

# 📡 Endpoints principales

### Autenticación

```
POST /login
```

### Tópicos

```
GET /topicos
POST /topicos
GET /topicos/{id}
PUT /topicos/{id}
DELETE /topicos/{id}
```

### Respuestas

```
POST /respuestas
GET /respuestas
```

---

# ▶️ Cómo ejecutar el proyecto

### 1️⃣ Clonar repositorio

```
git clone https://github.com/fercho22savi/ForoHub.git
```

### 2️⃣ Entrar al proyecto

```
cd forohub
```

### 3️⃣ Ejecutar aplicación

```
mvn spring-boot:run
```

---

# 🧪 Probar API

Puedes probar los endpoints con:

* Postman
* Insomnia
* Thunder Client

Base URL:

```
http://localhost:8080
```

---

# 👨‍💻 Autor

**Fernando**

Desarrollador backend enfocado en tecnologías Java y Spring.

GitHub:
https://github.com/fercho22savi

---

# ⭐ Contribuciones

Las contribuciones son bienvenidas.

1. Fork del proyecto
2. Crear una nueva rama
3. Realizar cambios
4. Enviar Pull Request

---

# 📄 Licencia

Este proyecto se distribuye bajo licencia MIT.
