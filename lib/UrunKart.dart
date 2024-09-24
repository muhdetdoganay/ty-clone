import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:turuncu_site/Urun.dart';

class UrunKart extends StatefulWidget {
  final Map data;
  final String ad, aciklama, marka, foto;
  final int fiyat;
  const UrunKart({
    super.key,
    required this.ad,
    required this.aciklama,
    required this.marka,
    required this.fiyat,
    required this.foto,
    required this.data,
  });

  @override
  State<UrunKart> createState() => _UrunKartState();
}

class _UrunKartState extends State<UrunKart> {
  late Future<String> _imageUrl;

  @override
  void initState() {
    super.initState();
    _imageUrl = _getImageUrl(widget.foto);
  }

  Future<String> _getImageUrl(String filePath) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(filePath);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception("Fotoğraf yolu alınamadı: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(maxHeight: 150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54, width: 0.5),
          color: Colors.white),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Urun(
                      data: widget.data,
                    )),
          );
        },
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            Colors.white,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<String>(
                    future: _imageUrl,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error, color: Colors.red);
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Icon(Icons.image_not_supported);
                      } else {
                        return Expanded(
                            child: Image.network(snapshot.data!,
                                fit: BoxFit.cover));
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.ad,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      'Fiyat: ${widget.fiyat} TL',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
