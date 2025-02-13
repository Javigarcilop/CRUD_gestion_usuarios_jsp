<%-- 
    Document   : index
    Created on : 3 feb 2025, 6:45:22?p.m.
    Author     : javigarcia
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />

<div class="hero mb-5">
  <div class="hero-content text-center">
    <h1 class="display-4">Bienvenido a tu Dashboard Escolar</h1>
    <p class="lead">Gestiona asignaturas, resultados y criterios en un entorno moderno y eficiente.</p>
  </div>
</div>

<div class="container">
  <div class="row mb-4">
    <div class="col-md-4 mb-4">
      <div class="card shadow-sm h-100">
        <div class="card-body text-center">
          <h5 class="card-title">Asignaturas</h5>
          <p class="card-text">Administra y organiza tus asignaturas.</p>
          <a href="asignaturas.jsp" class="btn btn-outline-primary">Ver Asignaturas</a>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card shadow-sm h-100">
        <div class="card-body text-center">
          <h5 class="card-title">Resultados de Aprendizaje</h5>
          <p class="card-text">Consulta y actualiza los resultados.</p>
          <a href="resultados.jsp" class="btn btn-outline-success">Ver Resultados</a>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card shadow-sm h-100">
        <div class="card-body text-center">
          <h5 class="card-title">Criterios de Evaluación</h5>
          <p class="card-text">Revisa y administra los criterios de evaluación.</p>
          <a href="criterios.jsp" class="btn btn-outline-warning">Ver Criterios</a>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card shadow-sm mb-4">
        <div class="card-body">
          <h5 class="card-title">Estadísticas Generales</h5>
          <canvas id="dashboardChart" width="400" height="150"></canvas>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="includes/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  var ctx = document.getElementById('dashboardChart').getContext('2d');
  var dashboardChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['Asignaturas', 'Resultados', 'Criterios'],
          datasets: [{
              label: 'Cantidad',
              data: [0, 0, 0], 
              backgroundColor: [
                  'rgba(2, 136, 209, 0.8)',
                  'rgba(76, 175, 80, 0.8)',
                  'rgba(255, 152, 0, 0.8)'
              ],
              borderColor: [
                  'rgba(2, 136, 209, 1)',
                  'rgba(76, 175, 80, 1)',
                  'rgba(255, 152, 0, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
</script>
