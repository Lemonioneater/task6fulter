class ProductItem {
  int id;
  String title;
  String description;
  int price;
  String thumbnail;
  int count ;

  ProductItem({
    required this.id,
    required this.price,
    required this.description,
    required this.title,
    required this.thumbnail,
    this.count = 0,

  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      thumbnail: json['thumbnail'],
    );
  }
}
