class MoodEntry {
  final String id;
  final int mood; // 1 (sangat buruk) - 5 (sangat baik)
  final String note;
  final List<String> activities;
  final DateTime createdAt;

  const MoodEntry({
    required this.id,
    required this.mood,
    this.note = '',
    this.activities = const [],
    required this.createdAt,
  });

  MoodEntry copyWith({int? mood, String? note, List<String>? activities}) {
    return MoodEntry(
      id: id,
      mood: mood ?? this.mood,
      note: note ?? this.note,
      activities: activities ?? this.activities,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'mood': mood,
        'note': note,
        'activities': activities,
        'createdAt': createdAt.toIso8601String(),
      };

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        id: json['id'] as String,
        mood: json['mood'] as int,
        note: json['note'] as String? ?? '',
        activities: List<String>.from(json['activities'] ?? []),
        createdAt: DateTime.parse(json['createdAt'] as String),
      );
}