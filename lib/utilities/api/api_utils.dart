class ApiUtils {
  static const String _baseURL = 'http://192.168.0.121:8001/api/';
  static String languageList = "${_baseURL}language-list ";
  static String categoriesList = "${_baseURL}categories-list";
  static String postList = "${_baseURL}post-list";
  //detail
  static String foodList = "${_baseURL}food-list";
  static String sportList = "${_baseURL}sport-list";
  static String historyList = "${_baseURL}history-list";
  static String mathsList = "${_baseURL}maths-list";
  static String medicineList = "${_baseURL}medicine-list";
  static String businessList = "${_baseURL}business-list";
  static String politicsList = "${_baseURL}sport-list";
  static String animalsList = "${_baseURL}animals-list";
  static String cinemaList = "${_baseURL}cinema-list";

  //settings
  static String notification = "${_baseURL}notification-list";

  //login
  static String googleLogin = "${_baseURL}google-login";
}
