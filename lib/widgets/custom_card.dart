import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.product});

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UpdateProductPage.id,
          arguments: product),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.7),
                  offset: const Offset(7, 7),
                  spreadRadius: 0,
                  blurRadius: 10)
            ]),
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 12).toString(),
                      style:
                          const TextStyle(color: Color.fromARGB(131, 0, 0, 0)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price}'),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -50,
            child: Image.network(
              product.image,
              height: 100,
              width: 80,
            ),
          )
        ],
      ),
    );
  }
}
