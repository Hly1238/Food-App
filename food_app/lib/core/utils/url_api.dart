class UrlAPI {
  static const String categoriesList =
      "https://www.themealdb.com/api/json/v1/1/list.php?c=list";
  static const String ingredientsList =
      "https://www.themealdb.com/api/json/v1/1/list.php?i=list";

  // Get meals by
  static const String itemList =
      "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian";
  static const String getMealByCategory =
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood';
  static const String getMealByIngredient =
      'https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast';
}
