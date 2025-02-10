/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AsignaturaDAO;
import model.Asignatura;
import java.util.List;

public class AsignaturaController {

    private AsignaturaDAO asignaturaDAO;

    public AsignaturaController() {
        asignaturaDAO = new AsignaturaDAO();
    }

    // Obtener todas las asignaturas
    public List<Asignatura> listarAsignaturas() {
        return asignaturaDAO.listarAsignaturas();
    }

    // Insertar asignatura
    public void insertarAsignatura(String nombre) {
        Asignatura asignatura = new Asignatura(0, nombre);  // ID inicializado en 0 para ser autogenerado
        asignaturaDAO.insertarAsignatura(asignatura);
    }

    // Editar asignatura
    public void editarAsignatura(int id, String nombre) {
        Asignatura asignatura = new Asignatura(id, nombre);
        asignaturaDAO.editarAsignatura(asignatura);
    }

    // Eliminar asignatura
    public void eliminarAsignatura(int id) {
        asignaturaDAO.eliminarAsignatura(id);
    }
}
