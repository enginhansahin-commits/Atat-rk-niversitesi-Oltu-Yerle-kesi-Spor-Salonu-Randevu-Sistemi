import 'package:flutter/material.dart';

class ListeSayfasi extends StatefulWidget {
  final String bransAdi;
  ListeSayfasi({required this.bransAdi});

  @override
  _ListeSayfasiState createState() => _ListeSayfasiState();
}

class _ListeSayfasiState extends State<ListeSayfasi> {
  final List<String> saatler = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
  ];

  late List<bool> dolulukDurumu;

  @override
  void initState() {
    super.initState();
    dolulukDurumu = List.generate(saatler.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      appBar: AppBar(
        title: Text("${widget.bransAdi} Randevu"),
        backgroundColor: Color(0xFF001226),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: saatler.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (dolulukDurumu[index]) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Bu saat zaten dolu!")));
                return;
              }

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFF001226),
                    title: Text(
                      "Randevu Onayı",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                      "${saatler[index]} saati için ${widget.bransAdi} randevusu almak istiyor musunuz?",
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "İptal",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Randevu Al",
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            dolulukDurumu[index] = true;
                          });

                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${saatler[index]} saati rezerve edildi!",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: dolulukDurumu[index]
                    ? Colors.red[800]!.withOpacity(0.8)
                    : Colors.green[800]!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24),
              ),
              child: Center(
                child: Text(
                  saatler[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
