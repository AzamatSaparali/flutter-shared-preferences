class ListInfo {
  String name;
  DateTime lastUpdate;
  int count;

  ListInfo({
    required this.name,
    required this.lastUpdate,
    required this.count,
  });

  ListInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lastUpdate = DateTime.parse(json['lastUpdate']),
        count = json['count'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastUpdate': lastUpdate.toIso8601String(),
        'count': count,
      };
}
