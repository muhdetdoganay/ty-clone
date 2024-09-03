import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:turuncu_site/Favoriler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<String> fotolar = [
    'images/1920x1080-web2_1680270380.jpg',
    'images/header-devindirim.webp',
    'images/Hepsiburada-mayis-indirim.jpg',
    'images/maxresdefault.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SearchBar(
              controller: SearchController(),
              hintText: 'Ürün, kategori veya marka ara',
              leading: Icon(Icons.search),
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        child: Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                      Text('Kategoriler'),
                    ],
                  ),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(fotolar[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(fotolar[1]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(fotolar[2]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(fotolar[3]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            UrunKart(),
            UrunKart(),
            UrunKart(),
          ],
        ),
      ),
    );
  }
}
