import 'package:flutter/material.dart';
import 'package:flutter_booklist/book.dart';

class InfoBook extends StatefulWidget {
  const InfoBook({super.key});

  @override
  State<InfoBook> createState() => _InfoBookState();
}

class _InfoBookState extends State<InfoBook> {
  late final Book book;
  @override
  Widget build(BuildContext context) {
    book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(book.autor, style: TextStyle(fontSize: 24))),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('voltar'),
          ),
        ],
      ),
    );
  }
}
