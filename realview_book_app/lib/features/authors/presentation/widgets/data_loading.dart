import 'package:flutter/material.dart';

class DataLoading extends StatelessWidget {
  const DataLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
