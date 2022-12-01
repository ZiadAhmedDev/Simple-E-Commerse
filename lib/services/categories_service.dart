import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class CategoryServices {
  Future<List<ProductModel>?> getAllCategory({required categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
