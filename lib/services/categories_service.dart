import 'package:store/helper/Api.dart';
import 'package:store/models/productModel.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    const baseUrl = 'https://fakestoreapi.com';

    List<dynamic> data =
        await Api().get(url: '$baseUrl/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
