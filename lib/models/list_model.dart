import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ListModel {
  static getData() async {
    String data = await rootBundle.loadString('json_data/list.json');
    List<dynamic> parsedJson = json.decode(data);
    BookList bookList = new BookList.fromJson(parsedJson);
    print(bookList.books![0].title);
  }
}

class BookList {
  List<Book>? books;

  BookList({this.books});
  factory BookList.fromJson(List parsedJson) {
    List<Book> books = parsedJson.map((i) => Book.fromJson(i)).toList();
    return BookList(books: books);
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
