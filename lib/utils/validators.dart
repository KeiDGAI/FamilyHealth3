class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'メールアドレスを入力してください';
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+');
    if (!emailRegex.hasMatch(value)) return '正しいメールアドレスを入力してください';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'パスワードを入力してください';
    if (value.length < 6) return '6文字以上で入力してください';
    return null;
  }
}
