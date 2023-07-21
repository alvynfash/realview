import 'package:flutter/material.dart';
import 'package:realview_book_app/features/authors/domain/author_model.dart';

class AuthorDetailsScreen extends StatelessWidget {
  final Author author;

  const AuthorDetailsScreen({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          author.name,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type: ${author.type}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Birth Date: ${author.birthDate ?? "N/A"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Work Count: ${author.workCount}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Top Work: ${author.topWork ?? "N/A"}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            AlternateNames(author: author),
            const SizedBox(height: 16.0),
            Genres(author: author)
          ],
        ),
      ),
    );
  }
}

class Genres extends StatelessWidget {
  const Genres({
    required this.author,
    super.key,
  });

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Subjects:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        author.topSubjects == null || author.topSubjects!.isEmpty
            ? const NotAvailable()
            : Wrap(
                spacing: 8,
                children: author.topSubjects!
                    .map(
                      (e) => Chip(
                        label: Text(e),
                        // backgroundColor: Colors.greenAccent,
                        // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class AlternateNames extends StatelessWidget {
  const AlternateNames({
    super.key,
    required this.author,
  });

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alternate Names:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        author.alternateNames == null || author.alternateNames!.isEmpty
            ? const NotAvailable()
            : Wrap(
                spacing: 8,
                children: author.alternateNames!
                    .map(
                      (e) => Chip(
                        label: Text(e),
                        // backgroundColor: Colors.greenAccent,
                        // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}

class NotAvailable extends StatelessWidget {
  const NotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'N/A',
      style: TextStyle(fontSize: 16),
    );
  }
}
