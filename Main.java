package SistemReservasiParkir;
import java.sql.Connection;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                System.out.println("✅ Koneksi ke database berhasil!");

                // Tampilkan menu utama sistem reservasi parkir
                Scanner scanner = new Scanner(System.in);
                int pilihan;
                do {
                    System.out.println("\n========== SISTEM RESERVASI PARKIR ==========");
                    System.out.println("1. Tampilkan Slot Parkir Tersedia");
                    System.out.println("2. Tampilkan Reservasi Aktif");
                    System.out.println("3. Tampilkan Log Parkir Lengkap");
                    System.out.println("4. Tampilkan Laporan Transaksi Pengguna");
                    System.out.println("5. Laporan Slot Crosstab per lantai");
                    System.out.println("6. Pengguna dengan Total Bayar > Rata-rata");
                    System.out.println("7. Kendaraan Belum Keluar / Belum Bayar");
                    System.out.println("8. Selesai");

                    System.out.print("Pilih menu: ");
                    pilihan = scanner.nextInt();
                    scanner.nextLine();

                    switch (pilihan) {
                        case 1:
                            SlotTersediaDAO.tampilkanSlotTersedia(conn);
                            break;
                        case 2:
                            ReservasiAktifViewDAO.tampilkanReservasiAktif(conn);
                            break;
                        case 3:
                            LogParkirViewDAO.tampilkanLogParkir(conn);
                            break;
                        case 4:
                            PembayaranViewDAO.tampilkanLaporanTransaksi(conn);
                            break;
                        case 5:
                            LaporanSlotPerLantaiDAO.tampilkanLaporanSlot(conn);
                            break;
                        case 6:
                            PenggunaDiAtasRataRataDAO.tampilkanPenggunaDiAtasRata(conn);
                            break;
                        case 7:
                            KendaraanBelumKeluarDAO.tampilkanKendaraanBelumKeluar(conn);
                            break;
                        case 8:
                            System.out.println("Keluar dari sistem.");
                            break;
                        default:
                            System.out.println("Pilihan tidak valid.");
                    }

                } while (pilihan != 8);

                scanner.close();
            } else {
                System.out.println("❌ Koneksi database gagal. Periksa konfigurasi.");
            }
        } catch (Exception e) {
            System.out.println("Terjadi kesalahan: " + e.getMessage());
        }
    }
}
