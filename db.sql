-- 1. Tabel Buku Kas (Menyimpan Saldo Awal dan Judul per Periode)
CREATE TABLE buku_kas (
    book_key VARCHAR(50) PRIMARY KEY, -- 'petty' atau 'sparepart'
    title VARCHAR(255) NOT NULL,
    initial_balance DECIMAL(15, 2) DEFAULT 0.00,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Tabel Transaksi Kas
CREATE TABLE transaksi_kas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_key VARCHAR(50) NOT NULL,    -- 'petty' atau 'sparepart'
    tanggal DATE NOT NULL,
    bukti VARCHAR(100) NULL,
    keterangan VARCHAR(255) NOT NULL,
    topup DECIMAL(15, 2) DEFAULT 0.00, -- Kolom Top Up tersendiri
    keluar DECIMAL(15, 2) DEFAULT 0.00, -- Kolom Pengeluaran / Modal Part
    status VARCHAR(50) NULL,           -- SOLVED, STOCK, dll (Sparepart)
    harga_jual DECIMAL(15, 2) DEFAULT 0.00, -- Harga Jual ke User (Sparepart)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_key) REFERENCES buku_kas(book_key) ON DELETE CASCADE
);

-- Inisialisasi awal (saldo Rp 0)
INSERT INTO buku_kas (book_key, title, initial_balance) VALUES
('petty', 'PENGELUARAN PETTY CASH BULAN NOVEMBER 2026', 0.00),
('sparepart', 'PENGELUARAN SPAREPART BULAN NOVEMBER 2026', 0.00);