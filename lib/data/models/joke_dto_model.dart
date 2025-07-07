import 'package:chuck_norris_facts/domain/models/joke_model.dart';

class JokeDtoModel {
  final List<String>? categories;
  final String? iconUrl;
  final String? id;
  final String? value;

  JokeDtoModel({
    required this.categories,
    required this.iconUrl,
    required this.id,
    required this.value,
  });

  factory JokeDtoModel.fromJson(Map<String, dynamic> json) => JokeDtoModel(
    categories: json["categories"] == null
      ? null
      : List<String>.from(json["categories"].map((x) => x)),
    iconUrl: json["iconUrl"] ?? '',
    id: json["id"] ?? '',
    value: json["value"] ?? '',
  );

  JokeModel toDomain() => JokeModel(
    categories ?? [],
    iconUrl ?? '',
    id ?? '',
    value ?? '',
  );
}