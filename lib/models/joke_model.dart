import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

class JokeModel {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  JokeModel({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
      );
}
