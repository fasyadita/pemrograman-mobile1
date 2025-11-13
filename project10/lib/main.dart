import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MODEL SEDERHANA - Data dan Business Logic
class AppSettings {
  bool isDarkMode = false;
  String userName = "Teman";
  int fontSize = 20;

  Color get backgroundColor {
    return isDarkMode ? Colors.grey[900]! : Colors.white;
  }

  Color get textColor {
    return isDarkMode ? Colors.white : Colors.black;
  }

  String get greeting {
    return "Halo, $userName!";
  }
}

// View + State
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // MODEL
  AppSettings settings = AppSettings();

  // FUNGSI UNTUK UPDATE MODEL
  void toggleTheme() {
    setState(() {
      settings.isDarkMode = !settings.isDarkMode;
    });
  }

  void updateName(String newName) {
    setState(() {
      settings.userName = newName;
    });
  }

  void increaseFont() {
    setState(() {
      settings.fontSize += 2;
    });
  }

  void decreaseFont() {
    setState(() {
      if (settings.fontSize > 12) {
        settings.fontSize -= 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: settings.isDarkMode ? ThemeData.dark() : ThemeData.light(),
    home: Scaffold(
      backgroundColor: settings.backgroundColor,
      appBar: AppBar(
        title: Text(settings.greeting.toUpperCase()),
        backgroundColor:
            settings.isDarkMode ? Colors.blueGrey[800] : Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center, // Ini ada di slide 1 tapi mungkin dihilangkan agar bisa di-scroll
          children: [
            // AMBIL DATA DARI MODEL
            Text(
              settings.greeting,
              style: TextStyle(
                fontSize: settings.fontSize.toDouble(),
                color: settings.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            // STATUS THEME
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: settings.isDarkMode
                    ? Colors.blueGrey[800]
                    : Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settings.isDarkMode ? "Gelap 🌙" : "Terang ☀️",
                    style: TextStyle(
                      color: settings.textColor,
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: settings.isDarkMode,
                    onChanged: (value) => toggleTheme(), // Memanggil fungsi dari state
                    activeColor: Colors.blue,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // NAMA ANDA
            TextField(
              // onChanged: (value) => updateName(value), // Logika ini mungkin ada tapi tidak terlihat
              decoration: InputDecoration(
                hintText: "Nama Anda",
                labelText: "Nama",
                labelStyle: TextStyle(color: settings.textColor),
                border: OutlineInputBorder(),
                fillColor:
                    settings.isDarkMode ? Colors.grey[800] : Colors.grey[100],
                filled: true,
                hintStyle: TextStyle(color: settings.textColor),
              ),
            ),

            SizedBox(height: 20),

            // ATUR FONT
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: settings.isDarkMode
                    ? Colors.blueGrey[800]
                    : Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ukuran Font",
                        style: TextStyle(
                          color: settings.textColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${settings.fontSize}',
                        style: TextStyle(
                          color: settings.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: decreaseFont,
                        icon: Icon(Icons.remove_circle,
                            color: settings.textColor),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: increaseFont,
                        icon: Icon(Icons.add_circle,
                            color: settings.textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // PREVIEW TEXT
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                    color: settings.textColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Ini adalah preview text dengan ukuran font ${settings.fontSize}',
                style: TextStyle(
                  fontSize: settings.fontSize.toDouble(),
                  color: settings.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button ditambahkan di luar body
      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme,
        child: Icon(settings.isDarkMode
            ? Icons.light_mode
            : Icons.dark_mode),
        backgroundColor:
            settings.isDarkMode ? Colors.blueGrey[800] : Colors.blue,
        ),
      )
    );
  }
}