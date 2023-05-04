import 'package:nerdy_calculator/data/prefs_saver.dart';

abstract class HistorySaver {
  factory HistorySaver() => PrefsSaver();

  Future<bool> addToHistory(String operation);
  Future<List<String>> getHistory();
  Future<bool> removeFromHistory(int index);
}
