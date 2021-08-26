import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SimpleModel {
  static getData() async {
    String data = await rootBundle.loadString('json_data/simple.json');
    Map<String, dynamic> parsedJson = json.decode(data);
    Book book = new Book.fromJson(parsedJson);
    print(book.title);
  }
}

class Book {
  String? title;
  String? languages;
  Book({
    @required this.title,
    @required this.languages,
  });

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    return Book(
      title: parsedJson['title'],
      languages: parsedJson['languages'],
    );
  }
}
