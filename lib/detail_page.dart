import 'package:flutter/material.dart';

import 'booking_page.dart';
import 'riwayat_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    required this.wisata,
    required this.onPemesananDibuat,
    super.key,
  });

  final Wisata wisata;
  final PemesananHandler onPemesananDibuat;

  String _formatRupiah(int nilai) {
    final angka = nilai.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (cocok) => '.',
    );
    return 'Rp $angka';
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
        title: const Text('Detail Wisata'),
      ),
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
                    wisata.gambar,
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  wisata.nama,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 19,
                      color: Color(0xFF52685A),
                    ),
                    const SizedBox(width: 5),
                    Expanded(child: Text(wisata.lokasi)),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  wisata.deskripsi,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.confirmation_number_outlined,
                        color: Color(0xFF387A4A),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(child: Text('Contoh harga tiket')),
                      Text(
                        '${_formatRupiah(wisata.hargaTiket)} / orang',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => BookingPage(
                            wisata: wisata,
                            onPemesananDibuat: onPemesananDibuat,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.event_available_outlined),
                    label: const Text('Pesan tiket'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
