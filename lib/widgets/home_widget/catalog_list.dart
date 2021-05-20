import 'package:e_com/models/catalog.dart';
import 'package:e_com/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog,
                ),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}
