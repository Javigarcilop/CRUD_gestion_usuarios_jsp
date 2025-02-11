<%-- 
    Document   : criterios
    Created on : 3 feb 2025, 6:46:39 p.m.
    Author     : javigarcia
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="controller.CriterioEvaluacionController, model.CriterioEvaluacion, java.util.List" %>
<%@ page import="controller.ResultadoAprendizajeController, model.ResultadoAprendizaje" %>
<jsp:include page="includes/header.jsp" />

<%
    // Obtener la lista de criterios
    CriterioEvaluacionController criterioController = new CriterioEvaluacionController();
    List<CriterioEvaluacion> criterios = criterioController.listarCriterios();

    // Obtener la lista de Resultados de Aprendizaje para el select
    ResultadoAprendizajeController raController = new ResultadoAprendizajeController();
    List<ResultadoAprendizaje> resultadosAprendizaje = raController.listarResultados();

    String accion = request.getParameter("accion");
    int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : -1;
    String descripcion = request.getParameter("descripcion");
    String resultadoIdStr = request.getParameter("resultado_aprendizaje_id");
    int resultadoId = (resultadoIdStr != null && !resultadoIdStr.isEmpty()) ? Integer.parseInt(resultadoIdStr) : -1;

    if ("insertar".equals(accion) && descripcion != null && !descripcion.isEmpty() && resultadoId != -1) {
        criterioController.insertarCriterio(resultadoId, descripcion);
        response.sendRedirect("criterios.jsp");
    } else if ("editar".equals(accion) && id != -1 && descripcion != null && !descripcion.isEmpty()) {
        criterioController.editarCriterio(id, descripcion);
        response.sendRedirect("criterios.jsp");
    } else if ("eliminar".equals(accion) && id != -1) {
        criterioController.eliminarCriterio(id);
        response.sendRedirect("criterios.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestión de Criterios de Evaluación</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/criterios.css">
  <script>
    function confirmarEliminar() {
        return confirm("¿Estás seguro de que quieres eliminar este criterio?");
    }

    // Función para mostrar el formulario de edición
    function mostrarEdicion(id) {
        document.getElementById("texto-" + id).style.display = "none"; // Oculta la descripción
        document.getElementById("form-" + id).style.display = "inline-flex"; // Muestra el formulario
    }
  </script>
</head>
<body>
  <div class="container mt-5">
    <h1>Gestión de Criterios de Evaluación</h1>

    <table class="table table-striped bg-white">
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
            <td>
                <!-- Nombre visible -->
                <span id="texto-<%= criterio.getId() %>"><%= criterio.getCriterio() %></span>

                <!-- Formulario de edición oculto por defecto -->
                <form id="form-<%= criterio.getId() %>" action="criterios.jsp" method="post" style="display:none;">
                    <input type="hidden" name="accion" value="editar">
                    <input type="hidden" name="id" value="<%= criterio.getId() %>">
                    <input type="text" name="descripcion" value="<%= criterio.getCriterio() %>" required class="form-control form-control-sm" style="width: auto;">
                    <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                </form>
            </td>
            <td>
                <!-- Botón de editar -->
                <button class="btn btn-secondary btn-sm" onclick="mostrarEdicion(<%= criterio.getId() %>)">Editar</button>

                <!-- Formulario de eliminar -->
                <form action="criterios.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= criterio.getId() %>">
                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmarEliminar()">Eliminar</button>
                </form>
            </td>
          </tr>
        <% } %>
      </tbody>
    </table>

    <h2>Agregar Nuevo Criterio</h2>
    <form action="criterios.jsp" method="post">
      <input type="hidden" name="accion" value="insertar">
      <div class="mb-3">
        <label for="resultado_aprendizaje_id" class="form-label">Resultado de Aprendizaje</label>
        <select name="resultado_aprendizaje_id" id="resultado_aprendizaje_id" class="form-control" required>
          <option value="">Seleccione un resultado</option>
          <% for (ResultadoAprendizaje ra : resultadosAprendizaje) { %>
            <option value="<%= ra.getId() %>">
              <%= ra.getDescripcion() %> (Asignatura: <%= ra.getAsignaturaNombre() %>)
            </option>
          <% } %>
        </select>
      </div>
      <div class="mb-3">
        <label for="descripcion" class="form-label">Descripción del Criterio</label>
        <input type="text" name="descripcion" id="descripcion" placeholder="Descripción" required class="form-control mb-2">
      </div>
      <button type="submit" class="btn btn-primary btn-sm">Agregar Criterio</button>
    </form>
  </div>
</body>
</html>
<jsp:include page="includes/footer.jsp" />
