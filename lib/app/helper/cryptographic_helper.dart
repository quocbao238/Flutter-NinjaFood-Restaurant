import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptographicHelper {
  static String createSHA256Hash(String text) {
    final bytes = utf8.encode(text);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // /// Generates a cryptographically secure random nonce, to be included in a
  // credential request.
  static String generateNonce([int length = 32]) {
    final charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (i) => charset[random.nextInt(charset.length)]).join();
  }

}
