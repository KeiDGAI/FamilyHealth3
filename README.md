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
1. Flutter環境を用意
2. Firebase CLI, FlutterFire CLIをインストール
3. `flutterfire configure` でFirebase連携
4. `.env`ファイルにFitbit/HuaweiのAPIキーを記載
5. `flutter pub get` で依存解決
6. `flutter run` または `flutter build web` でビルド

## Firestoreデータ設計
- /users/{userId}
- /familyGroups/{groupId}
- /healthData/{userId}/{date}

## Firestoreルール
- 家族グループごとのデータ分離
- 本人のみ書き込み可能
