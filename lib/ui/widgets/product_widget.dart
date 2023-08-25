import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/data/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: 330,
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(30)),
              image: DecorationImage(image: NetworkImage(product.thumbnail),
                  fit: BoxFit.fill),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 70,
                width: 330,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30), top: Radius.zero),
                ),
              ),
              Positioned(
                //top: 160,
                bottom: 7,
                left: 70,
                child: SizedBox(
                    height: 55,
                    width: 250,
                    child: Text(product.title, style:
                    TextStyle(fontSize: 15),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
