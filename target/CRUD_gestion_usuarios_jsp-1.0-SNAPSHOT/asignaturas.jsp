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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/asignaturas.css">
    <script>
        function confirmarEliminar() {
            return confirm("¿Estás seguro de que quieres eliminar esta asignatura?");
        }

        function mostrarEdicion(id) {
            document.getElementById("texto-" + id).style.display = "none";
            document.getElementById("form-" + id).style.display = "inline-flex";
        }
    </script>
<body>
    <div class="container mt-5">
        <h1>Gestión de Asignaturas</h1>

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
                    <td>
                        <!-- Nombre visible -->
                        <span id="texto-<%= asignatura.getId() %>"><%= asignatura.getNombre() %></span>

                        <!-- Formulario de edición oculto por defecto -->
                        <form id="form-<%= asignatura.getId() %>" action="asignaturas.jsp" method="post" style="display:none;">
                            <input type="hidden" name="accion" value="editar">
                            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
                            <input type="text" name="nombre" value="<%= asignatura.getNombre() %>" required class="form-control form-control-sm" />
                            <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                        </form>
                    </td>
                    <td>
                        <!-- Botón de editar -->
                        <button class="btn btn-secondary btn-sm" onclick="mostrarEdicion(<%= asignatura.getId() %>)">Editar</button>

                        <!-- Formulario de eliminar -->
                        <form action="asignaturas.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= asignatura.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmarEliminar()">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <h2>Agregar Nueva Asignatura</h2>
        <form action="asignaturas.jsp" method="post">
            <input type="hidden" name="accion" value="insertar">
            <input type="text" name="nombre" placeholder="Nombre de la Asignatura" required class="form-control mb-2">
            <button type="submit" class="btn btn-primary">Agregar Asignatura</button>
        </form>
    </div>
</body>
<jsp:include page="includes/footer.jsp" />

