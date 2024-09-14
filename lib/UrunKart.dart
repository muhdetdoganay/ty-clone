import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UrunKart extends StatefulWidget {
  final String ad, aciklama, marka, foto;
  final int fiyat;
  const UrunKart({
    super.key,
    required this.ad,
    required this.aciklama,
    required this.marka,
    required this.fiyat,
    required this.foto,
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
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ürünün fotoğrafı
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
                      return Image.network(snapshot.data!, fit: BoxFit.cover);
                    }
                  },
                ),
              ],
            ),
          ),

          SizedBox(width: 10), // Fotoğraf ve yazılar arasında boşluk

          // Ürünün detayları
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.ad,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.aciklama,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(
                  'Fiyat: ${widget.fiyat} TL',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
