import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 認証状態のストリーム
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 現在のユーザー
  User? get currentUser => _auth.currentUser;

  // メール/パスワードでサインイン
  Future<AuthResult> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return AuthResult(
        user: credential.user!,
        isNewUser: false,
        emailVerified: credential.user!.emailVerified,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw AuthException('ネットワークエラーが発生しました。インターネット接続を確認してください。');
    }
  }

  // メール/パスワードで新規登録
  Future<AuthResult> registerWithEmail(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return AuthResult(
        user: credential.user!,
        isNewUser: true,
        emailVerified: credential.user!.emailVerified,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw AuthException('ネットワークエラーが発生しました。インターネット接続を確認してください。');
    }
  }

  // サインアウト
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthException('サインアウトに失敗しました。');
    }
  }

  // メール認証送信
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw AuthException('メール認証の送信に失敗しました。');
    }
  }

  // パスワードリセットメール送信
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw AuthException('パスワードリセットメールの送信に失敗しました。');
    }
  }

  // パスワード更新
  Future<void> updatePassword(String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw AuthException('パスワードの更新に失敗しました。');
    }
  }

  // Firebase認証例外の日本語化
  AuthException _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthException('このメールアドレスは登録されていません。');
      case 'wrong-password':
        return AuthException('パスワードが間違っています。');
      case 'email-already-in-use':
        return AuthException('このメールアドレスは既に使用されています。');
      case 'weak-password':
        return AuthException('パスワードが弱すぎます。6文字以上で入力してください。');
      case 'invalid-email':
        return AuthException('無効なメールアドレスです。');
      case 'user-disabled':
        return AuthException('このアカウントは無効化されています。');
      case 'too-many-requests':
        return AuthException('試行回数が多すぎます。しばらく待ってから再試行してください。');
      case 'operation-not-allowed':
        return AuthException('この操作は許可されていません。');
      case 'network-request-failed':
        return AuthException('ネットワークエラーが発生しました。インターネット接続を確認してください。');
      default:
        return AuthException('認証エラーが発生しました: ${e.message}');
    }
  }
}

// カスタム認証例外クラス
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

// 認証結果クラス
class AuthResult {
  final User user;
  final bool isNewUser;
  final bool emailVerified;

  AuthResult({
    required this.user,
    required this.isNewUser,
    required this.emailVerified,
  });
}
