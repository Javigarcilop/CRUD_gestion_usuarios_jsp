<%-- 
    Document   : criterios
    Created on : 3 feb 2025, 6:46:39 p.m.
    Author     : javigarcia
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.CriterioEvaluacionController, model.CriterioEvaluacion, java.util.List" %>
<jsp:include page="includes/header.jsp" />

<%
    CriterioEvaluacionController controller = new CriterioEvaluacionController();
    List<CriterioEvaluacion> criterios = controller.listarCriteriosEvaluacion();

    String accion = request.getParameter("accion");
    int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
    String descripcion = request.getParameter("descripcion");

    if ("insertar".equals(accion) && descripcion != null && !descripcion.isEmpty()) {
        controller.insertarCriterioEvaluacion(descripcion);
        response.sendRedirect("criterios.jsp");
    } else if ("editar".equals(accion) && id != -1 && descripcion != null && !descripcion.isEmpty()) {
        controller.editarCriterioEvaluacion(id, descripcion);
        response.sendRedirect("criterios.jsp");
    } else if ("eliminar".equals(accion) && id != -1) {
        controller.eliminarCriterioEvaluacion(id);
        response.sendRedirect("criterios.jsp");
    }
%>

<!DOCTYPE html
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Criterios de Evaluación</title>
</head>
<body>
    <div class="container mt-5">
        <h1>Gestión de Criterios de Evaluación</h1>

        <!-- Mostrar los criterios -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (CriterioEvaluacion criterio : criterios) { %>
                <tr>
                    <td><%= criterio.getId() %></td>
                    <td><%= criterio.getDescripcion() %></td>
                    <td>
                        <!-- Formulario de edición -->
                        <form action="criterios.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="editar">
                            <input type="hidden" name="id" value="<%= criterio.getId() %>">
                            <input type="text" name="descripcion" value="<%= criterio.getDescripcion() %>" required>
                            <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                        </form>

                        <!-- Formulario de eliminación -->
                        <form action="criterios.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= criterio.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Formulario para agregar nuevo criterio -->
        <h2>Agregar Nuevo Criterio</h2>
        <form action="criterios.jsp" method="post">
            <input type="hidden" name="accion" value="insertar">
            <input type="text" name="descripcion" placeholder="Descripción del Criterio" required class="form-control mb-2">
            <button type="submit" class="btn btn-primary">Agregar Criterio</button>
        </form>
    </div>
</body>
</html>
