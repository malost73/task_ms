class LocalNames {
  String? ru;
  String? en;

  LocalNames({this.ru, this.en});

  LocalNames.fromJson(Map<String, dynamic> json) {
    ru = json['ru'];
    en = json['en'];
  }
}
