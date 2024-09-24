import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Urun extends StatefulWidget {
  final Map data;
  const Urun({super.key, required this.data});

  @override
  State<Urun> createState() => _UrunState();
}

class _UrunState extends State<Urun> {
  late Future<String> _imageUrl;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _imageUrl = _getImageUrl(widget.data['foto']);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              FutureBuilder<String>(
                future: _imageUrl,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Hata: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Text('Fotoğraf bulunamadı');
                  } else {
                    return Image.network(snapshot.data!);
                  }
                },
              ),
              Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              widget.data['ad'],
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorited ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFavorited = !isFavorited;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.orange),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Sepete Ekle',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Açıklama',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        widget.data['aciklama'],
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
