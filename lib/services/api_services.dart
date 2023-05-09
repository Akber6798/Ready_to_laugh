import 'package:ready_to_laugh/models/joke_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String url = "https://official-joke-api.appspot.com/random_joke";

  Future<JokeModel> getJokes() async {
    var data;
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        data = jokeModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return data;
  }
}
