class Shoe {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // Constructor mặc định
  Shoe.defaultConstructor()
      : id = '',
        name = '',
        price = 0,
        imageUrl = '',
        description = '';

  // Convert sang JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
      };

  // Tạo từ JSON
  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        imageUrl: json['imageUrl'],
        description: json['description'],
      );
}

class ShoeInCart extends Shoe {
  int quantity;
  bool isSelected; // Cho chọn nhiều item

  ShoeInCart({
    this.quantity = 1,
    this.isSelected = false,
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.description,
  });

  // Constructor mặc định
  ShoeInCart.defaultConstructor()
      : quantity = 1,
        isSelected = false,
        super(id: '', name: '', price: 0, imageUrl: '', description: '');

  // Convert sang JSON
  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'quantity': quantity,
        'isSelected': isSelected,
      };

  // Tạo từ JSON
  factory ShoeInCart.fromJson(Map<String, dynamic> json) => ShoeInCart(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        imageUrl: json['imageUrl'],
        description: json['description'],
        quantity: json['quantity'],
        isSelected: json['isSelected'] ?? false,
      );

  // So sánh 2 sản phẩm dựa vào id
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeInCart && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
