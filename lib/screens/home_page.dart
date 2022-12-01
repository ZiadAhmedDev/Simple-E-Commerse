import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product_service.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus),
              color: Colors.black,
            )
          ],
          title: const Text(
            'New trend',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<ProductModel>?>(
          future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> product = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 65, left: 16, right: 16),
                child: GridView.builder(
                  itemCount: product.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: ((context, index) => CustomCard(
                        product: product[index],
                      )),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
