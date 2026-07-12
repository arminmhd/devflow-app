class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.106.168.1:8000/api/',
  );
}
