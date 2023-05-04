import 'package:nerdy_calculator/data/history_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsSaver implements HistorySaver {
  @override
  Future<bool> addToHistory(String operation) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await getHistory();
    history.add(operation);
    return prefs.setStringList(
        'history', history.length > 5 ? history.sublist(1) : history);
  }

  @override
  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('history') ?? [];
  }

  @override
  Future<bool> removeFromHistory(int index) async {
    final prefs = await SharedPreferences.getInstance();
    return getHistory().then((history) {
      history.removeAt(index);
      return prefs.setStringList('history', history);
    });
  }
}
