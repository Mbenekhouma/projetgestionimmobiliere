class PropertyModel {
  final String id;
  final String title;
  final String address;
  final double price;
  final String type;
  final int surface;
  final String? imageUrl;

  PropertyModel({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
    required this.type,
    required this.surface,
    this.imageUrl,
  });
}
