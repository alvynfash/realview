import 'package:realview_book_app/features/authors/data/models/doc_data_model.dart';

/// The Author class represents an author in a book.
class Author {
  final String key;
  final String type;
  final String name;
  final List<String>? alternateNames;
  final String? birthDate;
  final String? topWork;
  final int workCount;
  final List<String>? topSubjects;
  final double version;

  Author({
    required this.key,
    required this.type,
    required this.name,
    this.alternateNames,
    this.birthDate,
    this.topWork,
    required this.workCount,
    this.topSubjects,
    required this.version,
  });

  static Author fromDataModel(Doc doc) {
    return Author(
      key: doc.key,
      type: doc.type,
      name: doc.name,
      alternateNames: doc.alternateNames,
      birthDate: doc.birthDate,
      topWork: doc.topWork,
      workCount: doc.workCount,
      topSubjects: doc.topSubjects,
      version: doc.version,
    );
  }
}
