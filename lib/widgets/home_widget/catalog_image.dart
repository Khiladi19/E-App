import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .color(context.canvasColor)
        .make()
        .px16()
        .py16()
        .wPCT(context: context, widthPCT: context.isMobile?40:15);
  }
}
