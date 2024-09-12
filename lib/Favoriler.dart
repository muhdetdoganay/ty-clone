import 'package:flutter/material.dart';

import 'UrunKart.dart';

class Favoriler extends StatefulWidget {
  const Favoriler({super.key});

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoriler'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //UrunKart(),
          ],
        ),
      ),
    );
  }
}
