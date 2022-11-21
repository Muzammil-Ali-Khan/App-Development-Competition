import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 44.0,
      color: const Color(0xff010542),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
