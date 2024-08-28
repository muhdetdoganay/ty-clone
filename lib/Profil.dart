import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.pinkAccent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Text(
                          'AG',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Hoşgeldiniz Ayşe Hanım',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ))),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.orange,
                  ),
                  title: Text('Bilgilerim'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_shipping,
                    color: Colors.orange,
                  ),
                  title: Text('Siparişlerim'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.orange,
                  ),
                  title: Text('Ayarlar'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_city_outlined,
                    color: Colors.orange,
                  ),
                  title: Text('Adreslerim'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.support_agent_sharp,
                    color: Colors.orange,
                  ),
                  title: Text('Müşteri Hizmetleri'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outlined,
                    color: Colors.orange,
                  ),
                  title: Text('Geri Bildirim'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.orange,
                  ),
                  title: Text('Çıkış Yap'),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
