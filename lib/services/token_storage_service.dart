import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Provider for Token Storage service
final tokenStorageProvider = Provider<TokenStorageService>((ref) {
  return TokenStorageService();
});

/// Service for managing Firebase tokens in secure storage
class TokenStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _tokenKey = 'firebase_token';
  static const String _refreshTokenKey = 'firebase_refresh_token';

  /// Save Firebase ID token to secure storage
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
    } catch (e) {
      throw Exception('Failed to save token: $e');
    }
  }

  /// Save Firebase refresh token to secure storage
  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } catch (e) {
      throw Exception('Failed to save refresh token: $e');
    }
  }

  /// Get Firebase ID token from secure storage
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: _tokenKey);
    } catch (e) {
      throw Exception('Failed to retrieve token: $e');
    }
  }

  /// Get Firebase refresh token from secure storage
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      throw Exception('Failed to retrieve refresh token: $e');
    }
  }

  /// Remove all tokens from secure storage
  Future<void> clearTokens() async {
    try {
      await _storage.delete(key: _tokenKey);
      await _storage.delete(key: _refreshTokenKey);
    } catch (e) {
      throw Exception('Failed to clear tokens: $e');
    }
  }

  /// Check if tokens exist in secure storage
  Future<bool> hasTokens() async {
    try {
      final token = await _storage.read(key: _tokenKey);
      return token != null;
    } catch (e) {
      return false;
    }
  }

  /// Clear all secure storage
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception('Failed to clear all secure storage: $e');
    }
  }
}
