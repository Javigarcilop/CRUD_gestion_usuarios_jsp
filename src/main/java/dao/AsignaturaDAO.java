/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Asignatura;
import java.sql.*;
import java.util.*;
import utils.Database;

public class AsignaturaDAO {
    private Connection connection;

    public AsignaturaDAO() {
        connection = Database.getConnection();
        if (connection == null) {
            System.out.println("ERROR: No se pudo establecer la conexión con la base de datos.");
        }
    }

    public List<Asignatura> listarAsignaturas() {
        List<Asignatura> asignaturas = new ArrayList<>();
        String query = "SELECT * FROM asignaturas ORDER BY id ASC";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Asignatura asignatura = new Asignatura(
                        rs.getInt("id"),
                        rs.getString("nombre")   
                );
                asignaturas.add(asignatura);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return asignaturas;
    }

    public void insertarAsignatura(Asignatura asignatura) {
        String query = "INSERT INTO asignaturas (nombre) VALUES (?)";  
        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, asignatura.getNombre());
            stmt.executeUpdate();

            
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                asignatura.setId(rs.getInt(1)); 
            }

            System.out.println("Asignatura insertada con ID: " + asignatura.getId());
        } catch (SQLException e) {
            System.out.println("Error al insertar asignatura.");
            e.printStackTrace();
        }
    }

    public void editarAsignatura(Asignatura asignatura) {
        String query = "UPDATE asignaturas SET nombre = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, asignatura.getNombre());
            stmt.setInt(2, asignatura.getId());
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Asignatura con ID " + asignatura.getId() + " actualizada.");
            } else {
                System.out.println("No se encontró la asignatura con ID " + asignatura.getId());
            }
        } catch (SQLException e) {
            System.out.println("Error SQL al actualizar asignatura.");
            e.printStackTrace();
        }
    }

    public void eliminarAsignatura(int id) {
        String query = "DELETE FROM asignaturas WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Asignatura con ID " + id + " eliminada.");
            } else {
                System.out.println("No se encontró la asignatura con ID " + id);
            }
        } catch (SQLException e) {
            System.out.println("Error SQL al eliminar asignatura.");
            e.printStackTrace();
        }
    }
}
