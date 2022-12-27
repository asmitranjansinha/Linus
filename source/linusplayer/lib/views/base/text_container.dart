// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final textData;
  final onTap;
  const TextContainer({super.key, required this.textData, this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: size.width / 1.7,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.5),
          child: Text(
            textData,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
