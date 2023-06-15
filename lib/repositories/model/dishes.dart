class Dishes {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String image_url;
  final List<String> tegs;

  Dishes({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.image_url,
    required this.tegs,
  });

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, price: $price, weight: $weight, description: $description, image_url: $image_url)';
  }

  factory Dishes.fromJson(Map<String, dynamic> json) {
    var tagsList = json['tegs'];
    if (tagsList == null) {
      tagsList = [];
    }
    return Dishes(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      description: json['description'],
      image_url: json['image_url']?.toString() ?? '',
      tegs: List<String>.from(tagsList),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'description': description,
      'image_url': image_url,
      'tegs': tegs,
    };
  }
}
