import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'Anasayfa.dart';
import 'Favoriler.dart';
import 'Profil.dart';
import 'Sepet.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indexs = 0;
  final ekranlar = [Anasayfa(), Favoriler(), Sepet(), Profil()];
  final Future<FirebaseApp> _initilaztion = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
            future: _initilaztion,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Beklenmeyen bir hata oluştu'),
                );
              } else if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: ekranlar[indexs],
                  bottomNavigationBar: NavigationBar(
                    indicatorColor: Colors.white,
                    backgroundColor: Colors.white,
                    selectedIndex: indexs,
                    onDestinationSelected: (int newIndex) {
                      setState(() {
                        indexs = newIndex;
                      });
                    },
                    destinations: const <Widget>[
                      NavigationDestination(
                        selectedIcon: Icon(
                          Icons.home,
                          color: Colors.orange,
                        ),
                        icon: Icon(Icons.home_outlined),
                        label: 'Anasayfa',
                      ),
                      NavigationDestination(
                          selectedIcon: Icon(
                            Icons.favorite_outlined,
                            color: Colors.orange,
                          ),
                          icon: Icon((Icons.favorite_border)),
                          label: 'Favoriler'),
                      NavigationDestination(
                        selectedIcon: Icon(
                          Icons.shopping_cart,
                          color: Colors.orange,
                        ),
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Sepet',
                      ),
                      NavigationDestination(
                        selectedIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        icon: Icon(Icons.person_outline_outlined),
                        label: 'Profil',
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
/**/
/*FutureBuilder(
future: _initilaztion,
builder: (context, snapshot) {
if (snapshot.hasError) {
return Center(
child: Text('Beklenmeyen bir hata oluştu'),
);
}
}),*/
