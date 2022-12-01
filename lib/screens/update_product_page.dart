import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

import '../services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                hintText: 'Product name',
                onChange: (data) {
                  productName = data;
                },
              ),
              CustomTextField(
                hintText: 'Description',
                onChange: (data) {
                  desc = data;
                },
              ),
              CustomTextField(
                onChange: (data) {
                  price = data;
                },
                hintText: 'Price',
                inputType: TextInputType.number,
              ),
              CustomTextField(
                hintText: 'Image',
                onChange: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Update',
                ontap: () async {
                  isLoading = true;
                  setState(() {});
                  // try {
                  await updateProduct(product);
                  // } catch (e) {
                  // throw Exception(e);
                  // }
                  isLoading = false;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
