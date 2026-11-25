import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  static const _key = 'mood_entries';
  List<MoodEntry> _entries = [];

  List<MoodEntry> get entries => List.unmodifiable(_entries);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw != null) {
      final list = jsonDecode(raw) as List;
      _entries = list
          .map((e) => MoodEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      _sort();
    }
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode(_entries.map((e) => e.toJson()).toList()));
  }

  void _sort() => _entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));

  // CREATE
  Future<void> add(MoodEntry entry) async {
    _entries.add(entry);
    _sort();
    notifyListeners();
    await _save();
  }

  // UPDATE
  Future<void> update(MoodEntry entry) async {
    final i = _entries.indexWhere((e) => e.id == entry.id);
    if (i == -1) return;
    _entries[i] = entry;
    notifyListeners();
    await _save();
  }

  // DELETE
  Future<void> delete(String id) async {
    _entries.removeWhere((e) => e.id == id);
    notifyListeners();
    await _save();
  }
}