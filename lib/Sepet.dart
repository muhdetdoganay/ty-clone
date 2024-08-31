import 'package:flutter/material.dart';

import 'SepetUrunWidget.dart';

class Sepet extends StatefulWidget {
  const Sepet({super.key});

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SepetUrun(),
          ],
        ),
      ),
    );
  }
}
