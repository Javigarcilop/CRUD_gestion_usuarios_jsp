/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class ResultadoAprendizaje {
    private int id;
    private int asignaturaId;
    private String descripcion;
    private String asignaturaNombre;

    
    public ResultadoAprendizaje(int id, int asignaturaId, String descripcion) {
        this.id = id;
        this.asignaturaId = asignaturaId;
        this.descripcion = descripcion;
    }

    public ResultadoAprendizaje(int id, int asignaturaId, String descripcion, String asignaturaNombre) {
        this.id = id;
        this.asignaturaId = asignaturaId;
        this.descripcion = descripcion;
        this.asignaturaNombre = asignaturaNombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAsignaturaId() {
        return asignaturaId;
    }

    public void setAsignaturaId(int asignaturaId) {
        this.asignaturaId = asignaturaId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAsignaturaNombre() {
        return asignaturaNombre;
    }

    public void setAsignaturaNombre(String asignaturaNombre) {
        this.asignaturaNombre = asignaturaNombre;
    }
}
