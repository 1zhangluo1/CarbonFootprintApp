class Item {
  final String name;
  final String imagePath;
  final String type;
  double calculateMethod(double number) {
    return 1.5 * number;
  }

  const Item(
    this.name,
    this.imagePath,
    this.type,
  );

}
