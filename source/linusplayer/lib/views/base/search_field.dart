import 'package:flutter/material.dart';

import '../../constants/images.dart';

class SearcxhField extends StatelessWidget {
  final hintText;
  const SearcxhField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: size.width / 1.5,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.white60,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                wordSpacing: 1),
            prefixIcon: Image.asset(
              Images.search,
              scale: 35,
            )),
      ),
    );
  }
}
