import 'package:http/http.dart' as http;
import 'package:realview_book_app/features/authors/data/data_sources/doc_response_model.dart';
import 'dart:convert';
import 'package:realview_book_app/features/authors/data/models/doc_data_model.dart';

class RemoteDataSource {
  final String baseUrl = 'https://openlibrary.org';

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
