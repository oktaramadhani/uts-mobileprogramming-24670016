import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'riwayat_page.dart';

const List<Wisata> daftarWisata = [
  Wisata(
    nama: 'Masjid Agung Demak',
    lokasi: 'Kauman, Bintoro, Demak',
    deskripsi:
        'Masjid bersejarah yang menjadi salah satu peninggalan penting '
        'penyebaran Islam di Pulau Jawa.',
    hargaTiket: 5000,
    gambar: 'assets/images/masjid.jpg',
  ),
  Wisata(
    nama: 'Pantai Morosari',
    lokasi: 'Desa Bedono, Kecamatan Sayung',
    deskripsi:
        'Pantai di pesisir Demak yang cocok untuk menikmati suasana laut '
        'dan pemandangan matahari terbenam.',
    hargaTiket: 10000,
    gambar: 'assets/images/pantai.jpg',
  ),
  Wisata(
    nama: 'Museum Masjid Agung Demak',
    lokasi: 'Kompleks Masjid Agung Demak, Bintoro',
    deskripsi:
        'Museum kecil yang menyimpan benda dan cerita tentang sejarah '
        'Masjid Agung Demak.',
    hargaTiket: 3000,
    gambar: 'assets/images/museum.jpg',
  ),
  Wisata(
    nama: 'Mangrove Morosari',
    lokasi: 'Desa Bedono, Kecamatan Sayung',
    deskripsi:
        'Kawasan mangrove pesisir untuk melihat tanaman bakau dan mengenal '
        'lingkungan pantai Demak.',
    hargaTiket: 5000,
    gambar: 'assets/images/mangrove.jpg',
  ),
];

class GambarWisata extends StatelessWidget {
  const GambarWisata({
    required this.wisata,
    required this.lebar,
    required this.tinggi,
    super.key,
  });

  final Wisata wisata;
  final double lebar;
  final double tinggi;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      wisata.gambar,
      width: lebar,
      height: tinggi,
      fit: BoxFit.cover,
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({required this.onPemesananDibuat, super.key});

  final PemesananHandler onPemesananDibuat;

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
        title: const Text('Daftar Wisata'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: daftarWisata.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final wisata = daftarWisata[index];
              return Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: GambarWisata(
                          wisata: wisata,
                          lebar: 112,
                          tinggi: 112,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wisata.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 17,
                                  color: Color(0xFF66736A),
                                ),
                                const SizedBox(width: 3),
                                Expanded(
                                  child: Text(
                                    wisata.lokasi,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF66736A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (context) => DetailPage(
                                      wisata: wisata,
                                      onPemesananDibuat: onPemesananDibuat,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Lihat detail'),
                            ),
                          ],
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
