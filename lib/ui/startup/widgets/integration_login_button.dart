import 'package:flutter/material.dart';

class IntegrationLoginButton extends StatelessWidget {
  final String imagePath;
  final Function(String x) onTap;
  final String name;

  const IntegrationLoginButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(name),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}