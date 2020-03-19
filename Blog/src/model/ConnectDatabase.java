package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
    static String dbURL = "jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8";
    //"jdbc:mysql://localhost:3306/blog";
    static String userName = "root";
    static String passWord = "";

    static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, userName, passWord);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
