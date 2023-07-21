import 'package:flutter/material.dart';
import 'package:realview_book_app/features/authors/presentation/screens/author_search_screen.dart';

void main() {
  runApp(const RealViewBookApp());
}

class RealViewBookApp extends StatelessWidget {
  const RealViewBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthorSearchScreen(),
    );
  }
}
