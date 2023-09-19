class UnitEntry {
  Map<dynamic, dynamic> units;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  UnitEntry(
      {required this.username,
      required this.units,
      this.objectId,
      this.created,
      this.updated});

  Map<String, Object?> toJson() => {
        'username': username,
        'units': units,
        'objectId': objectId,
        'created': created,
        'updated': updated,
      };
  static UnitEntry fromJson(Map<dynamic, dynamic>? json) => UnitEntry(
        username: json!['username'] as String,
        units: json['units'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
      );
}
