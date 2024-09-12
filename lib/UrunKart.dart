import 'package:flutter/material.dart';

class UrunKart extends StatefulWidget {
  final String ad, aciklama, marka;
  final int fiyat;
  const UrunKart({
    super.key,
    required this.ad,
    required this.aciklama,
    required this.marka,
    required this.fiyat,
  });

  @override
  State<UrunKart> createState() => _UrunKartState();
}

class _UrunKartState extends State<UrunKart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54, width: 0.5)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('foto gelecek'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(this.widget.ad),
                SizedBox(
                  height: 10,
                ),
                Text(this.widget.aciklama),
                SizedBox(
                  height: 10,
                ),
                Text(this.widget.fiyat.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
