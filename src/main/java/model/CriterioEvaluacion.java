/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class CriterioEvaluacion {
    private int id;
    private int resultadoAprendizajeId;
    private String criterio;

    public CriterioEvaluacion(int id, int resultadoAprendizajeId, String criterio) {
        this.id = id;
        this.resultadoAprendizajeId = resultadoAprendizajeId;
        this.criterio = criterio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResultadoAprendizajeId() {
        return resultadoAprendizajeId;
    }

    public void setResultadoAprendizajeId(int resultadoAprendizajeId) {
        this.resultadoAprendizajeId = resultadoAprendizajeId;
    }

    public String getCriterio() {
        return criterio;
    }

    public void setCriterio(String criterio) {
        this.criterio = criterio;
    }
}

