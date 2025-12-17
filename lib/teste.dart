import 'package:flutter/material.dart';
import 'package:flutter_booklist/api_service.dart';
import 'package:flutter_booklist/book.dart';

class TesteTela extends StatefulWidget {
  const TesteTela({super.key});

  @override
  State<TesteTela> createState() => _TesteTelaState();
}

class _TesteTelaState extends State<TesteTela> {
  List<String> itens = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de Teste')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0, left: 0, right: 0, bottom: 0),
          child: FutureBuilder(
            future: ApiService().fetchBooksHome(1, 'relevance'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nenhum dado encontrado'));
              }
              final books = snapshot.data!;
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final Book book = books[index];
                  return ListTile(
                    leading: Image.network(book.capa),
                    title: Text(book.title),
                    subtitle: Text(book.autor),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
