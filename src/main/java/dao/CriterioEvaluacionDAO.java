/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.CriterioEvaluacion;
import java.sql.*;
import java.util.*;
import utils.Database;

public class CriterioEvaluacionDAO {
    private Connection connection;

    public CriterioEvaluacionDAO() {
        connection = Database.getConnection();
        if (connection == null) {
            System.out.println("ERROR: No se pudo establecer la conexión con la base de datos.");
        }
    }

    public List<CriterioEvaluacion> listarCriterios() {
        List<CriterioEvaluacion> criterios = new ArrayList<>();
        String query = "SELECT * FROM criterios_evaluacion ORDER BY id ASC";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CriterioEvaluacion criterio = new CriterioEvaluacion(
                        rs.getInt("id"),
                        rs.getInt("resultado_aprendizaje_id"),
                        rs.getString("criterio")
                );
                criterios.add(criterio);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return criterios;
    }

    public void insertarCriterio(CriterioEvaluacion criterio) {
        String query = "INSERT INTO criterios_evaluacion (resultado_aprendizaje_id, criterio) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, criterio.getResultadoAprendizajeId());
            stmt.setString(2, criterio.getCriterio());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                criterio.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarCriterio(CriterioEvaluacion criterio) {
        String query = "UPDATE criterios_evaluacion SET criterio = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, criterio.getCriterio());
            stmt.setInt(2, criterio.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarCriterio(int id) {
        String query = "DELETE FROM criterios_evaluacion WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


