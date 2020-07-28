class Category {
  final int id;

  final String name, description;

  const Category(this.id, this.name, this.description);

  Category.fromJson(Map<dynamic, dynamic> json)
      : this(json["id"], json["name"], json["description"]);
}
