import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

//KEYS
  static const String emailId = "email";
  static const String displayNameKey = "displayName";


//GETTERS
  String get email => _sharedPrefs!.getString(emailId) ?? "";
  String get displayName => _sharedPrefs!.getString(displayNameKey) ?? "";


//SETTERS
  setEmail(String email) {
    _sharedPrefs?.setString(emailId, email);
  }
  setDisplayName(String displayName) {
    _sharedPrefs?.setString(displayNameKey, displayName);
  }



// GETTERS
  String? getEmail() {
    return _sharedPrefs?.getString(emailId);
  }
  String? getDisplayName() {
    return _sharedPrefs?.getString(displayNameKey);
  }


// SETTER TO CLEAR PREFS FOR LOGOUT
  logout() {
    _sharedPrefs?.remove(emailId);
    _sharedPrefs?.remove(displayNameKey);
  }
}

final sharedPrefs = SharedPrefs();
