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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resultados.css">
<script>
    function confirmarEliminar() {
        return confirm("¿Estás seguro de que quieres eliminar este resultado?");
    }

    function mostrarEdicion(id) {
        document.getElementById("texto-" + id).style.display = "none";
        document.getElementById("form-" + id).style.display = "inline-flex";
    }
</script>
<body>
    <div class="container mt-5">
        <h1>Gestión de Resultados de Aprendizaje</h1>

        <%
            String asignaturaActual = "";
            for (ResultadoAprendizaje resultado : resultados) {
                if (!resultado.getAsignaturaNombre().equals(asignaturaActual)) {
                    if (!asignaturaActual.isEmpty()) {
        %>
    </tbody>
</table>
<br>
<%
    }
%>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th colspan="3" class="asignatura-header"><%= resultado.getAsignaturaNombre()%></th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <%
                asignaturaActual = resultado.getAsignaturaNombre();
            }
        %>
        <tr>
            <td><%= resultado.getId()%></td>
            <td>
                <span id="texto-<%= resultado.getId()%>"><%= resultado.getDescripcion()%></span>

                <form id="form-<%= resultado.getId()%>" action="resultados.jsp" method="post" class="inline-form" style="display:none;">
                    <input type="hidden" name="accion" value="editar">
                    <input type="hidden" name="id" value="<%= resultado.getId()%>">
                    <input type="text" name="descripcion" value="<%= resultado.getDescripcion()%>" class="form-control form-control-sm" required>
                    <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                </form>
            </td>
            <td>
                <button class="btn btn-secondary btn-sm" onclick="mostrarEdicion(<%= resultado.getId()%>)">Editar</button>
                <form action="resultados.jsp" method="post" class="inline-form" style="display:inline;">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= resultado.getId()%>">
                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmarEliminar()">Eliminar</button>
                </form>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

<h2>Agregar Nuevo Resultado de Aprendizaje</h2>
<form action="resultados.jsp" method="post">
    <div class="mb-3">
        <label for="asignatura_id" class="form-label">Asignatura</label>
        <select name="asignatura_id" id="asignatura_id" class="form-control" required>
            <option value="">Seleccione una asignatura</option>
            <% for (Asignatura asignatura : asignaturas) {%>
            <option value="<%= asignatura.getId()%>"><%= asignatura.getNombre()%></option>
            <% }%>
        </select>
    </div>
    <div class="mb-3">
        <label for="descripcion" class="form-label">Descripción</label>
        <input type="text" name="descripcion" id="descripcion" placeholder="Descripción del resultado" class="form-control" required>
    </div>
    <input type="hidden" name="accion" value="insertar">
    <!-- Se eliminó la clase w-100 para que el botón sea más pequeño -->
    <button type="submit" class="btn btn-corporativo btn-sm">Agregar Resultado</button>
</form>
</div>
</body>
<jsp:include page="includes/footer.jsp" />
