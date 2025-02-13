<%-- 
    Document   : header
    Created on : 5 feb 2025, 13:32:39
    Author     : DAW2
--%>

<%-- includes/header.jsp --%>
<%-- includes/header.jsp --%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión Escolar - Inicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome (opcional para iconos) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" 
          integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS personalizados -->
    <link href="css/index.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet"> <!-- Nuevo CSS para estilos del header -->
</head>
<body>
    <!-- Navbar con gradiente azul -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to bottom right, #0288d1, #01579b);">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="<%= request.getContextPath() %>/assets/logo-fp.png" alt="Logo de la empresa" class="logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav" aria-controls="navbarNav" 
                aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="resultados.jsp">Resultados</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="criterios.jsp">Criterios</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
