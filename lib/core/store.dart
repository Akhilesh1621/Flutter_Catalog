import 'package:e_com/models/cart.dart';
import 'package:e_com/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  Mystore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
