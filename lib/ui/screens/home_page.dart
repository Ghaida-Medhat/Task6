import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task2/ui/widgets/product_widget.dart';
import '../../data/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Product> products = [
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ9fINW8tf9DipRZXNoL6mmUQ9ZDkGOkJr0d1UwUMUQgyDmShHJ'
    ),
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSx1WvygeOSjhvJ2mS-CcP4Bc16M8YiCVbxsrhIA9gKCiEZ8cT6'
    ),
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT-ngemPzUJ7WqmvA_I9uiAVOQ0UAiFC3mCaST34RpZBKlNWxno'
    ),
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ9fINW8tf9DipRZXNoL6mmUQ9ZDkGOkJr0d1UwUMUQgyDmShHJ'
    ),
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSx1WvygeOSjhvJ2mS-CcP4Bc16M8YiCVbxsrhIA9gKCiEZ8cT6'
    ),
    Product(
        title: "e. I can't express how happy i am with the fantastic service. I'm going to be using them a lot!",
        thumbnail: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT-ngemPzUJ7WqmvA_I9uiAVOQ0UAiFC3mCaST34RpZBKlNWxno'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Welcome to \n'
                      'EGYDYNAMIC..',
                    style: TextStyle(fontSize: 27, color: Colors.black),),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS6TxLc1EQfa5P6sIEbZ-dTVVrCgXHDBmeR0JsHYFCi7pw7aftV'))
                    ),
                  )
                ],
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext, int index) {
                  return ProductItem(product: products[index]);
                },
                shrinkWrap: true,

              ),
            ],
          ),
        ),
      )

    );
  }
}
