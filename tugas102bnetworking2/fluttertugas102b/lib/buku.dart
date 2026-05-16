class Buku {
  final String bukuID;
  final String judul_buku;
  final String penulis;
  final String penerbit;
  final int jumlah_halaman;
  final String tahun_terbit;
  final DateTime created_at;
  final DateTime updated_at;

  const Buku({
    required this.bukuID,
    required this.judul_buku,
    required this.penulis,
    required this.penerbit,
    required this.jumlah_halaman,
    required this.tahun_terbit,
    required this.created_at,
    required this.updated_at,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      // Mengambil data sesungguhnya dari Map JSON
      bukuID: json['bukuID'] ?? '',
      judul_buku: json['judul_buku'] ?? '',
      penulis: json['penulis'] ?? '',
      penerbit: json['penerbit'] ?? '',

      // Memastikan tipe int ter-parsing dengan aman
      jumlah_halaman: json['jumlah_halaman'] is int
          ? json['jumlah_halaman']
          : int.tryParse(json['jumlah_halaman'].toString()) ?? 0,

      tahun_terbit: json['tahun_terbit'].toString(),

      // JSON mengembalikan tanggal dalam String, harus diubah ke objek DateTime Dart
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'].toString())
          : DateTime.now(),

      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'].toString())
          : DateTime.now(),
    );
  }
}
