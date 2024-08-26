import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(),
        )),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.white,
          backgroundColor: Colors.white,
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
              label: 'Saved',
            ),
          ],
        ),
      ),
    );
  }
}
