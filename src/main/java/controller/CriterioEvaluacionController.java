/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.CriterioEvaluacionDAO;
import model.CriterioEvaluacion;
import java.util.List;

public class CriterioEvaluacionController {

    private CriterioEvaluacionDAO criterioEvaluacionDAO;

    public CriterioEvaluacionController() {
        criterioEvaluacionDAO = new CriterioEvaluacionDAO();
    }

    // Obtener todos los criterios de evaluación
    public List<CriterioEvaluacion> listarCriterios() {
        return criterioEvaluacionDAO.listarCriterios();
    }

    // Insertar un nuevo criterio de evaluación
    public void insertarCriterio(int resultadoAprendizajeId, String criterio) {
        CriterioEvaluacion criterioEvaluacion = new CriterioEvaluacion(0, resultadoAprendizajeId, criterio);  // ID inicializado en 0 para que sea autogenerado
        criterioEvaluacionDAO.insertarCriterio(criterioEvaluacion);
    }

    // Editar un criterio de evaluación
    public void editarCriterio(int id, String criterio) {
        CriterioEvaluacion criterioEvaluacion = new CriterioEvaluacion(id, 0, criterio);  // Aquí asignamos el ID que se pasa y el resto de parámetros
        criterioEvaluacionDAO.editarCriterio(criterioEvaluacion);
    }

    // Eliminar un criterio de evaluación
    public void eliminarCriterio(int id) {
        criterioEvaluacionDAO.eliminarCriterio(id);
    }
}
