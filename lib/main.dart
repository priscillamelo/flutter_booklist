import 'package:flutter/material.dart';
import 'package:flutter_booklist/teste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //Routes.kHOME: (context) => BookList(),
        //Routes.kINFO_BOOK: (context) => const InfoBook(),
      },
      home: TesteTela(),
    );
  }
}

/* class BookList extends StatelessWidget {
  BookList({super.key});

  final List<Book> books = [
    Book("Dom Quixote", "Miguel de Cervantes"),
    Book("1984", "George Orwell"),
    Book("O Senhor dos Anéis", "J.R.R. Tolkien"),
    Book("Clean Code", "Robert C. Martin"),
    Book("O Pequeno Príncipe", "Antoine de Saint-Exupéry"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookList'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return _buildBookCard(context, book);
        },
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, Book book) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: const Icon(Icons.book, color: Colors.deepPurple),
          title: Text(book.title),
          subtitle: Text(book.autor),
          onTap: () {
            Navigator.pushNamed(context, Routes.kINFO_BOOK, arguments: book);
            /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfoBook()),
            ); */
            // Navigator.popAndPushNamed(context, Routes.kINFO_BOOK);
          },
        ),
      ),
    );

    /* Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        spacing: 16,
        children: [
          const Icon(Icons.book, size: 50, color: Colors.deepPurple),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              // const SizedBox(height: 4),
              Text(
                author,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    ); */
  }
} */
