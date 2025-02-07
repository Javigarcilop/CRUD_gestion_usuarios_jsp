<%-- 
    Document   : index
    Created on : 3 feb 2025, 6:45:22?p.m.
    Author     : javigarcia
--%>

<%-- index.jsp --%>
<jsp:include page="includes/header.jsp" />

<!-- Sección Hero minimalista -->
<div class="hero mb-5">
    <div class="hero-content text-center">
        <h1 class="display-4">Bienvenido al Sistema de Gestión Escolar</h1>
        <p class="lead">Un enfoque limpio y moderno para la administración académica.</p>
    </div>
</div>

<!-- Tarjetas para cada sección -->
<div class="row">
    <!-- Tarjeta para Asignaturas -->
    <div class="col-md-4 mb-4">
        <div class="card shadow-sm h-100">
            <div class="card-body text-center">
                <h5 class="card-title">Asignaturas</h5>
                <a href="asignaturas.jsp" class="btn btn-outline-primary">Ver Asignaturas</a>
            </div>
        </div>
    </div>
    <!-- Tarjeta para Resultados de Aprendizaje -->
    <div class="col-md-4 mb-4">
        <div class="card shadow-sm h-100">
            <div class="card-body text-center">
                <h5 class="card-title">Resultados de Aprendizaje</h5>
                <a href="resultados.jsp" class="btn btn-outline-success">Ver Resultados</a>
            </div>
        </div>
    </div>
    <!-- Tarjeta para Criterios de Evaluación -->
    <div class="col-md-4 mb-4">
        <div class="card shadow-sm h-100">
            <div class="card-body text-center">
                <h5 class="card-title">Criterios de Evaluación</h5>
                <a href="criterios.jsp" class="btn btn-outline-warning">Ver Criterios</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
