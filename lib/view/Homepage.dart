import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getx.dart';
import 'Product_Categories.dart';
import 'Products.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final ctrl = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MERCHANT NAMES"),),
      body: Obx(() {
        return ctrl.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: GridView.builder(
                  itemCount: ctrl.merchantname.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    var data = ctrl.merchantname.value[index];
                    var products = ctrl.merchantname.value[index].results?.products;
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Get.to(Products22(products: products!,));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            data.results.merchantName ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
