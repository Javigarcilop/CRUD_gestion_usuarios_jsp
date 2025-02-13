/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ResultadoAprendizajeDAO;
import model.ResultadoAprendizaje;
import java.util.List;

public class ResultadoAprendizajeController {

    private ResultadoAprendizajeDAO resultadoAprendizajeDAO;

    public ResultadoAprendizajeController() {
        resultadoAprendizajeDAO = new ResultadoAprendizajeDAO();
    }

    public List<ResultadoAprendizaje> listarResultados() {
        return resultadoAprendizajeDAO.listarResultados();
    }

    public void insertarResultado(int asignaturaId, String descripcion) {
        ResultadoAprendizaje resultado = new ResultadoAprendizaje(0, asignaturaId, descripcion, null);
        resultadoAprendizajeDAO.insertarResultado(resultado);
    }

    public void editarResultado(int id, String descripcion) {
        ResultadoAprendizaje resultado = new ResultadoAprendizaje(id, 0, descripcion, null);
        resultadoAprendizajeDAO.editarResultado(resultado);
    }

    public void eliminarResultado(int id) {
        resultadoAprendizajeDAO.eliminarResultado(id);
    }
}
