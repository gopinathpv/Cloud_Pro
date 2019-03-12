package src.java;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionFactory {
	// static reference to itself
	private static ConnectionFactory instance = new ConnectionFactory();
	public static final String URL = "jdbc:mysql://localhost:3306/consistency";
	public static final String USER = "root";
	public static final String PASSWORD = "admin";
	public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";

	// private constructor
	private ConnectionFactory() {
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private Connection createConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			System.out.println("ERROR: Unable to Connect to Database.");
		}
               // Statement s=connection.createStatement();
                		return connection;
	}

	public static Connection getConnection() {
		return instance.createConnection();
	}
}