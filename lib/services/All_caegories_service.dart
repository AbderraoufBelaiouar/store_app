import 'package:store/helper/Api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    const baseUrl = 'https://fakestoreapi.com';

    List<dynamic> data = await Api().get(url: '$baseUrl/products/categories');
    return data;
  }
}
