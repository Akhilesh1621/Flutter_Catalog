import 'package:e_com/models/catalog.dart';
import 'package:e_com/widgets/Item_widget.dart';
import 'package:e_com/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummnyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummnyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummnyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
