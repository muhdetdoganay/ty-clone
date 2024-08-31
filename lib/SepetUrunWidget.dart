import 'package:flutter/material.dart';

class SepetUrun extends StatelessWidget {
  const SepetUrun({
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
              children: [
                Text('foto gelecek'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.orange,
                    )
                  ],
                ),
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
