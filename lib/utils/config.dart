import 'package:flutter_dotenv/flutter_dotenv.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

final String apiBaseUrl =
    isProduction ? dotenv.env['API_PROD_URL']! : dotenv.env['API_DEV_URL']!;
