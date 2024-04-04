import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// import '../../widgets/themes.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Mapp".text.xl5.bold.color(context.accentColor).make(),
        "Trending Products".text.xl2.color(context.accentColor).make(),
      ],
    );
  }
}
