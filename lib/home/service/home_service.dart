import 'dart:convert';
import 'package:chennai_demo/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  final String baseUrl = "https://dummyjson.com/products";
  Future<List<HomeModel>> fetchHomeList(int limit, int skip) async {
    final response = await http.get(
      Uri.parse("$baseUrl?limit=$limit&skip=$skip"),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<HomeModel> homes = [];
      for (var item in data['products']) {
        homes.add(HomeModel.fromJson(item));
      }
      return homes;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
