import 'package:e_com/core/store.dart';
import 'package:e_com/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  CatalogModel _catalog;

  //collection of id - store ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class Addmutation extends VxMutation<Mystore> {
  final Item item;

  Addmutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class Removemutation extends VxMutation<Mystore> {
  final Item item;

  Removemutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
