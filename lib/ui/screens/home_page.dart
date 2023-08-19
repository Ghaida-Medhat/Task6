import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task2/ui/widgets/product_widget.dart';
import '../../data/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'counter_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  List<Product> products = [
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
    Product(
        price: 499.90,
        title: 'Noise ColorFit Pro 2 Full Touch Control Smart Watch',
        thumbnail: 'https://svegifts.com/wp-content/uploads/2022/08/Artboard1copy2_fbcf911b-d9d1-4d6a-a260-89e2c06439c0.png'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Products',
              style: TextStyle(fontSize: 27)),
            Text('See All',
            style: TextStyle(fontSize: 20, color: Colors.white60),)
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(3),
        child: GridView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext, int index){
            return ProductItem(product: products[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      )

    );
  }
}
