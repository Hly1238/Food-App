import 'package:http/http.dart' as http;

import 'package:food_app/core/utils/url_api.dart';

class HomeService {
  var client = http.Client();

  Future<dynamic> getCategoryList() async {
    var response = await client.get(
      Uri.parse(UrlAPI.categoriesList),
    );
    return response;
  }

  Future<dynamic> getIngredientList() async {
    var response = await client.get(
      Uri.parse(UrlAPI.ingredientsList),
    );
    return response;
  }

  // todo Get meals
  Future<dynamic> getItemList() async {
    var response = await client.get(
      Uri.parse(UrlAPI.itemList),
    );
    return response;
  }

  Future<dynamic> getMealByCategory() async {
    var response = await client.get(
      Uri.parse(UrlAPI.getMealByCategory),
    );
    return response;
  }

  Future<dynamic> getMealByIngredient() async {
    var response = await client.get(
      Uri.parse(UrlAPI.getMealByIngredient),
    );
    return response;
  }
}
