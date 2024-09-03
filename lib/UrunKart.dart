import 'package:flutter/material.dart';

class UrunKart extends StatelessWidget {
  const UrunKart({
    super.key,
  });

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
              children: [Text('başlık'), Text('açıklama'), Text('ücret')],
            ),
          )
        ],
      ),
    );
  }
}
