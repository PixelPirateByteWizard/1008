import 'dart:convert';
import 'dart:typed_data';

class EncryptionService {
  String encrypt(String input, String key) {
    return _xorCipher(input, key);
  }

  String decrypt(String input, String key) {
    return _xorCipher(input, key);
  }

  String _xorCipher(String input, String key) {
    Uint8List inputBytes = Uint8List.fromList(utf8.encode(input));
    Uint8List keyBytes = Uint8List.fromList(utf8.encode(key));
    Uint8List result = Uint8List(inputBytes.length);

    for (int i = 0; i < inputBytes.length; i++) {
      result[i] = inputBytes[i] ^ keyBytes[i % keyBytes.length];
    }

    return base64Encode(result);
  }
}