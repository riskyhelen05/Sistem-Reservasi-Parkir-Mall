=============================================================
-- CRUD TABEL RELASI MASTER-DETAIL DENGAN STORED PROCEDURE --
=============================================================

======================================
-- STORED PROCEDURE CRUD LOG_PARKIR --
======================================

-- Insert Log_Parkir
CREATE PROCEDURE sp_insert_log_parkir (
  IN p_kendaraan_id INT,
  IN p_slot_id INT,
  IN p_waktu_masuk DATETIME
)
BEGIN
  INSERT INTO Log_Parkir (kendaraan_id, slot_id, waktu_masuk)
  VALUES (p_kendaraan_id, p_slot_id, p_waktu_masuk);
END;

-- Read Log_Parkir by ID
CREATE PROCEDURE sp_get_log_parkir_by_id (
  IN p_log_id INT
)
BEGIN
  SELECT * FROM Log_Parkir WHERE log_id = p_log_id;
END;

-- Update Log_Parkir
CREATE PROCEDURE sp_update_log_parkir (
  IN p_log_id INT,
  IN p_kendaraan_id INT,
  IN p_slot_id INT,
  IN p_waktu_masuk DATETIME,
  IN p_waktu_keluar DATETIME
)
BEGIN
  UPDATE Log_Parkir
  SET kendaraan_id = p_kendaraan_id,
      slot_id = p_slot_id,
      waktu_masuk = p_waktu_masuk,
      waktu_keluar = p_waktu_keluar
  WHERE log_id = p_log_id;
END;

-- Delete Log_Parkir
CREATE PROCEDURE sp_delete_log_parkir (
  IN p_log_id INT
)
BEGIN
  DELETE FROM Log_Parkir WHERE log_id = p_log_id;
END;

-- CARA MEMANGGIL --
-- Insert
CALL sp_insert_log_parkir(10, 5, '2025-06-07 08:30:00');

-- Read
CALL sp_get_log_parkir_by_id(1);

-- Update
CALL sp_update_log_parkir(1, 10, 6, '2025-06-07 08:30:00', '2025-06-07 12:30:00');

-- Delete
CALL sp_delete_log_parkir(4);

============================================
-- STORED PROCEDURE CRUD RESERVASI_PARKIR --
============================================

-- Insert Reservasi_Parkir
CREATE PROCEDURE sp_insert_reservasi_parkir (
  IN p_user_id INT,
  IN p_slot_id INT,
  IN p_kendaraan_id INT,
  IN p_tanggal_reservasi DATE,
  IN p_waktu_masuk DATETIME,
  IN p_waktu_keluar DATETIME,
  IN p_status_reservasi ENUM('aktif', 'selesai', 'batal')
)
BEGIN
  INSERT INTO Reservasi_Parkir (user_id, slot_id, kendaraan_id, tanggal_reservasi, waktu_masuk, waktu_keluar, status_reservasi)
  VALUES (p_user_id, p_slot_id, p_kendaraan_id, p_tanggal_reservasi, p_waktu_masuk, p_waktu_keluar, p_status_reservasi);
END;

-- Read Reservasi_Parkir by ID
CREATE PROCEDURE sp_get_reservasi_parkir_by_id (
  IN p_reservasi_id INT
)
BEGIN
  SELECT * FROM Reservasi_Parkir WHERE reservasi_id = p_reservasi_id;
END;

-- Update Reservasi_Parkir
CREATE PROCEDURE sp_update_reservasi_parkir (
  IN p_reservasi_id INT,
  IN p_user_id INT,
  IN p_slot_id INT,
  IN p_kendaraan_id INT,
  IN p_tanggal_reservasi DATE,
  IN p_waktu_masuk DATETIME,
  IN p_waktu_keluar DATETIME,
  IN p_status_reservasi ENUM('aktif', 'selesai', 'batal')
)
BEGIN
  UPDATE Reservasi_Parkir
  SET user_id = p_user_id,
      slot_id = p_slot_id,
      kendaraan_id = p_kendaraan_id,
      tanggal_reservasi = p_tanggal_reservasi,
      waktu_masuk = p_waktu_masuk,
      waktu_keluar = p_waktu_keluar,
      status_reservasi = p_status_reservasi
  WHERE reservasi_id = p_reservasi_id;
END;

-- Delete Reservasi_Parkir
CREATE PROCEDURE sp_delete_reservasi_parkir (
  IN p_reservasi_id INT
)
BEGIN
  DELETE FROM Reservasi_Parkir WHERE reservasi_id = p_reservasi_id;
END;

-- CARA MEMANGGIL --
-- Insert
CALL sp_insert_reservasi_parkir(3, 7, 10, '2025-06-10', '2025-06-10 09:00:00', '2025-06-10 17:00:00', 'aktif');

-- Read
CALL sp_get_reservasi_parkir_by_id(1);

-- Update
CALL sp_update_reservasi_parkir(1, 3, 8, 11, '2025-06-11', '2025-06-11 09:00:00', '2025-06-11 18:00:00', 'selesai');

-- Delete
CALL sp_delete_reservasi_parkir(1);

======================================
-- STORED PROCEDURE CRUD PEMBAYARAN --
======================================

-- Insert Pembayaran
CREATE PROCEDURE sp_insert_pembayaran (
  IN p_log_id INT,
  IN p_metode_pembayaran ENUM('cash', 'e-wallet', 'debit'),
  IN p_total_bayar DECIMAL(10,2)
)
BEGIN
  INSERT INTO Pembayaran (log_id, metode_pembayaran, total_bayar)
  VALUES (p_log_id, p_metode_pembayaran, p_total_bayar);
END;

-- Read Pembayaran by ID
CREATE PROCEDURE sp_get_pembayaran_by_id (
  IN p_pembayaran_id INT
)
BEGIN
  SELECT * FROM Pembayaran WHERE pembayaran_id = p_pembayaran_id;
END;

-- Update Pembayaran
CREATE PROCEDURE sp_update_pembayaran (
  IN p_pembayaran_id INT,
  IN p_log_id INT,
  IN p_metode_pembayaran ENUM('cash', 'e-wallet', 'debit'),
  IN p_total_bayar DECIMAL(10,2)
)
BEGIN
  UPDATE Pembayaran
  SET log_id = p_log_id,
      metode_pembayaran = p_metode_pembayaran,
      total_bayar = p_total_bayar
  WHERE pembayaran_id = p_pembayaran_id;
END;

-- Delete Pembayaran
CREATE PROCEDURE sp_delete_pembayaran (
  IN p_pembayaran_id INT
)
BEGIN
  DELETE FROM Pembayaran WHERE pembayaran_id = p_pembayaran_id;
END;

-- CARA MEMANGGIL --
-- Insert
CALL sp_insert_pembayaran(2, 'cash', 25000.00);

-- Read
CALL sp_get_pembayaran_by_id(1);

-- Update
CALL sp_update_pembayaran(1, 2, 'e-wallet', 30000.00);

-- Delete
CALL sp_delete_pembayaran(1);
