import 'package:e_com/models/catalog.dart';

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

  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice => item.fold(0, (total, current) => total + current.price);

  // add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
