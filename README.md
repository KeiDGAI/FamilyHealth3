# 家族健康アプリ

## プロジェクト概要
家族全体で健康データを共有し、サポートし合うためのアプリです。

- Firebase Authentication（メール/パスワード、Googleログイン）
- Firestore（家族・健康データ保存）
- Fitbit/Huawei Health Kit連携
- Flutter（Web/Android対応）

## Firebaseプロジェクト情報
- プロジェクトID: familyhealth3
- プロジェクト番号: 120244845106

## セットアップ手順

### 1. Flutter環境を用意

### 2. Firebase CLI, FlutterFire CLIをインストール
```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```

### 3. Firebase連携設定
```bash
# Firebaseにログイン
firebase login

# FlutterFire設定（firebase_options.dartを生成）
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure --project=familyhealth3
```

### 4. 環境変数設定
`.env`ファイルを作成し、以下の内容を記載：
```
FITBIT_CLIENT_ID=your_fitbit_client_id
FITBIT_CLIENT_SECRET=your_fitbit_client_secret
HUAWEI_APP_ID=your_huawei_app_id
HUAWEI_APP_SECRET=your_huawei_app_secret
```

### 5. 依存解決
```bash
flutter pub get
```

### 6. ビルド・実行
```bash
# Web
flutter run -d chrome
flutter build web

# Android
flutter run -d android
flutter build apk
```

## Firestoreデータ設計
- /users/{userId}
- /familyGroups/{groupId}
- /healthData/{userId}/{date}

## Firestoreルール
- 家族グループごとのデータ分離
- 本人のみ書き込み可能

## セキュリティ注意事項
⚠️ **重要**: APIキーやシークレット情報は絶対にGitにコミットしないでください
- `firebase_options.dart`は自動生成されるため、手動編集は不要
- `.env`ファイルはGit管理対象外
- 機密情報は環境変数で管理

## トラブルシューティング
- Firebase APIキーが公開された場合: Firebaseコンソールで再生成
- ビルドエラー: `flutter clean && flutter pub get`
- 認証エラー: FirebaseコンソールでAuthentication設定を確認
