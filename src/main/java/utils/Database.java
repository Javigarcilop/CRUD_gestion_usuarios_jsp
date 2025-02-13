/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private static final String URL = "jdbc:mysql://localhost:3306/CRUD_gestion_usuarios_jsp"; 
    private static final String USER = "root";  
    private static final String PASSWORD = "";  

    private static Connection connection;

    // Método para obtener la conexión
    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Cargar el controlador JDBC
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establecer la conexión
                connection = DriverManager.getConnection(URL, USER, PASSWORD);

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}

