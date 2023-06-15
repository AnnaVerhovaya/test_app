class Categories {
  final int id;
  final String name;
  final String image_url;

  Categories({required this.id, required this.name, required this.image_url});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      image_url: json['image_url']?.toString() ?? '',
    );
  }
}
