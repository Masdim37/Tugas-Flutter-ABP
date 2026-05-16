import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'buku.dart';

void main() {
  runApp(const MyApp12());
}

class MyApp12 extends StatefulWidget {
  const MyApp12({super.key});

  @override
  State<MyApp12> createState() => _MyAppState();
}

Future<List<Buku>> fetchBuku() async {
  final res = await http.get(Uri.parse('http://192.168.1.131:8000/api/buku'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed.map<Buku>((json) => Buku.fromJson(json)).toList();
  } else {
    throw Exception('Failed');
  }
}

class _MyAppState extends State<MyApp12> {
  late Future<List<Buku>> buku;

  @override
  void initState() {
    super.initState();
    buku = fetchBuku();
  }

  // 1. Buat fungsi untuk memuat ulang data
  Future<void> _refreshData() async {
    setState(() {
      buku = fetchBuku(); // Panggil ulang API dan perbarui state
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder<List<Buku>>(
            future: buku,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Terjadi kesalahan : ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak Ada Data',
                      style: TextStyle(color: Colors.teal, fontSize: 28),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: _refreshData,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            margin: EdgeInsets.only(
                              bottom: 40,
                              left: 10,
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].judul_buku,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Penulis : ${snapshot.data![index].penulis}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Penerbit : ${snapshot.data![index].penerbit}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Jumlah Halaman : ${snapshot.data![index].jumlah_halaman.toString()}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Tahun Terbit : ${snapshot.data![index].tahun_terbit}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
