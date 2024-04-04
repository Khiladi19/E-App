import 'package:eapp/core/store.dart';
import 'package:eapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // genarall create a objective
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;

  // catalog field
  late CatalogModel _catalog;

// collections of ids store in Ids in item
  final List<int> _itemIds = [];

// get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total prices
  num get totalPrices =>
      items.fold(0, (total, current) => total + current.prices);


  // add item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }


  // remove items
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
