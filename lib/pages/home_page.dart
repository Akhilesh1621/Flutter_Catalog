import 'package:e_com/core/store.dart';
import 'package:e_com/models/cart.dart';
import 'package:e_com/models/catalog.dart';
import 'package:e_com/utils/routes.dart';
import 'package:http/http.dart' as http;
import 'package:e_com/widgets/home_widget/catalog_header.dart';
import 'package:e_com/widgets/home_widget/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    final prodcutsData = decodeData["products"];
    CatalogModel.items = List.from(prodcutsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {Addmutation, Removemutation},
          builder: (ctx, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.red500,
              size: 20,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
