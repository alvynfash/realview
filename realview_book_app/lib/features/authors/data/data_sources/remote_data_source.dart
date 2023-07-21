import 'package:http/http.dart' as http;
import 'package:realview_book_app/features/authors/data/data_sources/doc_response_model.dart';
import 'dart:convert';
import 'package:realview_book_app/features/authors/data/models/doc_data_model.dart';

/// The RemoteDataSource class is a data source for remote data retrieval.
class RemoteDataSource {
  final String baseUrl = 'https://openlibrary.org';

  /// The function searches for authors based on a given query.
  ///
  /// Args:
  ///   query (String): A string representing the search query for authors.
  Future<List<Doc>> searchAuthors(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/search/authors.json?q=$query'));

      if (response.statusCode != 200) {
        // Should throw a service exception ideally.
        throw Exception('Not 200 error');
      }

      final data = json.decode(response.body);
      final authorsResponse = DocsResponse.fromJson(data);
      return authorsResponse.docs;
    } catch (e) {
      rethrow;
    }
  }

  /// The function `getAuthorDetails` retrieves the details of an author based on their ID.
  ///
  /// Args:
  ///   authorId (String): The author's unique identifier.
  Future<Doc?> getAuthorDetails(String authorId) async {
    // final response = await http.get(Uri.parse('$baseUrl/authors/$authorId.json'));
    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   return Author(
    //     id: data['key'],
    //     name: data['name'],
    //     birthDate: data['birth_date'],
    //   );
    // } else {
    //   throw Exception('Failed to load author details');
    // }
    return null; // Return null for now
  }
}
