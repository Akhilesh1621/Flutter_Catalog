import 'package:e_com/models/catalog.dart';
import 'package:e_com/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: MyTheme.creamColor,
          bottomNavigationBar: Container(
            color: Colors.white,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.all(0),
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBulishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "Add to cart".text.xl.make(),
                ).wh(130, 50)
              ],
            ).p32(),
          ),
          body: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBulishColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                        "Clita takimata dolor diam amet et diam dolor. Amet consetetur kasd et et et lorem. Dolores sanctus sit est tempor accusam amet consetetur magna, diam no est sit dolores, elitr accusam et consetetur et aliquyam, ipsum sed ea sit dolor. Stet dolor et eos sed sanctus, amet gubergren dolore accusam."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py64(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
