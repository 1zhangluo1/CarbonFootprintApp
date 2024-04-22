class Item {
  final String name;
  final String imagePath;
  final String type;
  Function(double) calculate;
  late double result;
  late double tree;
  late double num;

  Item(
    this.name,
    this.imagePath,
    this.type,
    this.calculate,
  ) {
    result = 0;
    tree = 0;
  }
  void calculateResult(double parameter) {
    result = calculate(parameter)[1];
    tree = calculate(parameter)[2];
  }
}
