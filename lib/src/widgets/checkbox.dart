import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _checked
              ? Colors.red
              : Colors.white, // Seçili değilken beyaz renk
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 24.0,
        height: 24.0,
        child: _checked
            ? const Icon(
                Icons.check,
                size: 20.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
