import 'package:flutter/material.dart';

import 'riwayat_page.dart';
import 'wisata_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pemesanan> _daftarPemesanan = [];

  List<Pemesanan> _simpanPemesanan(Pemesanan pemesanan) {
    setState(() {
      _daftarPemesanan.add(pemesanan);
    });
    return List<Pemesanan>.of(_daftarPemesanan);
  }

  void _bukaDaftarWisata() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => WisataPage(onPemesananDibuat: _simpanPemesanan),
      ),
    );
  }

  void _bukaRiwayat() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) =>
            RiwayatPage(daftarPemesanan: List<Pemesanan>.of(_daftarPemesanan)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Lokal Demak')),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/masjid.jpg',
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kenalan dengan wisata Demak',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF26332A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Temukan tempat menarik di Kabupaten Demak, mulai dari '
                  'wisata sejarah sampai pantai dan hutan mangrove. Pilih '
                  'tempat, lihat informasinya, lalu pesan tiket dengan mudah.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF626A64),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _bukaDaftarWisata,
                    icon: const Icon(Icons.place_outlined),
                    label: const Text('Lihat daftar wisata'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _bukaRiwayat,
                    icon: const Icon(Icons.receipt_long_outlined),
                    label: Text(
                      'Riwayat pemesanan (${_daftarPemesanan.length})',
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Perjalanan wisata anda ingin lebih lengkap . Kunjungi wisata '
                  'lokal Demak.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF727A74)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
