import 'package:eapp/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // _cart.catalog = _catalog;
            AddMutation(catalog);
            // _cart.add(catalog);
            // setState(() {});

          }

          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // // final _cart = CartModel();
          // _cart.catalog = _catalog;
          // _cart.add(widget.catalog);
          // setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              // ignore: deprecated_member_use
              context.theme.buttonColor,
              // Mythemes.darkbuishcolor,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            )),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
