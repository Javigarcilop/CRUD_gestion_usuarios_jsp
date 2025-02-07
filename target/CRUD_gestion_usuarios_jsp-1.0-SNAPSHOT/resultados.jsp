<%-- 
    Document   : resultados
    Created on : 3 feb 2025, 6:46:50 p.m.
    Author     : javigarcia
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.ResultadoAprendizajeController, controller.AsignaturaController, model.ResultadoAprendizaje, model.Asignatura, java.util.List" %>
<jsp:include page="includes/header.jsp" />
<%
    ResultadoAprendizajeController resultadoController = new ResultadoAprendizajeController();
    AsignaturaController asignaturaController = new AsignaturaController();
    
    List<ResultadoAprendizaje> resultados = resultadoController.listarResultados();
    List<Asignatura> asignaturas = asignaturaController.listarAsignaturas();

    String accion = request.getParameter("accion");
    int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
    String descripcion = request.getParameter("descripcion");
    int asignaturaId = request.getParameter("asignatura_id") != null ? Integer.parseInt(request.getParameter("asignatura_id")) : -1;

    if ("insertar".equals(accion) && descripcion != null && asignaturaId != -1) {
        resultadoController.insertarResultado(asignaturaId, descripcion);
        response.sendRedirect("resultados.jsp");
    } else if ("editar".equals(accion) && id != -1 && descripcion != null) {
        resultadoController.editarResultado(id, descripcion);
        response.sendRedirect("resultados.jsp");
    } else if ("eliminar".equals(accion) && id != -1) {
        resultadoController.eliminarResultado(id);
        response.sendRedirect("resultados.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Resultados de Aprendizaje</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resultados.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Gestión de Resultados de Aprendizaje</h1>

        <% 
            // Variable para mantener el nombre de la asignatura actual
            String asignaturaActual = "";
            for (ResultadoAprendizaje resultado : resultados) {
                // Si la asignatura cambia, mostramos un nuevo encabezado para esa asignatura
                if (!resultado.getAsignaturaNombre().equals(asignaturaActual)) {
                    if (!asignaturaActual.isEmpty()) { 
                        // Cerramos la tabla anterior
                    %>
                        </tbody>
                    </table>
                    <br>
                    <% } %>
                    <h2 class="mb-3"><%= resultado.getAsignaturaNombre() %></h2>
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Descripción</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                    asignaturaActual = resultado.getAsignaturaNombre(); // Actualizamos el nombre de la asignatura actual
                }
        %>
            <tr>
                <td><%= resultado.getId() %></td>
                <td><%= resultado.getDescripcion() %></td>
                <td>
                    <!-- Botones de editar y eliminar al lado del input de editar -->
                    <form action="resultados.jsp" method="post" class="inline-form">
                        <input type="hidden" name="accion" value="editar">
                        <input type="hidden" name="id" value="<%= resultado.getId() %>">
                        <input type="text" name="descripcion" value="<%= resultado.getDescripcion() %>" class="form-control form-control-sm" required>
                        <button type="submit" class="btn btn-primary btn-sm">Editar</button>
                    </form>

                    <form action="resultados.jsp" method="post" class="inline-form">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="<%= resultado.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                </td>
            </tr>
        <% } %>
            </tbody>
        </table>

        <h2 class="mt-5">Agregar Nuevo Resultado de Aprendizaje</h2>
        <!-- Formulario sin contenedor adicional -->
        <form action="resultados.jsp" method="post">
            <div class="mb-3">
                <label for="asignatura_id" class="form-label">Asignatura</label>
                <select name="asignatura_id" id="asignatura_id" class="form-control" required>
                    <option value="">Seleccione una asignatura</option>
                    <% for (Asignatura asignatura : asignaturas) { %>
                        <option value="<%= asignatura.getId() %>"><%= asignatura.getNombre() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <input type="text" name="descripcion" id="descripcion" placeholder="Descripción del resultado" class="form-control" required>
            </div>

            <input type="hidden" name="accion" value="insertar">

            <!-- Botón de agregar con color corporativo y tamaño pequeño -->
            <button type="submit" class="btn btn-corporativo w-100 btn-sm">Agregar Resultado</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

