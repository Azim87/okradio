import 'package:flutter/material.dart';

import '../../util/colors.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    Key? key,
    this.hintText,
    required this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  final String? hintText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.disabledColor),
        ),
        child: TextFormField(
          autofocus: false,
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.disabledColor),
          ),
        ),
      );
}
