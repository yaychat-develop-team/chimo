/// Maps echimo auth/bind email API message keys to user-facing copy.
abstract final class EmailAuthMessages {
  static String friendly(String raw, {required String fallback}) {
    final text = raw.trim();
    if (text.isEmpty) return fallback;
    final key = text.toLowerCase();

    switch (key) {
      case 'email.already.bound':
      case 'email.already.exist':
      case 'email.exist':
      case 'email.exists':
        return 'This email is already linked to another account. '
            'Please use a different email.';
      case 'email.invalid':
      case 'invalid.email':
        return 'Please enter a valid email address.';
      case 'wrong verification code':
      case 'invalid verification code':
      case 'code.invalid':
      case 'code.expired':
      case 'verification.code.wrong':
      case 'verification.code.expired':
        return 'Wrong or expired code. Tap Resend, then enter the newest code.';
      case 'user.not.login':
        return 'Please log in again, then bind your email.';
      case 'unauthorized':
      case 'unauthorized registration':
        return 'This email cannot be used right now. Try another email.';
      default:
        break;
    }

    if (key.contains('already') && key.contains('bound')) {
      return 'This email is already linked to another account. '
          'Please use a different email.';
    }
    if (key.contains('wrong') && key.contains('code')) {
      return 'Wrong or expired code. Tap Resend, then enter the newest code.';
    }

    // Raw dotted keys (e.g. email.already.bound) are not user-friendly.
    if (RegExp(r'^[a-z0-9_.]+$').hasMatch(key) && key.contains('.')) {
      return fallback;
    }
    return text;
  }
}
