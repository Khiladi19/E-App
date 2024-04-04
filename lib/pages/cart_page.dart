import 'package:eapp/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl4.bold.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CardList().p32().expand(),
          const Divider(),
          const _CardTotal(),
        ],
      ),
    );
  }
}

class _CardTotal extends StatelessWidget {
  const _CardTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _cart = CartModel();
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          VxConsumer(
            mutations: const {RemoveMutation},
            builder: (BuildContext context, store, VxStatus? status) {
              return "\$${_cart.totalPrices}"
                  .text
                  .xl5
                  // ignore: deprecated_member_use
                  .color(context.theme.accentColor)
                  .make();
            },
            // builder: (context,_) {
            //   return "\$${_cart.totalPrices}".text.xl5.make();

            // },
          ),

          // "\$${_cart.totalPrices}"
          //     .text
          //     .xl5
          //     .color(context.theme.accentColor)
          //     .make()
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying  is not supported yet ".text.make(),
              ));
            },
            style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing is added to cart".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(_cart.items[index]),
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
