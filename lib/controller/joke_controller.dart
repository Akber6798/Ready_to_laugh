import 'package:flutter/material.dart';
import 'package:ready_to_laugh/services/api_services.dart';

class JokeController extends ChangeNotifier {
  var _joke = ApiServices().getJokes();

  get joke => _joke;

   changeJoke(var newJoke) {
    _joke = newJoke;
    notifyListeners();
  }
}
