import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const WisataDemakApp());
}

class WisataDemakApp extends StatelessWidget {
  const WisataDemakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Lokal Demak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF387A4A)),
        scaffoldBackgroundColor: const Color(0xFFF5F6F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF26332A),
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
