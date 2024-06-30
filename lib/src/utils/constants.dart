/// Constants for the Pagando Service
class Constants {
  static const String appName = 'Pagando';
  static const String appVersion = 'v1.0.0';
  static const String appBar = 'pagando_appBar';

  static const String fontFamily = 'Lato';
  static const bool payInWevView = false;
  static const int balanceInputLen = 10;

  /// AUTH
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authLogout = '/auth/logout';
  static const String verifyToken = '/auth/verify';
  static const String refreshToken = '/auth/refresh';

  /// USERS
  static const String usersMe = '/users/me';
  static const String newUser = '/users/register';
  static const String findUser = '/users';
  static const String me = '/users/me';
  static const String findBy = '/users/find-by-document';

  /// ACTIVITIES
  static const String activitiesList = '/activities/list';

  /// MOVEMENTS
  static const String movementsList = '/movements/list';

  /// PROFILES
  static const String profilesDetail = '/profiles/detail';
  static const String imageUpload = '/profiles';
  static const String sendPhoneOtp = '/profiles/send-change-phonenumber-otp';
  static const String sendEmailOtp = '/profiles/send-change-email-otp';
  static const String changePhone = '/profiles/change-phonenumber';
  static const String changeEmail = '/profiles/change-email';

  /// Security
  static const String changePassword = '/security/user-password';
  static const String questions = '/security/questions';
  static const String changeTransactionPassword = '/security/user-transaction-password';
  static const String securityImages = '/security/images';
  static const String passwordVerify = '/security/password-verify';

  /// PERSONS
  static const String persons = '/persons';
  static const String personsDniTypes = '/persons/dni-types';

  /// SPLASH
  static const String splash = '/splash';
  static const String splashToken = '/splash/token/';

  /// USER-SESSIONS
  static const String userSessions = '/user-sessions';
  static const String setBiometric = '/user-sessions/biometric';

  /// OTP
  static const String sendOtp = '/otp/send';
  static const String verifyOtp = '/otp/verify';

  /// DEPOSIT
  static const String paymentMethods = '/deposits/payment-methods';
  static const String deposit = '/deposits';
  static const String lastDeposit = '/deposits/get-last';
  static const String depositNotification = '/deposits/send-notifications';
  static const String movements = '/movements';

  /// WITHDRAWALS
  static const String wPaymentMethods = '/withdrawals/payment-methods';
  static const String withdrawals = '/withdrawals';

  /// SEND PAGANDO
  static const String sends = '/sends';
  static const String requests = '/requests';

  /// CHARGES
  static const String charges = '/charges';

  /// CASHBACKS
  static const String cashBacks = '/cashbacks';

  /// NOTIFICATIONS
  static const String notifications = '/notifications';

  /// DIRECTORIES
  static const String directories = '/directories';



  /// CHECKOUT PAGANDO ROUTES
  /// LINKS
  static const String links = '/links';

  /// PRODUCTS
  static const String products = '/products';


}
