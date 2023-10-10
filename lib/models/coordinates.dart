class Coordinates {
  double? lon;
  double? lat;

  Coordinates({this.lon, this.lat});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lon = json['lon'].toDouble();
    lat = json['lat'].toDouble();
  }
}
