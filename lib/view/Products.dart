import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Modalclass/modalclass.dart';
import 'Variants.dart';

class Products22 extends StatelessWidget {
  final List<Product> products;

  Products22({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          var product = products[index];
          var variants = product.variants; // Accessing directly as it's a list

          return Card(
            child: InkWell(
              onTap: () {
                if (variants != null) {
                  Get.to(Variantsss(  variant: variants,));
                } else {
                  // Handle null variants
                }
              },
              child: Center(
                child: ListTile(
                  title: Text(
                    product.productName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(product.categoryName ?? ""),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
