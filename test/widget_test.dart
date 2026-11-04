import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proyek_uts_mobileprogramming_24670016/main.dart';

void main() {
  testWidgets('Pemesanan tersimpan dan bisa dibuka dari riwayat', (
    tester,
  ) async {
    await tester.pumpWidget(const WisataDemakApp());

    await tester.tap(find.text('Lihat daftar wisata'));
    await tester.pumpAndSettle();
    expect(find.text('Daftar Wisata'), findsOneWidget);

    await tester.tap(find.text('Lihat detail').first);
    await tester.pumpAndSettle();
    expect(find.text('Detail Wisata'), findsOneWidget);

    await tester.tap(find.text('Pesan tiket'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Ayu');
    await tester.tap(find.byTooltip('Tambah tiket'));
    await tester.pump();
    expect(find.text('Total: Rp 10.000'), findsOneWidget);

    final tombolKonfirmasi = find.text('Konfirmasi pemesanan');
    await tester.ensureVisible(tombolKonfirmasi);
    await tester.tap(tombolKonfirmasi);
    await tester.pumpAndSettle();
    expect(find.text('Riwayat Pemesanan'), findsOneWidget);
    expect(find.text('Nama pengunjung: Ayu'), findsOneWidget);
    expect(find.text('Jumlah tiket: 2'), findsOneWidget);

    await tester.tap(find.byTooltip('Kembali'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Riwayat pemesanan (1)'));
    await tester.pumpAndSettle();
    expect(find.text('Nama pengunjung: Ayu'), findsOneWidget);
  });

  testWidgets('Nama kosong tidak bisa mengonfirmasi pemesanan', (tester) async {
    await tester.pumpWidget(const WisataDemakApp());

    await tester.tap(find.text('Lihat daftar wisata'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lihat detail').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pesan tiket'));
    await tester.pumpAndSettle();

    final tombolKonfirmasi = find.text('Konfirmasi pemesanan');
    await tester.ensureVisible(tombolKonfirmasi);
    await tester.tap(tombolKonfirmasi);
    await tester.pump();

    expect(find.text('Nama pengunjung tidak boleh kosong.'), findsOneWidget);
    expect(find.text('Pemesanan Tiket'), findsOneWidget);
  });
}
