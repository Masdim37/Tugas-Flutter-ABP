import 'package:flutter/material.dart';
import 'package:tugas92layout3/main.dart';

void main() {
  runApp(const MyApp11_1());
}

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 11',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'ABP Minggu 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variabel untuk sinkronisasi PageView dan NavigationBar
  int selected = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ==========================================
        // 1. BAGIAN PAGEVIEW
        // ==========================================
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            // Sinkronisasi saat halaman di-swipe
            setState(() {
              selected = index;
            });
          },
          children: [
            // Halaman 1 (Home)
            Center(
              child: InkWell(
                child: Text(
                  'Go to Home Page',
                  style: TextStyle(color: Colors.indigo, fontSize: 30),
                ),
                onTap: () {
                  // PERBAIKAN: Arahkan ke halaman spesifik, bukan memanggil ulang MyApp11_1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            ),
            // Halaman 2 (Email)
            Center(child: Text('Email page', style: TextStyle(fontSize: 30))),
            // Halaman 3 (Profile)
            Center(child: Text('Profile page', style: TextStyle(fontSize: 30))),
          ],
        ),
      ),
      // ==========================================
      // 2. BAGIAN BOTTOM NAVIGATION BAR
      // ==========================================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected, // Menyesuaikan dengan state
        onTap: (index) {
          // Sinkronisasi saat ikon navigasi ditekan
          setState(() {
            selected = index;
          });
          // Menganimasikan perpindahan PageView
          pc.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Email'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
