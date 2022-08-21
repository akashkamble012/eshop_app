import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/ProductPage';
  const ProductPage({Key? key}) : super(key: key);

  @override
  createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Text('Hii'),
        ],
      ),
    );
  }
}


//
