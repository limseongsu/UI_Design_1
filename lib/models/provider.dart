import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_design/models/fake_data.dart';

class ThisProvider extends ChangeNotifier {

  List<Result> _jetNews = [];

  List<String> _peoples = [];

  List<String> _publications = [];

  bool _isTab = true;

  bool _isLoading = true;

  bool _isPressed = true;

  final Set<int> checked = {};

  final Set<String> bookMark = {};

  final Set<String> like = {};

  List<String> android = [
    'Jetpack Compose',
    'Kotlin',
    'Jetpack'
  ];

  List<String> programming = [
    'Kotlin',
    'Declarative UIs',
    'Java'
  ];

  List<String> tecgnology = [
    'Pixel',
    'Table',
    'Provider'
  ];


  List<Result> get jetNews => _jetNews;

  List<String> get peoples => _peoples;

  List<String> get publications => _publications;

  bool get isTab => _isTab;

  bool get isLoading => _isLoading;

  bool get isPressed => _isPressed;

  void tabbed() {
    _isTab = !_isTab;
    notifyListeners();
  }

  void loading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void pressed() {
    _isPressed = !_isPressed;
    notifyListeners();
  }

  List<String> people() {
    for(int i = 0; i < _jetNews.length; i++) {
      _peoples.add(_jetNews[i].metadata.author.name);
    }
    return _peoples;
  }
  List<String> publication() {
    for(int i = 0; i < _jetNews.length; i++) {
      _publications.add(_jetNews[i].publication.name);
    }
    return _publications;
  }

  Future<FakeData> fetchData() async {
    var uri = Uri.parse(
        'https://junho1124.github.io/web_test/posts.json');
    var response = await http.get(uri);
    FakeData result = FakeData.fromJson(json.decode(response.body));
    for (int i = 0; i < result.result.length; i++) {
      _jetNews.add(result.result[i]);
    }
    notifyListeners();
    return result;
  }


}