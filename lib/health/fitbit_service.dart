import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../utils/constants.dart';

class FitbitService {
  final String clientId = dotenv.env['FITBIT_CLIENT_ID'] ?? '';
  final String clientSecret = dotenv.env['FITBIT_CLIENT_SECRET'] ?? '';
  final String redirectUri = '${AppConstants.appUrl}/fitbit/callback';

  // OAuth2認証開始URL生成などのメソッドを後で追加
  // データ取得用メソッドも後で追加
}
