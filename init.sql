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
    "status" VARCHAR(20)

);