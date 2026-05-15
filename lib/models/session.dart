class Session {
  final String id;
  final DateTime date;
  final int totalCartes;
  final int bonnesReponses;
  final int mauvaiseReponses;
  final Duration duree;

  Session({
    required this.id,
    required this.date,
    required this.totalCartes,
    required this.bonnesReponses,
    required this.mauvaiseReponses,
    required this.duree,
  });

  double get tauxReussite {
    if (totalCartes == 0) return 0.0;
    return (bonnesReponses / totalCartes) * 100;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'totalCartes': totalCartes,
      'bonnesReponses': bonnesReponses,
      'mauvaiseReponses': mauvaiseReponses,
      'dureeSeconds': duree.inSeconds,
    };
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      date: DateTime.parse(json['date']),
      totalCartes: json['totalCartes'],
      bonnesReponses: json['bonnesReponses'],
      mauvaiseReponses: json['mauvaiseReponses'],
      duree: Duration(seconds: json['dureeSeconds'] ?? 0),
    );
  }
}
