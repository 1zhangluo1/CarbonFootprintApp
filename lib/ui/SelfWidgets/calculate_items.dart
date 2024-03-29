import 'package:flutter/cupertino.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.imagePath,
    required this.itemName,
  });

  final String? imagePath;
  final String? itemName;

  @override
  Widget build(BuildContext context) {
    Widget image = Image(
      image: AssetImage(imagePath!),
      width: 50,
      fit: BoxFit.contain,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: image,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(itemName!),
        ),
      ],
    );
  }
}
