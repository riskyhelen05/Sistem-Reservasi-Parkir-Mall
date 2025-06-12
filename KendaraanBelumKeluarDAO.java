package SistemReservasiParkir;
import java.sql.*;

public class KendaraanBelumKeluarDAO {
     public static void tampilkanKendaraanBelumKeluar(Connection conn) throws SQLException {
        String query = """
        SELECT plat_nomor, nama_lengkap, waktu_masuk
        FROM vw_parkir_aktif_belum_bayar
        """;
        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                KendaraanBelumKeluarView view = new KendaraanBelumKeluarView(
                    rs.getString("plat_nomor"),
                    rs.getString("nama_lengkap"),
                    rs.getTimestamp("waktu_masuk")
                );
                view.tampilkan();
            }
        }
    }
}
