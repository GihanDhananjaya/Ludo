import 'package:flutter/material.dart';

class CustomStepWidget extends StatelessWidget {
  final String imagePath;
  final bool isActive;

  const CustomStepWidget({
    Key? key,
    required this.imagePath,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Opacity(
          opacity: isActive ? 1 : 0.3,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset(
              imagePath,
              height: 15,
              width: 15,
            ),
          ),
        ),
      );
  }
}
