class GlobalVar {
  factory GlobalVar() {
    return _singleton;
  }
  static final GlobalVar _singleton = GlobalVar._internal();

  String _jwt;

  String get jwt => _jwt;

  set jwt(String value) => _jwt = value;

  GlobalVar._internal();
}
