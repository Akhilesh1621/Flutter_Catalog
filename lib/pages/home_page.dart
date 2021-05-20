import 'package:e_com/models/catalog.dart';
import 'package:e_com/utils/theme.dart';
import 'package:e_com/widgets/Item_widget.dart';
import 'package:e_com/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
// ################ chapter 14 #############3//

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    final prodcutsData = decodeData["products"];
    CatalogModel.items = List.from(prodcutsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyTheme.creamColor,
          body: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatlogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          )),
    );
  }
}

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(MyTheme.darkBulishColor).make(),
          "Treading Prodcuts".text.xl2.make(),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBulishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.all(0),
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBulishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        ),
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}





//  Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//               ? GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisSpacing: 16,
//                     crossAxisSpacing: 16,
//                     crossAxisCount: 2,
//                   ),
//                   itemBuilder: (context, index) {
//                     final item = CatalogModel.items[index];
//                     return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: GridTile(
//                         header: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(color: Colors.deepPurple),
//                           child: Text(
//                             item.name,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         child: Image.network(item.image),
//                         footer: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(color: Colors.black),
//                           child: Text(item.price.toString(),
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: CatalogModel.items.length,
//                 )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 )),
