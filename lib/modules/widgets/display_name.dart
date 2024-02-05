import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  final String? firstName;
  final String? secondName;
  final String? prefix;
  final String? suffix;

  const DisplayName({
    super.key,
    this.firstName,
    this.secondName,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$prefix$firstName $secondName$suffix',
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlueAccent),
    );
  }
}
