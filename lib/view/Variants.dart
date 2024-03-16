import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modalclass/modalclass.dart';

class Variantsss extends StatelessWidget {
  Variantsss({Key? key, required this.variant}) : super(key: key);
  final List<Variant> variant; // Corrected variable name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Variants")),
      body: GridView.builder(
        itemCount: variant.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          var vaaary = variant[index];


          return Card(
            child: InkWell(

              child: Center(
                child: ListTile(
                  title: Text(
                    vaaary.variantName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MRP: ${vaaary.mrp ?? ""}"),
                      Text("Offer Price: ${vaaary.offerPrice ?? ""}"),
                      Text("Stock: ${vaaary.stock ?? ""}"),
                      SizedBox(height: 8),
                      if (!(vaaary.stock ?? false)) // Display indicator if stock is false
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.error, color: Colors.red), // Add error icon
                            Text(
                              "Sold Out",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
