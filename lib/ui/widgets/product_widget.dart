import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/data/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 35,),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(30)
          ),
        ),
        Container(
          height: 150,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 35,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(30)),
            image: DecorationImage(image: NetworkImage(product.thumbnail),
            fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 160,
          left: 70,
          child: SizedBox(
              height: 55,
              width: 250,
              child: Text(product.title, style:
                TextStyle(fontSize: 15),)),
        )
      ],
    );
  }
}
