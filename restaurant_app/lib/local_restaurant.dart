class Menu {
  final String name;

  Menu(this.name);

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(json['name']);
  }
}

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Map<String, List<Menu>> menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final value = (json['rating']).runtimeType;
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      pictureId: json['pictureId'] as String,
      city: json['city'] as String,
      rating:
          value == double ? json['rating'] : (json['rating'] as int).toDouble(),
      menus: Map.from(json['menus']).map((key, value) {
        final list = List.from(value).map((e) {
          return Menu.fromJson(e);
        }).toList();
        return MapEntry(key, list);
      }),
    );
  }
}
