import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CourseRepository {
  static getAllCourseListData() async {
    String resultY = await rootBundle.loadString('json_data/complex.json');
    List<Campaign> engineerBookList = [];
    Map<String, dynamic> parsedJsonY = json.decode(resultY);
    for (var item in parsedJsonY['Engineer-books']) {
      engineerBookList.add(Campaign.fromJson(item));
    }
    print(engineerBookList[0].campaign);
    print(engineerBookList[0].books![0].title);
  }
}

class Campaign {
  String? campaign;
  List<Book>? books;

  Campaign({this.campaign, this.books});

  factory Campaign.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['books'] as List;
    List<Book> books = list.map((i) => Book.fromJson(i)).toList();
    return Campaign(campaign: parsedJson['campaign'], books: books);
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
