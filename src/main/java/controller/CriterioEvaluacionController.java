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

    public List<CriterioEvaluacion> listarCriterios() {
        return criterioEvaluacionDAO.listarCriterios();
    }

    public void insertarCriterio(int resultadoAprendizajeId, String criterio) {
        CriterioEvaluacion criterioEvaluacion = new CriterioEvaluacion(0, resultadoAprendizajeId, criterio);
        criterioEvaluacionDAO.insertarCriterio(criterioEvaluacion);
    }

    public void editarCriterio(int id, String criterio) {
        CriterioEvaluacion criterioEvaluacion = new CriterioEvaluacion(id, 0, criterio);
        criterioEvaluacionDAO.editarCriterio(criterioEvaluacion);
    }

    public void eliminarCriterio(int id) {
        criterioEvaluacionDAO.eliminarCriterio(id);
    }
}
