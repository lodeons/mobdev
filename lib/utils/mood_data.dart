import 'package:flutter/material.dart';

class MoodInfo {
  final String emoji;
  final String label;
  final Color color;
  const MoodInfo(this.emoji, this.label, this.color);
}

const moods = <int, MoodInfo>{
  1: MoodInfo('😭', 'Sangat buruk', Color(0xFFE57373)),
  2: MoodInfo('😕', 'Buruk', Color(0xFFFFB74D)),
  3: MoodInfo('😐', 'Biasa', Color(0xFFFFD54F)),
  4: MoodInfo('🙂', 'Baik', Color(0xFF81C784)),
  5: MoodInfo('😄', 'Sangat baik', Color(0xFF4DB6AC)),
};

const availableActivities = <String>[
  'Olahraga',
  'Tidur cukup',
  'Belajar',
  'Ibadah',
  'Bersama teman',
  'Keluarga',
  'Hobi',
  'Rebahan',
];