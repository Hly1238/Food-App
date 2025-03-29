import 'dart:convert';

import 'package:food_app/models/item.dart';
import 'package:food_app/service/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var categoryList = [].obs;
  var ingredientList = [].obs;
  var itemList = [].obs;
  var mealByCate = [].obs;
  var mealByIngredient = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      await Future.wait([
        getCategoryList(),
        getIngredientList(),
        getItemsList(),
        getMealByCate(),
        getMealByIngredient()
      ]);
    } catch (e) {
      print("Error loading data: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCategoryList() async {
    try {
      isLoading(true);

      var result = await HomeService().getCategoryList();
      if (result != null) {
        final parsed = jsonDecode(result.body) as Map<String, dynamic>;
        if (parsed['meals'] != null) {
          categoryList.assignAll(
              parsed['meals'].map((json) => json['strCategory']).toList());
        }
      }
    } catch (e) {
      print("Error loading: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getIngredientList() async {
    try {
      isLoading(true);

      var result = await HomeService().getIngredientList();
      if (result != null) {
        final parsed = jsonDecode(result.body) as Map<String, dynamic>;
        if (parsed['meals'] != null) {
          ingredientList.assignAll(
              parsed['meals'].map((json) => json['strIngredient']).toList());
        }
      }
    } catch (e) {
      print("Error loading: $e");
    } finally {
      isLoading(false);
    }
  }

  //todo Get Meal
  Future<void> getItemsList() async {
    try {
      isLoading(true);

      var result = await HomeService().getItemList();
      if (result != null) {
        final parsed = jsonDecode(result.body) as Map<String, dynamic>;
        if (parsed['meals'] != null) {
          itemList.assignAll(
            parsed['meals'].map<Item>((json) => Item.fromJson(json)).toList(),
          );
        }
      }
    } catch (e) {
      print("Error loading: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMealByCate() async {
    try {
      isLoading(true);

      var result = await HomeService().getMealByCategory();
      if (result != null) {
        final parsed = jsonDecode(result.body) as Map<String, dynamic>;
        if (parsed['meals'] != null) {
          mealByCate.assignAll(
            parsed['meals'].map<Item>((json) => Item.fromJson(json)).toList(),
          );
        }
      }
    } catch (e) {
      print("Error loading: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMealByIngredient() async {
    try {
      isLoading(true);

      var result = await HomeService().getMealByIngredient();
      if (result != null) {
        final parsed = jsonDecode(result.body) as Map<String, dynamic>;
        if (parsed['meals'] != null) {
          mealByIngredient.assignAll(
            parsed['meals'].map<Item>((json) => Item.fromJson(json)).toList(),
          );
        }
      }
    } catch (e) {
      print("Error loading: $e");
    } finally {
      isLoading(false);
    }
  }
}
