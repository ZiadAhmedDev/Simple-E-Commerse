import 'package:store/helper/api.dart';

class AllCategoryServices {
  Future<List<dynamic>?> getCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
