import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/data/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Stack(
         children: [
           Container(
             height: 100,
             width: 170,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 image: DecorationImage(
                     image: NetworkImage(product.thumbnail),
                     fit: BoxFit.contain
                 )
             ),
             margin: EdgeInsets.symmetric(vertical: 7),
           ),
           Positioned(
             top: 13,
             right: 10,
             child: Container(
             height: 30,
             width: 30,
             decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/image2.png')
             ),
             )

             ),
           )
         ],
       ),
         Container(
           height: 50,
           width: 170,
           child: Text(product.title,
            style: TextStyle(color: Colors.black54, fontSize: 15),
            softWrap: true),
         ),

        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.attach_money_outlined, size: 20),
              Text(product.price.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}
