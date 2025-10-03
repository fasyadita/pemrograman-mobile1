import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Profile & Counter Apps",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ini appBar"),
          backgroundColor: Colors.lightBlue,
          leading: const Icon(Icons.menu),
          actions: const[              
            Icon(Icons.search),
            Icon(Icons.more_vert),
            FlutterLogo(size: 30.0),
          ],
        ),

        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Atas'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Icon(Icons.star, color: Colors.red, size: 40),
                  Icon(Icons.star, color: Colors.green, size: 40),
                  Icon(Icons.star, color: Colors.blue, size: 40),
                ],
              ),
              const Text("Bawah"),
              Image.asset("assets/image/images.jpg", width:150)
            ],
          ),
        ),

          floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),),

          drawer: Drawer(
            child :ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.purpleAccent),
                child: Text(
                  "Drawer Header",
                  style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 24),
                  ),
                ),
                ListTile(leading: Icon(Icons.home), title: Text('Messages')),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Profile'),
                ),
                ListTile(leading: Icon(Icons.settings), title: Text("Settings!")),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
            ],
          ),

        ),
      );
  }
}

