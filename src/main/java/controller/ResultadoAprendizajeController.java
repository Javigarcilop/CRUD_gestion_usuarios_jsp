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

    // Obtener todos los resultados de aprendizaje
    public List<ResultadoAprendizaje> listarResultados() {
        return resultadoAprendizajeDAO.listarResultados();
    }

    // Insertar un nuevo resultado de aprendizaje
    public void insertarResultado(int asignaturaId, String descripcion) {
        ResultadoAprendizaje resultado = new ResultadoAprendizaje(0, asignaturaId, descripcion, null);
        resultadoAprendizajeDAO.insertarResultado(resultado);
    }

    // Editar un resultado de aprendizaje (solo actualiza la descripción)
    public void editarResultado(int id, String descripcion) {
        ResultadoAprendizaje resultado = new ResultadoAprendizaje(id, 0, descripcion, null);
        resultadoAprendizajeDAO.editarResultado(resultado);
    }

    // Eliminar un resultado de aprendizaje
    public void eliminarResultado(int id) {
        resultadoAprendizajeDAO.eliminarResultado(id);
    }
}
