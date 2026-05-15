class Flashcard {
  final String id;
  String question;
  String reponse;
  int bonnesReponses;
  int totalTentatives;
  DateTime dateCreation;
  DateTime? dateDerniereRevision;

  Flashcard({
    required this.id,
    required this.question,
    required this.reponse,
    this.bonnesReponses = 0,
    this.totalTentatives = 0,
    required this.dateCreation,
    this.dateDerniereRevision,
  });

  double get tauxReussite {
    if (totalTentatives == 0) return 0.0;
    return (bonnesReponses / totalTentatives) * 100;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'reponse': reponse,
      'bonnesReponses': bonnesReponses,
      'totalTentatives': totalTentatives,
      'dateCreation': dateCreation.toIso8601String(),
      'dateDerniereRevision': dateDerniereRevision?.toIso8601String(),
    };
  }

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'],
      question: json['question'],
      reponse: json['reponse'],
      bonnesReponses: json['bonnesReponses'] ?? 0,
      totalTentatives: json['totalTentatives'] ?? 0,
      dateCreation: DateTime.parse(json['dateCreation']),
      dateDerniereRevision: json['dateDerniereRevision'] != null
          ? DateTime.parse(json['dateDerniereRevision'])
          : null,
    );
  }
}
