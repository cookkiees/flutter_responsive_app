class CoffeeItem {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;

  int quantity;

  CoffeeItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      this.quantity = 1});
}
