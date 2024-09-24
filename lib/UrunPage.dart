import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turuncu_site/Favoriler.dart';

import 'UrunKart.dart';

class UrunPage extends StatefulWidget {
  final Map data;
  const UrunPage({super.key, required this.data});

  @override
  State<UrunPage> createState() => _UrunPageState();
}

class _UrunPageState extends State<UrunPage> {
  late String kategoriId = this.widget.data['id'];
  @override
  Widget build(BuildContext context) {
    CollectionReference urunler = FirebaseFirestore.instance.collection('ty');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${kategoriId}'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: urunler.where('id', isEqualTo: kategoriId).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (asyncSnapshot.hasError) {
            return Center(
                child: Text('Bir hata oluştu: ${asyncSnapshot.error}'));
          }
          if (!asyncSnapshot.hasData || asyncSnapshot.data!.docs.isEmpty) {
            return Center(child: Text('Bu kategoride ürün bulunamadı'));
          }

          List<DocumentSnapshot> listOfDocs = asyncSnapshot.data!.docs;

          return ListView.builder(
            itemCount: listOfDocs.length,
            itemBuilder: (context, index) {
              var data = listOfDocs[index].data() as Map<String, dynamic>;
              return UrunKart(
                ad: data['ad'],
                fiyat: data['fiyat'],
                marka: data['marka'],
                aciklama: data['aciklama'],
                foto: data['foto'],
                data: data,
              );
            },
          );
        },
      ),
    );
  }
}
