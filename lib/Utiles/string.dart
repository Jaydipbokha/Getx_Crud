class AppString {

  static final AppString _instance = AppString._internal();

  AppString._internal();

  factory AppString() {
    return _instance;
  }

  /// Dashboard
 static String dashBoard = 'DashBoard';

}

