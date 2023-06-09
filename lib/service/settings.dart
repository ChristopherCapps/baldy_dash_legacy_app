import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Settings {
  static const _uuid = 'uuid';

  final SharedPreferences _prefs;

  Settings._(this._prefs) {
    if (!_prefs.containsKey(_uuid)) {
      _prefs.setString(_uuid, const Uuid().v1());
    }
  }

  String get uuid =>
      'e13cf330-d710-11ed-af74-e321e05f36ef'; //prefs.getString(_uuid)!;

  static Future<Settings> create() async {
    final settings = await SharedPreferences.getInstance()
        .then((prefs) => Settings._(prefs));

    return settings;
  }
}
