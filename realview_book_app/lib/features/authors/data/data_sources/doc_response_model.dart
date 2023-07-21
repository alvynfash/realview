import 'dart:convert';

import 'package:realview_book_app/features/authors/data/models/doc_data_model.dart';

class DocsResponse {
  final int numFound;
  final int start;
  final bool numFoundExact;
  final List<Doc> docs;

  DocsResponse({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  factory DocsResponse.fromRawJson(String str) =>
      DocsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocsResponse.fromJson(Map<String, dynamic> json) => DocsResponse(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
      };
}
