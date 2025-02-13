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

    public List<Asignatura> listarAsignaturas() {
        return asignaturaDAO.listarAsignaturas();
    }

 
    public void insertarAsignatura(String nombre) {
        Asignatura asignatura = new Asignatura(0, nombre);  
        asignaturaDAO.insertarAsignatura(asignatura);
    }


    public void editarAsignatura(int id, String nombre) {
        Asignatura asignatura = new Asignatura(id, nombre);
        asignaturaDAO.editarAsignatura(asignatura);
    }

    public void eliminarAsignatura(int id) {
        asignaturaDAO.eliminarAsignatura(id);
    }
}
