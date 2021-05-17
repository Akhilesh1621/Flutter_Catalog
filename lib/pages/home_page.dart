import 'package:e_com/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text('welcome to 30 days'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
