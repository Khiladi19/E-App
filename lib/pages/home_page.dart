import 'package:eapp/core/store.dart';
import 'package:eapp/models/cart.dart';
import 'package:eapp/utils/routes.dart';
import 'package:eapp/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eapp/models/catalog.dart';
import 'dart:convert';
import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';
// import 'package:http/http.dart'  as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    //  final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummylist = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      drawer: const Mydrawer(),
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation,RemoveMutation},
          builder:((context, store, status) => FloatingActionButton(
            // ignore: deprecated_member_use
            backgroundColor: context.theme.buttonColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartroute),
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(color: Vx.blue400,count: _cart.items.length,size: 20,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
        ))
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Catalogheader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  const CalalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )
        );
  }
}

// class catlogheader extends StatelessWidget {
//   const catlogheader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         "Mapp".text.xl5.bold.color(Mythemes.cremecolor).make(),
//         "Trending Products".text.xl2.color(Mythemes.cremecolor).make(),
//       ],
//     );
//   }
// }

// class CalalogList extends StatelessWidget {
//   const CalalogList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items[index];
//         return CatalogItem(catalog: catalog);
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;
//   const CatalogItem({
//     Key? key,
//     required this.catalog,
//   })  : assert(catalog != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: Row(
//       children: [
//         CatalogImage(image: catalog.image),
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name.text.lg.bold.color(Mythemes.darkbuishcolor).make(),
//             catalog.desc.text.bold.textStyle(context.captionStyle).make(),
//             10.heightBox,
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               // buttonPadding: EdgeInsets.zero,
//               children: [
//                 "\$${catalog.prices}".text.bold.xl.make(),
//                 ElevatedButton(
//                     onPressed: () {},
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                           Mythemes.darkbuishcolor,
//                         ),
//                         shape: MaterialStateProperty.all(
//                           const StadiumBorder(),
//                         )),
//                     child: "Buy".text.make())
//               ],
//             ),
//           ],
//         ))
//       ],
//     )).white.rounded.square(150).make().py16();
//   }
// }



// class CatalogImage extends StatelessWidget {
//   final String image;
//   const CatalogImage({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .rounded
//         .color(Mythemes.cremecolor)
//         .make()
//         .px16()
//         .py16()
//         .w40(context);
//   }
// }
