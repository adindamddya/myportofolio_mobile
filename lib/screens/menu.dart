import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/info_card.dart';
import 'package:myportofolio_mobile/widgets/item_card.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman utama (menu) portofolio mobile.
/// Menampilkan identitas pemilik dan kisi kartu aksi navigasi.
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2506656362";
  final String nama = "Adinda Madya Aliyah";
  final String kelas = "PBP C";

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Edukasi", Icons.school, Colors.indigo),
    ItemHomepage("Tambah Proyek", Icons.add_circle, Colors.amber.shade800),
    ItemHomepage("Tambah Edukasi", Icons.post_add, Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Baris horizontal untuk InfoCard profil pengguna
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Text(
                      'Selamat datang di MyPortfolio Mobile!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // GridView menampilkan kartu tombol dalam tata letak kisi 3 kolom
                  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(12),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
