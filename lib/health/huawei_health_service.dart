import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:huawei_health/huawei_health.dart'; // 実装時に有効化

class HuaweiHealthService {
  final String appId = dotenv.env['HUAWEI_APP_ID'] ?? '';
  final String appSecret = dotenv.env['HUAWEI_APP_SECRET'] ?? '';

  // Health Kit連携メソッドは後で追加
}
