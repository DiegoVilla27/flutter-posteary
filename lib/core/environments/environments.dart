import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class that provides access to environment variables.
///
/// This class retrieves the resources from the environment
/// variables using the `flutter_dotenv` package. These variables are
/// used for configuring network requests within the application.
class Environments {
  static String apiUrlUsers = dotenv.env['API_URL_USERS']!;
  static String apiUrlImages = dotenv.env['API_URL_IMAGES']!;
}