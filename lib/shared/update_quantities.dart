import 'package:flutter/material.dart';

class UpdatequantitieProduct extends StatelessWidget {
  const UpdatequantitieProduct({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.green.withAlpha(50),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
