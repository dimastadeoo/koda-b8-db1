CREATE TABLE "rak_buku" (
    "id" SERIAL PRIMARY KEY,
    "nomor_rak" VARCHAR(20),
    "created_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "kategori" (
    "id" SERIAL PRIMARY KEY,
    "nama_kategori" VARCHAR(80), 
    "rak" INT REFERENCES "rak_buku"("id"),
    "created_at" TIMESTAMP DEFAULT NOW()
);
CREATE TABLE "buku" (
    "id" SERIAL PRIMARY KEY,
    "judul_buku" VARCHAR(70),
    "author" VARCHAR(80), 
    "kategori" INT REFERENCES "kategori"("id"),
    "created_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "petugas" (
    "id" SERIAL PRIMARY KEY,
    "nama_petugas" VARCHAR(80), 
    "tgl_lahir" DATE,
    "alamat" TEXT,
    "jenis_kelamin" VARCHAR(10) CHECK ("jenis_kelamin" IN ('Laki-laki', 'Perempuan')), 
    "no_telepon" INT,
    "created_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "peminjam" (
    "id" SERIAL PRIMARY KEY,
    "nama_peminjam" VARCHAR(80), 
    "alamat" TEXT,
    "jenis_kelamin" VARCHAR(10) CHECK ("jenis_kelamin" IN ('Laki-laki', 'Perempuan')), 
    "no_telepon" INT,
    "created_at" TIMESTAMP DEFAULT NOW()
);
CREATE TABLE "pinjam_buku" (
    "id" SERIAL PRIMARY KEY,
    "petugas" INT REFERENCES "petugas"("id"),
    "peminjam" INT REFERENCES "peminjam"("id"),
    "created_at" TIMESTAMP DEFAULT NOW()
);
CREATE TABLE "daftar_pinjam" (
    "id" SERIAL PRIMARY KEY,
    "buku" INT REFERENCES "buku"("id"),
    "peminjaman" INT REFERENCES "pinjam_buku"("id"),
    "tgl_peminjaman" TIMESTAMP DEFAULT NOW(),
    "tgl_pengembalian" TIMESTAMP,
    "status" VARCHAR(20) CHECK ("status" IN ('Dipinjam', 'Dikembalikan', 'Hilang'))

);

-- ============================================
-- 1. Insert data ke tabel rak_buku
-- ============================================
INSERT INTO "rak_buku" ("nomor_rak") VALUES
('RAK-A1'),
('RAK-A2'),
('RAK-B1'),
('RAK-B2'),
('RAK-C1'),
('RAK-C2'),
('RAK-D1'),
('RAK-D2'),
('RAK-E1'),
('RAK-E2');

-- ============================================
-- 2. Insert data ke tabel kategori
--    Setiap kategori merujuk ke salah satu rak
-- ============================================
INSERT INTO "kategori" ("nama_kategori", "rak") VALUES
('Fiksi', 1),
('Non-Fiksi', 2),
('Sains', 3),
('Sejarah', 4),
('Biografi', 5),
('Filsafat', 2),
('Psikologi', 7),
('Teknologi', 8),
('Seni', 3),
('Agama', 1);

-- ============================================
-- 3. Insert data ke tabel buku
--    Setiap buku merujuk ke salah satu kategori
-- ============================================
INSERT INTO "buku" ("author", "judul_buku", "kategori") VALUES
('Andrea Hirata', 'Laskar Pelangi', 1),
('Yuval Noah Harari', 'Sapiens: Riwayat Singkat Umat Manusia', 2),
('Stephen Hawking', 'A Brief History of Time', 3),
('Nugroho Notosusanto', 'Sejarah Nasional Indonesia', 4),
('Walter Isaacson', 'Steve Jobs: The Biography', 5),
('Plato', 'Republik', 6),
('Daniel Kahneman', 'Thinking, Fast and Slow', 7),
('Steve Jobs', 'The Apple Revolution', 8), 
('Ernest Hemingway', 'The Old Man and the Sea', 9),
('Karen Armstrong', 'A History of God', 10);

-- ============================================
-- 4. Insert data ke tabel petugas
-- ============================================
INSERT INTO "petugas" ("nama_petugas", "tgl_lahir", "alamat", "jenis_kelamin", "no_telepon") VALUES
('Budi Santoso', '1985-03-15', 'Jl. Mawar No. 1, Jakarta', 'Laki-laki', 812345678),
('Siti Rahayu', '1990-07-22', 'Jl. Melati No. 2, Bandung', 'Perempuan', 812345679),
('Agus Wijaya', '1982-11-02', 'Jl. Kenanga No. 3, Surabaya', 'Laki-laki', 812345680),
('Dewi Lestari', '1995-01-12', 'Jl. Anggrek No. 4, Yogyakarta', 'Perempuan', 812345681),
('Eko Prasetyo', '1988-09-30', 'Jl. Dahlia No. 5, Semarang', 'Laki-laki', 812345682),
('Fitriani', '1992-05-20', 'Jl. Kamboja No. 6, Medan', 'Perempuan', 812345683),
('Gunawan', '1980-12-25', 'Jl. Sakura No. 7, Bali', 'Laki-laki', 812345684),
('Hana Sari', '1997-08-08', 'Jl. Teratai No. 8, Makassar', 'Perempuan', 812345685),
('Indra Permana', '1986-06-18', 'Jl. Cempaka No. 9, Palembang', 'Laki-laki', 812345686),
('Juniarti', '1991-04-14', 'Jl. Flamboyan No. 10, Manado', 'Perempuan', 812345687);

-- ============================================
-- 5. Insert data ke tabel peminjam
-- ============================================
INSERT INTO "peminjam" ("nama_peminjam", "alamat", "jenis_kelamin", "no_telepon") VALUES
('Ahmad Fauzi', 'Jl. Pinang No. 1, Jakarta', 'Laki-laki', 812345688),
('Bella Pratiwi', 'Jl. Jeruk No. 2, Bandung', 'Perempuan', 812345689),
('Cahya Nugroho', 'Jl. Mangga No. 3, Surabaya', 'Laki-laki', 812345690),
('Dina Amalia', 'Jl. Durian No. 4, Yogyakarta', 'Perempuan', 812345691),
('Evan Aditya', 'Jl. Rambutan No. 5, Semarang', 'Laki-laki', 812345692),
('Friska Yanti', 'Jl. Nangka No. 6, Medan', 'Perempuan', 812345693),
('Gilang Saputra', 'Jl. Pepaya No. 7, Bali', 'Laki-laki', 812345694),
('Hilda Kusuma', 'Jl. Belimbing No. 8, Makassar', 'Perempuan', 812345695),
('Irwan Setiawan', 'Jl. Pisang No. 9, Palembang', 'Laki-laki', 812345696),
('Jihan Safitri', 'Jl. Apel No. 10, Manado', 'Perempuan', 812345697);

-- ============================================
-- 6. Insert data ke tabel pinjam_buku
--    Setiap transaksi peminjaman memiliki petugas dan peminjam
-- ============================================
INSERT INTO "pinjam_buku" ("petugas", "peminjam") VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(7, 10);

-- ============================================
-- 7. Insert data ke tabel daftar_pinjam
-- ============================================
INSERT INTO "daftar_pinjam" ("buku", "peminjaman", "status") VALUES
(2, 1, 'Dipinjam'),
(1, 1, 'Dipinjam'),
(3, 3, 'Dipinjam'),
(4, 4, 'Dipinjam'),
(5, 5, 'Dipinjam'),
(6, 6, 'Dipinjam'),
(7, 7, 'Dipinjam'),
(8, 9, 'Dipinjam'),
(9, 9, 'Dipinjam'),
(10, 10, 'Dipinjam');