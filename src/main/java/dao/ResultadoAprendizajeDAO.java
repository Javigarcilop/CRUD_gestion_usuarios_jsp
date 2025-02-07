package dao;

import model.ResultadoAprendizaje;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.Database;

public class ResultadoAprendizajeDAO {
    private Connection connection;

    public ResultadoAprendizajeDAO() {
        connection = Database.getConnection();
        if (connection == null) {
            System.out.println("ERROR: No se pudo establecer la conexión con la base de datos.");
        }
    }

    // Listar todos los resultados de aprendizaje con el nombre de la asignatura
    public List<ResultadoAprendizaje> listarResultados() {
        List<ResultadoAprendizaje> resultados = new ArrayList<>();
        // Realizamos un JOIN con la tabla "asignaturas" para obtener el nombre
        String query = "SELECT ra.id, ra.asignatura_id, ra.descripcion, a.nombre AS asignaturaNombre " +
                       "FROM resultados_aprendizaje ra " +
                       "JOIN asignaturas a ON ra.asignatura_id = a.id " +
                       "ORDER BY ra.id ASC";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                int asignaturaId = rs.getInt("asignatura_id");
                String descripcion = rs.getString("descripcion");
                String asignaturaNombre = rs.getString("asignaturaNombre");
                // Usamos el constructor que incluye el nombre de la asignatura
                ResultadoAprendizaje resultado = new ResultadoAprendizaje(id, asignaturaId, descripcion, asignaturaNombre);
                resultados.add(resultado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public void insertarResultado(ResultadoAprendizaje resultado) {
        String query = "INSERT INTO resultados_aprendizaje (asignatura_id, descripcion) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, resultado.getAsignaturaId());
            stmt.setString(2, resultado.getDescripcion());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                resultado.setId(rs.getInt(1));
            }
            System.out.println("Resultado de aprendizaje insertado con ID: " + resultado.getId());
        } catch (SQLException e) {
            System.out.println("Error al insertar resultado.");
            e.printStackTrace();
        }
    }

    public void editarResultado(ResultadoAprendizaje resultado) {
        String query = "UPDATE resultados_aprendizaje SET descripcion = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, resultado.getDescripcion());
            stmt.setInt(2, resultado.getId());
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Resultado de aprendizaje con ID " + resultado.getId() + " actualizado.");
            } else {
                System.out.println("No se encontró el resultado con ID " + resultado.getId());
            }
        } catch (SQLException e) {
            System.out.println("Error SQL al actualizar resultado.");
            e.printStackTrace();
        }
    }

    public void eliminarResultado(int id) {
        String query = "DELETE FROM resultados_aprendizaje WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Resultado de aprendizaje con ID " + id + " eliminado.");
            } else {
                System.out.println("No se encontró el resultado con ID " + id);
            }
        } catch (SQLException e) {
            System.out.println("Error SQL al eliminar resultado.");
            e.printStackTrace();
        }
    }
}

