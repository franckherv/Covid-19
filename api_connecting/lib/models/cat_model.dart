class Cat {
  final int id;
  final String url;
  Cat({
  
    required this.id,
    required this.url,
  });

   factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      
      id: json['id'],
      url: json['url'],
    );
  }
  }