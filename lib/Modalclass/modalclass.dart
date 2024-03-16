
import 'dart:convert';

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));

String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  int count;
  String next;
  dynamic previous;
  ResultsClass results;

  Results({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: ResultsClass.fromJson(json["results"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results.toJson(),
  };
}


class ResultsClass {
  int merchantId;
  String merchantName;
  List<Product> products;
  List<String> productCategories;

  ResultsClass({
    required this.merchantId,
    required this.merchantName,
    required this.products,
    required this.productCategories,
  });

  factory ResultsClass.fromJson(Map<String, dynamic> json) => ResultsClass(
    merchantId: json["merchant_id"],
    merchantName: json["merchant_name"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    productCategories: List<String>.from(json["product_categories"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "merchant_id": merchantId,
    "merchant_name": merchantName,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "product_categories": List<dynamic>.from(productCategories.map((x) => x)),
  };
}




class Product {
  int productId;
  String productName;
  String categoryName;
  String subcategoryName;
  List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.categoryName,
    required this.subcategoryName,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    categoryName: json["category_name"],
    subcategoryName: json["subcategory_name"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "category_name": categoryName,
    "subcategory_name": subcategoryName,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class Variant {
  int variantId;
  String variantName;
  String mrp;
  String offerPrice;
  bool stock;

  Variant({
    required this.variantId,
    required this.variantName,
    required this.mrp,
    required this.offerPrice,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    variantId: json["variant_id"],
    variantName: json["variant_name"],
    mrp: json["MRP"],
    offerPrice: json["offer_price"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "variant_id": variantId,
    "variant_name": variantName,
    "MRP": mrp,
    "offer_price": offerPrice,
    "stock": stock,
  };
}
