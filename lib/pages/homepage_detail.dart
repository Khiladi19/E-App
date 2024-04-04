import 'package:eapp/widgets/home_widget/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eapp/models/catalog.dart';

// import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,

          // buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.prices}".text.bold.xl4.red400.make(),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(
            //         // ignore: deprecated_member_use
            //         context.theme.buttonColor,
            //       ),
            //       shape: MaterialStateProperty.all(
            //         const StadiumBorder(),
            //       )),
            //   child: "Buy".text.xl.make(),
            // )
            //
            AddToCart(catalog: catalog,).wh(100, 50),
          ],
        ).py8(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 20.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text.bold
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                    ],
                  ).p64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
