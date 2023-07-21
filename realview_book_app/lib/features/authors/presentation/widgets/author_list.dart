import 'package:flutter/material.dart';
import 'package:realview_book_app/features/authors/domain/author_model.dart';
import 'package:realview_book_app/features/authors/presentation/screens/author_details_screen.dart';

class AuthorList extends StatelessWidget {
  const AuthorList({
    required this.authors,
    super.key,
  });

  final List<Author> authors;

  @override
  Widget build(BuildContext context) {
    return authors.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: const Text(
              'Hmm.. We could not find any authors. \nTry a different name',
              textAlign: TextAlign.center,
            ),
          )
        : ListView.separated(
            itemCount: authors.length,
            itemBuilder: (context, index) {
              final author = authors[index];
              return ListTile(
                title: Text(author.name),
                //  Todo(A): add chips for genre
                // subtitle: Text(author.birthDate!),
                onTap: () {
                  //Should use named routes instead of old RoutApi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthorDetailsScreen(author: author),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
  }
}
