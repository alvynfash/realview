import 'package:realview_book_app/features/authors/data/data_sources/remote_data_source.dart';
import 'package:realview_book_app/features/authors/data/models/doc_data_model.dart';

class AuthorRepository {
  final RemoteDataSource remoteDataSource;

  AuthorRepository(this.remoteDataSource);

  /// The function `searchAuthors` returns a Future that resolves to a List of Doc objects based on a
  /// given query.
  ///
  /// Args:
  ///   query (String): A string representing the search query for authors.
  Future<List<Doc>> searchAuthors(String query) {
    return remoteDataSource.searchAuthors(query).catchError((error) {
      throw Exception('Failed to load authors : $error');
    });
  }

  /// The function `getAuthorDetails` retrieves the details of an author based on their ID.
  ///
  /// Args:
  ///   authorId (String): The author's unique identifier.
  Future<Doc?> getAuthorDetails(String authorId) async {
    try {
      final author = await remoteDataSource.getAuthorDetails(authorId);
      // Perform additional data processing if needed before returning
      return author;
    } catch (error) {
      throw Exception('Failed to load author details');
    }
  }
}
