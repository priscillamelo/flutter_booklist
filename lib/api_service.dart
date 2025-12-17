import 'dart:convert';
import 'package:flutter_booklist/book.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final url = 'https://www.googleapis.com/books/v1/volumes?q=';
  final author = 'inauthor';
  final title = 'intitle';

  Future<List<Book>> fetchBooksHome(int page, String order) async {
    final int startIndex = page == 1 ? 0 : (page - 1) * 40;
    final response = await http.get(
      Uri.parse(
        '${url}search+terms&startIndex=$startIndex&maxResults=40&orderBy=$order',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['items'];
      final List<Book> books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<dynamic> fetchBooksSearchAuthor(
    String query,
    int page,
    String order,
  ) async {
    final int startIndex = page == 1 ? 0 : (page - 1) * 40;
    final String search =
        '$url$query+$author&startIndex=$startIndex&maxResults=40&orderBy=$order';

    final response = await http.get(Uri.parse(search));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<dynamic> fetchBooksSearchAuthorFree(
    String query,
    int page,
    String order,
  ) async {
    final int startIndex = page == 1 ? 0 : (page - 1) * 40;
    final String search =
        '$url$query+$author&startIndex=$startIndex&maxResults=40&orderBy=$order&filter=free-ebooks';

    final response = await http.get(Uri.parse(search));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<dynamic> fetchBooksSearchTitle(
    String query,
    int page,
    String order,
  ) async {
    final int startIndex = page == 1 ? 0 : (page - 1) * 40;
    final String search =
        '$url$query+$title&startIndex=$startIndex&maxResults=40&orderBy=$order';
    final response = await http.get(Uri.parse(search));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<dynamic> fetchBooksSearchTitleFree(
    String query,
    int page,
    String order,
  ) async {
    final int startIndex = page == 1 ? 0 : (page - 1) * 40;
    final String search =
        '$url$query+$title&startIndex=$startIndex&maxResults=40&orderBy=$order&filter=free-ebooks';
    final response = await http.get(Uri.parse(search));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }
}
