import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Modalclass/modalclass.dart';

class DataController extends GetxController {
  var merchantname = <Results>[].obs;
  var loading = true.obs;

  getData() async {
    loading.value = true;
    String url = "https://test.needoo.in/merchant/3/";
    var res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        // Check if jsonData is a list or a single object
        if (jsonData is List) {
          merchantname.value = List<Results>.from(
            jsonData.map((x) => Results.fromJson(x)),
          );
        } else if (jsonData is Map<String, dynamic>) {
          // If jsonData is a single object, convert it to a list containing one object
          merchantname.value = [Results.fromJson(jsonData)];
        }
        loading.value = false;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("$e");
    }
  }

  @override
  void onInit() {
   getData();
    super.onInit();
  }
}
