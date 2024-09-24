import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turuncu_site/UrunPage.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({super.key});

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

final _firestore = FirebaseFirestore.instance;

class _KategorilerState extends State<Kategoriler> {
  @override
  Widget build(BuildContext context) {
    CollectionReference tyfb = _firestore.collection('ty');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Kategoriler'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tyfb.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncsnapshot) {
          if (asyncsnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (asyncsnapshot.hasError) {
            return Center(
                child: Text('Bir hata oluştu: ${asyncsnapshot.error}'));
          }
          if (!asyncsnapshot.hasData || asyncsnapshot.data!.docs.isEmpty) {
            return Center(child: Text('Veri bulunamadı'));
          }

          List<DocumentSnapshot> listOfDocs = asyncsnapshot.data!.docs;

          return ListView.builder(
            itemCount: listOfDocs.length,
            itemBuilder: (context, index) {
              var data = listOfDocs[index].data() as Map<String, dynamic>;
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UrunPage(
                        data: data,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  overlayColor: WidgetStateProperty.all(Colors.white),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_right),
                  title: Text('${data['id'] ?? 'Bilinmeyen Kategori'}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
