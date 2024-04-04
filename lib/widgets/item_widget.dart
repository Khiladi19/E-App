import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  @override
  const ItemWidget({super.key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Image.asset('assets/images/iphone14.jpeg'),
        // leading: Image.asset(item.image),
        leading: Image.network(item.image),
        onTap: () {
          // ignore: avoid_print
          print("${item.name}pressed");
        },
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.prices}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.blue.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
