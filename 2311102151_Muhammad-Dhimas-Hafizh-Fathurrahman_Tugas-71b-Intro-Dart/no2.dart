//Nama : Muhammad Dhimas Hafizh Fathurrahman
//NIM : 2311102151
//Kelas : PS1IF-11-REG04
//NO 2_TUGAS 7.1b Intro Dart

//Function untuk menghitung FPB
int hitungFPB(int a, int b) {
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}

void main(){
  int bilangan1 = 12;
  int bilangan2 = 8;
  
  int hasilFPB = hitungFPB(bilangan1, bilangan2);

  print('Bilangan 1 = $bilangan1');
  print('Bilangan 2 = $bilangan2');
  print('FPB $bilangan1 dan $bilangan2 = $hasilFPB');
}