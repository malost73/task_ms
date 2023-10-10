class Temperature {
  late double day;
  late double min;
  late double max;
  late double night;
  late double eve;
  late double morn;

  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temperature.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    min = json['min'].toDouble();
    max = json['max'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }
}
