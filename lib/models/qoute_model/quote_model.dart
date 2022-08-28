class Quote{
  late String text;
  late String author;

  Quote.fromJson(Map<String , dynamic> json){
    text = json['text'];
    author = json['author'] ?? 'Unknown';
  }
}