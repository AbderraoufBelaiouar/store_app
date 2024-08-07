import 'package:store/helper/Api.dart';
import 'package:store/models/productModel.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required int id,
      required String title,
      required String desc,
      required String image,
      required String category,
      required double price}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'id': id,
        'title': title,
        'desc': desc,
        'image': image,
        'category': category,
        'price': price
      },
    );
    return ProductModel.fromJson(data);
  }
}
