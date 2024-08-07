import 'package:store/helper/Api.dart';
import 'package:store/models/productModel.dart';

class AllproductsService {
  Future<List<ProductModel>> getAllProducts() async {
    const baseUrl = 'https://fakestoreapi.com';
    List<dynamic> data = await Api().get(url: '$baseUrl/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
