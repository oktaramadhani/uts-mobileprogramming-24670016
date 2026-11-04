import 'package:flutter/material.dart';

class Wisata {
  const Wisata({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.hargaTiket,
    required this.gambar,
  });

  final String nama;
  final String lokasi;
  final String deskripsi;
  final int hargaTiket;
  final String gambar;
}

class Pemesanan {
  const Pemesanan({
    required this.namaPengunjung,
    required this.wisata,
    required this.tanggal,
    required this.jumlahTiket,
    required this.totalHarga,
  });

  final String namaPengunjung;
  final Wisata wisata;
  final DateTime tanggal;
  final int jumlahTiket;
  final int totalHarga;
}

typedef PemesananHandler = List<Pemesanan> Function(Pemesanan pemesanan);

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({required this.daftarPemesanan, super.key});

  final List<Pemesanan> daftarPemesanan;

  String _formatRupiah(int nilai) {
    final angka = nilai.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (cocok) => '.',
    );
    return 'Rp $angka';
  }

  String _formatTanggal(DateTime tanggal) {
    final hari = tanggal.day.toString().padLeft(2, '0');
    final bulan = tanggal.month.toString().padLeft(2, '0');
    return '$hari/$bulan/${tanggal.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali',
        ),
        title: const Text('Riwayat Pemesanan'),
      ),
      body: daftarPemesanan.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 42,
                      color: Color(0xFF78827A),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada pemesanan.',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 6),
                    Text('Pemesanan yang dibuat akan tampil di sini.'),
                  ],
                ),
              ),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftarPemesanan.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final pemesanan = daftarPemesanan[index];
                    return Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pemesanan.wisata.nama,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Nama pengunjung: ${pemesanan.namaPengunjung}',
                            ),
                            Text(
                              'Tanggal kunjungan: '
                              '${_formatTanggal(pemesanan.tanggal)}',
                            ),
                            Text('Jumlah tiket: ${pemesanan.jumlahTiket}'),
                            const SizedBox(height: 5),
                            Text(
                              'Total harga: ${_formatRupiah(pemesanan.totalHarga)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
