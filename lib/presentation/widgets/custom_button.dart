import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.buttonText,
    required this.onTap,
    this.color,
  }) : super(key: key);

  final String? buttonText;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            buttonText ?? '',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      );
}
