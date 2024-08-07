import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/components/Custom_Text_Field.dart';
import 'package:store/components/Custom_button.dart';
import 'package:store/helper/show_snack_bar.dart';
import 'package:store/models/productModel.dart';
import 'package:store/services/update_product_service.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = "UpdateProductScreen";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, desc, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Update product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                CustomTextFormField(
                  fieldName: "Product name",
                  onChanged: (data) {
                    title = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  fieldName: "description",
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  type: TextInputType.number,
                  fieldName: "Price",
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(fieldName: "image"),
                const SizedBox(
                  height: 30,
                ),
                Custom_button(
                    onTapFunction: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(productModel);

                        // ignore: use_build_context_synchronously
                        showSnackBar(context, "Update done");
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: "Update")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService.updateProduct(
        id: productModel.id,
        category: productModel.category,
        desc: desc == null ? productModel.description : desc!,
        title: title == null ? productModel.title : title!,
        image: image == null ? productModel.image : image!,
        price: price == null ? productModel.price.toString() : price!,
        rate: productModel.rating!);
  }
}
