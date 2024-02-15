class SD_CLIENT {
  static final String DOMAIN_APP_API = "http://192.168.1.14:9999";

  //test
  static final Uri apiAllUserUri = Uri.parse('$DOMAIN_APP_API/api/users/all');

  // Login register
  static final Uri apiLoginUri = Uri.parse('$DOMAIN_APP_API/api/users/login');
  static final Uri apiRegisterUri = Uri.parse('$DOMAIN_APP_API/api/users/register');
}
