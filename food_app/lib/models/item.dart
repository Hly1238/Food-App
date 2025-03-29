class Item {
  final String id;
  final String name;
  final String thumb;

  Item({
    required this.id,
    required this.name,
    required this.thumb,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['idMeal'],
        name: json['strMeal'],
        thumb: json['strMealThumb'],
      );

  @override
  String toString() {
    return 'item: $name; id: $id';
  }
}
