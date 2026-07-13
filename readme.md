# ERD sisteem perpustakaan

## Berikut merupakan ERD untuk sistem perpustakaan menggunakan mermaid

```mermaid
---
config:
    theme: 'default'
    themeVariables:
        lineColor: '#F8B229'
---

erDiagram
    buku {
        string id_buku
        string judul_buku
        string author
        string id_kategori
    }
    
    kategori {
        string id_kategori
        string nama_kategori
        string id_rak
    }
    rak_buku {
        string id_rak
        int nomor_rak
    }
    petugas {
        string id_petugas
        string nama_petugas
        date tgl_lahir
        string alamat
        string jenis_kelamin
        number no_telepon
    }

    peminjam {
        string id_peminjam
        string nama_peminjam
        string alamat
        string jenis_kelamin
        number no_telepon
    }

    daftar_pinjam {
        string id_buku
        string id_peminjam
        string status
    }

    pinjam_buku {
        string id_peminjaman
        string id_petugas
        string id_peminjam
        date tgl_peminjaman
        date tgl_pengembalian
    }

    buku o{ -- || kategori : mengikuti
    kategori o{ -- || rak_buku : mengikuti
    buku o{ -- || daftar_pinjam : mengikuti
    peminjam o{ -- || daftar_pinjam : mengikuti
    petugas o{ -- || pinjam_buku : mengikuti
    peminjam o{ -- || pinjam_buku : mengikuti


```