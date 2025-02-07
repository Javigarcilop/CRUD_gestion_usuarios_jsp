<%-- 
    Document   : asignaturas
    Created on : 3 feb 2025, 6:45:29 p.m.
    Author     : javigarcia
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.AsignaturaController, model.Asignatura, java.util.List" %>
<jsp:include page="includes/header.jsp" />

<%
    AsignaturaController controller = new AsignaturaController();
    List<Asignatura> asignaturas = controller.listarAsignaturas();

    String accion = request.getParameter("accion");
    int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
    String nombre = request.getParameter("nombre");

    if ("insertar".equals(accion)) {
        controller.insertarAsignatura(nombre);
        response.sendRedirect("asignaturas.jsp");
    } else if ("editar".equals(accion)) {
        controller.editarAsignatura(id, nombre);
        response.sendRedirect("asignaturas.jsp");
    } else if ("eliminar".equals(accion)) {
        controller.eliminarAsignatura(id);
        response.sendRedirect("asignaturas.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Asignaturas</title>
    <!-- Enlace al archivo de estilos para asignaturas -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/asignaturas.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Gestión de Asignaturas</h1>

        <!-- Mostrar las asignaturas -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Asignatura asignatura : asignaturas) { %>
                <tr>
                    <td><%= asignatura.getId() %></td>
                    <td><%= asignatura.getNombre() %></td>
                    <td>
                        <form action="asignaturas.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="editar">
                            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
                            <input type="text" name="nombre" value="<%= asignatura.getNombre() %>" required>
                            <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                        </form>
                        <form action="asignaturas.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Formulario para agregar nueva asignatura -->
        <h2>Agregar Nueva Asignatura</h2>
        <form action="asignaturas.jsp" method="post">
            <input type="hidden" name="accion" value="insertar">
            <input type="text" name="nombre" placeholder="Nombre de la Asignatura" required class="form-control mb-2">
            <button type="submit" class="btn btn-primary">Agregar Asignatura</button>
        </form>
    </div>
</body>
</html>

