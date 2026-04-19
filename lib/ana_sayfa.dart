import 'package:flutter/material.dart';
import 'saat_bilgi_sayfasi.dart';

class AnaSayfa extends StatelessWidget {
  final List<Map<String, dynamic>> bransVerileri = [
    {'ad': 'Futbol Sahası', 'ikon': Icons.sports_soccer},
    {'ad': 'Basketbol Sahası', 'ikon': Icons.sports_basketball},
    {'ad': 'Voleybol Sahası', 'ikon': Icons.sports_volleyball},
    {'ad': 'Tenis Kortu', 'ikon': Icons.sports_tennis},
    {'ad': 'Bilardo', 'ikon': Icons.sports_baseball},
    {'ad': 'Masa Tenisi', 'ikon': Icons.table_restaurant},
    {'ad': 'Futsal Sahası', 'ikon': Icons.sports_soccer_outlined},
    {'ad': 'Hentbol Sahası', 'ikon': Icons.sports_handball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      appBar: AppBar(
        title: Text(
          "Oltu Yerleşkesi Spor Branşları",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Color(0xFF001226),
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: bransVerileri.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListeSayfasi(bransAdi: bransVerileri[index]['ad']!),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF003366),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    bransVerileri[index]['ikon'],
                    color: Colors.lightBlueAccent,
                    size: 50,
                  ),
                  SizedBox(height: 12),
                  Text(
                    bransVerileri[index]['ad']!,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
