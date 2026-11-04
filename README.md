# Wisata Lokal Demak

Aplikasi Flutter sederhana untuk melihat informasi wisata di Kabupaten Demak,
memesan tiket contoh, dan melihat riwayat pemesanan selama aplikasi berjalan.
Aplikasi ini tidak memakai login, database, API, atau package tambahan.

## Fungsi file Dart

- `lib/main.dart`: menjalankan aplikasi dan mengatur tema hijau-putih.
- `lib/home_page.dart`: beranda dan tempat penyimpanan riwayat sementara.
- `lib/wisata_page.dart`: daftar empat tempat wisata dan tombol detail.
- `lib/detail_page.dart`: informasi lokasi, deskripsi, harga, dan tombol pesan.
- `lib/booking_page.dart`: nama, tanggal, jumlah tiket, total, dan konfirmasi.
- `lib/riwayat_page.dart`: data wisata/pemesanan dan tampilan riwayat.

Semua data pemesanan disimpan di memori aplikasi. Riwayat akan kembali kosong
kalau aplikasi ditutup atau dimulai ulang.

## Materi Flutter yang digunakan

- `Text` menampilkan judul, keterangan, harga, dan isi pemesanan.
  `TextStyle` mengatur ukuran, warna, dan ketebalan tulisan.
- `Icon` membantu menjelaskan fungsi tombol, misalnya kalender dan lokasi.
  `Color` dipakai untuk warna hijau, putih, dan abu-abu.
- `Container` membungkus ringkasan harga dan memberi warna serta jarak.
- `Row` menyusun foto, tombol, dan informasi secara mendatar. `Column`
  menyusun bagian-bagian halaman dari atas ke bawah.
- `Padding` memberi jarak di dalam widget, sedangkan `margin` memberi jarak
  di luar kartu. `SizedBox` memberi jarak atau ukuran tetap.
- `Image.asset()` membaca gambar dari `assets/images/`. Ukuran gambar diatur
  melalui `width` dan `height`; `BoxFit.cover` mengisi area gambar dengan rapi.
- `Navigator.push()` membuka daftar, detail, pemesanan, atau riwayat.
  Tombol panah memanggil `Navigator.pop()` untuk kembali ke halaman sebelumnya.

## Gambar wisata

Folder `assets/images/` berisi `masjid.jpg`, `pantai.jpg`, `museum.jpg`,
dan `mangrove.jpg`. Saat ini keempatnya adalah gambar pengganti abu-abu yang
bertuliskan bahwa foto asli belum tersedia, bukan foto tempat wisata.
Untuk memakai foto asli, ganti isi masing-masing berkas dengan foto yang sesuai,
dan pertahankan nama berkasnya. Folder tersebut sudah didaftarkan di
`pubspec.yaml`.

## Alur pemesanan

1. Dari beranda, tekan **Lihat daftar wisata**.
2. Pilih **Lihat detail** pada salah satu tempat, lalu tekan **Pesan tiket**.
3. Isi nama, pilih tanggal, dan atur jumlah tiket. Total dihitung dari harga
   tiket dikali jumlah tiket.
4. Tekan **Konfirmasi pemesanan**. Nama kosong akan ditolak dan diberi pesan.
5. Pesanan diteruskan ke beranda, disimpan pada list sementara, lalu halaman
   riwayat dibuka untuk menampilkan hasilnya.

## Contoh pertanyaan presentasi

1. **Apa tujuan aplikasi ini?**  
   Untuk mengenalkan beberapa tempat wisata di Demak dan mencoba alur pesan
   tiket sederhana.
2. **Mengapa riwayat hilang saat aplikasi dimulai ulang?**  
   Karena data hanya disimpan di list selama aplikasi berjalan, belum memakai
   database atau penyimpanan permanen.
3. **Apa fungsi `StatefulWidget` di halaman pemesanan?**  
   Supaya jumlah tiket dan tanggal yang dipilih bisa berubah dan ditampilkan
   lagi setelah `setState()`.
4. **Bagaimana total harga dihitung?**  
   Harga tiket satu orang dikalikan dengan jumlah tiket.
5. **Bagaimana aplikasi memeriksa nama pengunjung?**  
   Nama dihapus spasi luarnya dengan `trim()`. Kalau kosong, pesanan tidak
   dilanjutkan.
6. **Apa fungsi `Navigator.push()`?**  
   Membuka halaman baru di atas halaman yang sedang dilihat.
7. **Apa fungsi `Navigator.pop()`?**  
   Menutup halaman saat ini dan kembali ke halaman sebelumnya.
8. **Untuk apa `setState()` dipakai?**  
   Memberi tahu Flutter bahwa nilai yang ditampilkan berubah, misalnya jumlah
   tiket.
9. **Apa kegunaan `Image.asset()`?**  
   Menampilkan gambar dari folder lokal proyek, tanpa mengambilnya dari
   internet.
10. **Apa maksud `BoxFit.cover`?**  
    Gambar mengisi kotaknya. Sebagian tepi bisa terpotong supaya kotak tidak
    menyisakan ruang kosong.
11. **Mengapa gambar sekarang bukan foto tempat wisata?**  
    Gambar yang tersedia hanya placeholder berlabel. Saya bisa menggantinya
    dengan foto asli tanpa mengubah nama file.
12. **Data apa yang muncul di riwayat?**  
    Nama pengunjung, tempat wisata, tanggal, jumlah tiket, dan total harga.
13. **Apakah harga tiket di aplikasi ini harga resmi?**  
    Tidak, harganya hanya contoh untuk menunjukkan cara menghitung pemesanan.

## Menjalankan aplikasi

Pastikan Flutter dan Google Chrome sudah tersedia, lalu jalankan dari folder
proyek:

```powershell
flutter pub get
flutter run -d chrome
```
