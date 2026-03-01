class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  /// Development Base Url
  //static const String _baseURL = "http://13.232.166.226:3031";
  /// Staging Base Url
  //static const String _baseURL = "http://192.168.20.244:9090";
  /// Production Base Url
  static const String _baseURL = "https://fakestoreapi.com";

  /// Auth Endpoints
  static const String signIn = "/auth/login";

  /// Products Endpoints
  static const String products = "/products";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;

  // Pass without access token
  static List<String> basicAuthUrls = [];

}