class NetworkConfig {
  static final NetworkConfig _instance = NetworkConfig._();
  String _baseUrl = 'https://api.hack2hire.onemount.dev/booking/';

  static NetworkConfig get instance => _instance;

  NetworkConfig._();

  factory NetworkConfig() {
    return _instance;
  }

  String get baseURL => _instance._baseUrl;

  set baseUrl(String value) {
    _baseUrl = value;
  }
}