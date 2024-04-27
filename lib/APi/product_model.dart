class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String rating;
  final String stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        discountPercentage: json['discountPercentage'] as double,
        rating: json['rating'] as String,
        stock: json['stock'] as String,
        brand: json['brand'] as String,
        category: json['category'] as String,
        thumbnail: json['thumbnail'] as String,
        images:
            (json['images'] as List<dynamic>).cast<String>(), // Type casting
      );
}