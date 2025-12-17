/* class Book {
  String _title;
  String _autor;

  Book(this._title, this._autor);

  String get title => _title;
  String get autor => _autor;

  set title(String title) {
    _title = title;
  }

  set autor(String autor) {
    _autor = autor;
  }
} */

class Book {
  String id;
  String title;
  String autor;
  String capa;
  String dataPublicacao;
  String resumo;
  int numberPages;
  bool favorito = false;

  Book({
    required this.id,
    required this.title,
    required this.autor,
    required this.capa,
    required this.dataPublicacao,
    required this.resumo,
    required this.numberPages,
  });

  // Converte JSON da API do Google para o Objeto Book
  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    return Book(
      id: json['id'],
      title: volumeInfo['title'] ?? 'Sem título',
      autor:
          (volumeInfo['authors'] as List<dynamic>?)?.join(', ') ??
          'Autor desconhecido',
      resumo: volumeInfo['description'] ?? 'Sem descrição disponível.',
      capa: volumeInfo['imageLinks']?['thumbnail'] ?? '',
      dataPublicacao: volumeInfo['publishedDate'],
      numberPages: volumeInfo['pageCount'] ?? 0,
    );
  }
}
