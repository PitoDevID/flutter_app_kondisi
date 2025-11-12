import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(latihan4());
}

class latihan4 extends StatelessWidget {
  const latihan4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: latihanKondisi(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class latihanKondisi extends StatefulWidget {
  const latihanKondisi({super.key});

  @override
  State<latihanKondisi> createState() => _latihanKondisiState();
}

class _latihanKondisiState extends State<latihanKondisi> {
  TextEditingController connCodeBarang = TextEditingController();
  TextEditingController connJumlahBarang = TextEditingController();
  TextEditingController connCaraBeli = TextEditingController();

  String namaBarang = "";
  double hargaBarang = 0, totalHarga = 0, diskon = 0, totalBarang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Latihan Kondisi'))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 18,
          children: [
            TextField(
              controller: connCodeBarang,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Code Barang',
              ),
            ),
            TextField(
              controller: connJumlahBarang,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Jumlah Barang',
              ),
            ),
            TextField(
              controller: connCaraBeli,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cara Beli',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        switch (connCodeBarang.text.toUpperCase()) {
                          case "AC":
                            namaBarang = "Air Conditioner";
                            hargaBarang = 4500000;
                            break;
                          case "HP":
                            namaBarang = "Handphone";
                            hargaBarang = 3500000;
                            break;
                          case "TV":
                            namaBarang = "Televisi";
                            hargaBarang = 5500000;
                            break;
                          default:
                            namaBarang = "Kode Barang Tidak Ditemukan";
                            hargaBarang = 0;
                        }
                        totalBarang =
                            double.parse(connJumlahBarang.text);
                        totalHarga = hargaBarang * totalBarang;
                        if (connCaraBeli.text.toUpperCase() == "CASH") {
                          diskon = 0.1 * totalHarga;
                        } else {
                          diskon = 0;
                        }
                        totalHarga -= diskon;
                      });
                    },
                    child: Text('PROSES'),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        namaBarang = "";
                        hargaBarang = 0;
                        totalHarga = 0;
                        diskon = 0;
                        totalBarang = 0;
                        connCodeBarang.clear();
                        connJumlahBarang.clear();
                        connCaraBeli.clear();
                      });
                    },
                    child: Text('KOSONGKAN'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Barang : ${namaBarang}"),
                Text("Harga Barang : ${hargaBarang}"),
                Text("Total Harga : ${totalHarga}"),
                Text("Diskon : ${diskon}"),
                Text("Total Barang : ${totalBarang}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
