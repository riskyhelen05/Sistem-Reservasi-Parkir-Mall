package SistemReservasiParkir;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/SistemReservasiParkirMall";
    private static final String USER = "root";
    private static final String PASSWORD = "ELINA13052006";

    public static Connection getConnection() {
        try {
            // Memastikan driver ter-load
            // System.out.println("Memuat driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver MySQL tidak ditemukan!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Koneksi ke database gagal!");
            e.printStackTrace();
        }
        return null; // Jika gagal, return null
    }
}