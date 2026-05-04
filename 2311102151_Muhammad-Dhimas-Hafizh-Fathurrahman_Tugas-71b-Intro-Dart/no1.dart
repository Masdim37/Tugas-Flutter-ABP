//Nama : Muhammad Dhimas Hafizh Fathurrahman
//NIM : 2311102151
//Kelas : PS1IF-11-REG04
//NO 1_TUGAS 7.1b Intro Dart

void main() {
List<List<int>> array2D = []; //deklarasi array 2 dimesi (list didalam list)

  List<int> baris1 = []; //baris 1 : 4 bilangan kelipatan 6 berurutan mulai dari 6
  for (int i = 1; i <= 4; i++) {
    baris1.add(i * 6);
  }
  array2D.add(baris1);

  List<int> baris2 = []; //baris 2 : 5 bilangan ganjil berurutan mulai dari 3
  int nilaiGanjil = 3;
  for (int i = 0; i < 5; i++) {
    baris2.add(nilaiGanjil);
    nilaiGanjil += 2;
  }
  array2D.add(baris2);

  List<int> baris3 = []; //baris 3 : 6 bilangan pangkat tiga dari bilangan asli mulai dari 4
  int nilaiAwal = 4;
  for (int i = 0; i < 6; i++) {
    baris3.add(nilaiAwal * nilaiAwal * nilaiAwal);
    nilaiAwal++;
  }
  array2D.add(baris3);

  List<int> baris4 = []; //baris 4 : 7 bilangan asli berurutan beda 7 mulai dari 3
  int nilaiBeda7 = 3;
  for (int i = 0; i < 7; i++) {
    baris4.add(nilaiBeda7);
    nilaiBeda7 += 7;
  }
  array2D.add(baris4);

  print('Isi List =');
  for (var baris in array2D) {
    //join(' ') digunakan untuk menggabungkan elemen list menjadi string dengan spasi
    print(baris.join(' ')); 
  }
}