import 'package:store/helper/Api.dart';
import 'package:store/models/productModel.dart';
import 'package:store/models/ratingModel.dart';

class UpdateProductService {
  static Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String desc,
      required String image,
      required String category,
      required String price,
      required Ratingmodel rate}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id': id.toString(),
        'title': title,
        'description': desc,
        'image': image,
        'category': category,
        'rating': {
          'rate': rate.rate,
          'count': rate.count,
        }
      },
    );
    return ProductModel.fromJson(data);
  }
}
