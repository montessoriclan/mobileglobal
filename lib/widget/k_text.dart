import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final double? size;
  const KText({
    Key? key,
    required this.text,
    this.size,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight),
    );
  }
}
