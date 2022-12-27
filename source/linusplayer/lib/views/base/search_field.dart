import 'package:flutter/material.dart';

import '../../constants/images.dart';

class SearcxhField extends StatefulWidget {
  final hintText;
  final onChanged;
  const SearcxhField({super.key, required this.hintText, this.onChanged});

  @override
  State<SearcxhField> createState() => _SearcxhFieldState();
}

class _SearcxhFieldState extends State<SearcxhField> {
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
            hintText: widget.hintText,
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
