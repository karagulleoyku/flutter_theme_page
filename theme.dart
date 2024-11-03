import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Başlangıç teması açık tema


  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme; // Temayı değiştir
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema Değiştirme',
      theme: isDarkTheme ? darkTheme : lightTheme, // Temayı belirle
      home: HomeScreen(onToggleTheme: toggleTheme), // Ana ekranı yükle
    );
  }
}

// Karanlık tema
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.pink,
  scaffoldBackgroundColor: Colors.grey[900],

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.pink, // Buton arka plan rengi pembe
      foregroundColor: Colors.white, // Buton yazı rengi beyaz
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Buton boyutu
      textStyle: TextStyle(fontSize: 22), // Buton yazı boyutu
    ),
  ),
);

// Açık tema
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Buton rengi
      foregroundColor: Colors.white, // Yazı rengi
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Buton boyutu
      textStyle: TextStyle(fontSize: 22), // Buton yazı boyutu
    ),
  ),
);

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  HomeScreen({required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema Seçiniz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tema Modu: ${Theme.of(context).brightness == Brightness.dark ? "Karanlık" : "Açık"}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onToggleTheme, // Butona tıklanınca tema değişir
              child: Text(
                'Tema Değiş',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black // Karanlık temada yazı rengi siyah
                      : Colors.white, // Açık temada yazı rengi beyaz
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
