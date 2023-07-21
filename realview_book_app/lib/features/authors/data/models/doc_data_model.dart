import 'dart:convert';

class Doc {
  final String key;
  final String type;
  final String name;
  final List<String>? alternateNames;
  final String? birthDate;
  final String? topWork;
  final int workCount;
  final List<String>? topSubjects;
  final double version;

  Doc({
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

  factory Doc.fromRawJson(String str) => Doc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        key: json["key"],
        type: json["type"],
        name: json["name"],
        alternateNames: json["alternate_names"] == null
            ? []
            : List<String>.from(json["alternate_names"]!.map((x) => x)),
        birthDate: json["birth_date"],
        topWork: json["top_work"],
        workCount: json["work_count"],
        topSubjects: json["top_subjects"] == null
            ? []
            : List<String>.from(json["top_subjects"]!.map((x) => x)),
        version: json["_version_"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
        "name": name,
        "alternate_names": alternateNames == null
            ? []
            : List<dynamic>.from(alternateNames!.map((x) => x)),
        "birth_date": birthDate,
        "top_work": topWork,
        "work_count": workCount,
        "top_subjects": topSubjects == null
            ? []
            : List<dynamic>.from(topSubjects!.map((x) => x)),
        "_version_": version,
      };
}
