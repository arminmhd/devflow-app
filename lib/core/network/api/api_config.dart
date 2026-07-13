class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.106.168.228:8000/api/',
  );
}
