class Units {
  final String title;
  final String subtitle;

  Units({required this.title, required this.subtitle});

  Map<String, Object?> convertToJson() => {
        'title': title,
        'subtitle': subtitle,
      };

  static Units convertFromJson(Map<dynamic, dynamic>? json) => Units(
      title: json!['title'] as String, subtitle: json['subtitle'] as String);
}

List<Units> toList(Map<dynamic, dynamic> map) {
  List<Units> units = [];

  for (var i = 0; i < map.length; i++) {
    units.add(Units.convertFromJson(map['$i']));
  }
  return units;
}

Map<dynamic, dynamic> toMap(List<Units> units) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < units.length; i++) {
    map.addAll({'$i': units[i].convertToJson()});
  }
  return map;
}
