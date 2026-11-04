import 'package:flutter/material.dart';

import 'riwayat_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    required this.wisata,
    required this.onPemesananDibuat,
    super.key,
  });

  final Wisata wisata;
  final PemesananHandler onPemesananDibuat;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _namaController = TextEditingController();
  DateTime _tanggalKunjungan = DateTime.now();
  int _jumlahTiket = 1;

  int get _totalHarga => widget.wisata.hargaTiket * _jumlahTiket;

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

  Future<void> _pilihTanggal() async {
    final tanggal = await showDatePicker(
      context: context,
      initialDate: _tanggalKunjungan,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (tanggal != null) {
      setState(() {
        _tanggalKunjungan = tanggal;
      });
    }
  }

  void _konfirmasiPemesanan() {
    final nama = _namaController.text.trim();
    if (nama.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama pengunjung tidak boleh kosong.')),
      );
      return;
    }

    final pemesanan = Pemesanan(
      namaPengunjung: nama,
      wisata: widget.wisata,
      tanggal: _tanggalKunjungan,
      jumlahTiket: _jumlahTiket,
      totalHarga: _totalHarga,
    );
    final daftarPemesanan = widget.onPemesananDibuat(pemesanan);

    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => RiwayatPage(daftarPemesanan: daftarPemesanan),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
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
        title: const Text('Pemesanan Tiket'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wisata.nama,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Nama pengunjung',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama lengkap',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Tanggal kunjungan',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _pilihTanggal,
                    icon: const Icon(Icons.calendar_today_outlined),
                    label: Text(_formatTanggal(_tanggalKunjungan)),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Jumlah tiket',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      onPressed: _jumlahTiket > 1
                          ? () {
                              setState(() {
                                _jumlahTiket--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.remove_circle_outline),
                      tooltip: 'Kurangi tiket',
                    ),
                    Text(
                      '$_jumlahTiket',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _jumlahTiket++;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline),
                      tooltip: 'Tambah tiket',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga tiket: ${_formatRupiah(widget.wisata.hargaTiket)}',
                      ),
                      const SizedBox(height: 6),
                      Text('Jumlah tiket: $_jumlahTiket'),
                      const Divider(height: 20),
                      Text(
                        'Total: ${_formatRupiah(_totalHarga)}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _konfirmasiPemesanan,
                    child: const Text('Konfirmasi pemesanan'),
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
