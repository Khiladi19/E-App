
import 'package:eapp/pages/homepage_detail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CalalogList extends StatelessWidget {
  const CalalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile? GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (contex, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
      ): ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (contex, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),


        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.color(context.accentColor).make(),
            catalog.desc.text.bold.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.prices}".text.bold.xl.make(),
                AddToCart(
                  catalog: catalog,
                )
              ],
            )
          ],
        ).p(context.isMobile?0:16)

        )
      ];


    return VxBox(
        child: context.isMobile? Row(
      children: children2,
    ):Column(children: children2)
    
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

// class AddToCart extends StatefulWidget {
//   final Item catalog;
//   const AddToCart({
//     Key? key,
//     required this.catalog,
//   }) : super(key: key);

//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   final _cart = CartModel();
//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog) ?? false;
//     return ElevatedButton(
//         onPressed: () {
//           if(!isInCart){
//             isInCart = isInCart.toggle();
//             final _catalog = CatalogModel();
//             _cart.catalog = _catalog;
//             _cart.add(widget.catalog);
//             setState(() {});
//           }

//           // isInCart = isInCart.toggle();
//           // final _catalog = CatalogModel();
//           // // final _cart = CartModel();
//           // _cart.catalog = _catalog;
//           // _cart.add(widget.catalog);
//           // setState(() {});
//         },
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//               // ignore: deprecated_member_use
//               context.theme.buttonColor,
//               // Mythemes.darkbuishcolor,
//             ),
//             shape: MaterialStateProperty.all(
//               const StadiumBorder(),
//             )),
//         child: isInCart ? const Icon(Icons.done) : "Add to cart".text.make());
//   }
// }
