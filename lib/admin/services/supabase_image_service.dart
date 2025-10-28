import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

 class SupabaseImageService {
  final SupabaseClient _client = Supabase.instance.client;

   Future<String?> uploadImage(File imageFile, String folderName) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '$folderName/$fileName';

      final response = await _client.storage.from('images').upload(filePath, imageFile);
      // if (response.error != null) {
      //   throw Exception('Upload failed: ${response.error!.message}');
      // }

      final imageUrl = _client.storage.from('images').getPublicUrl(filePath);
      return imageUrl ;

    } catch (e) {
      log('Upload failed: $e');
      throw Exception('Image upload failed: $e');
    }
  }

  Future<String?> uploadProfileImage(File profileImage, {required String userId, required String folderName}) async {
    try {
      final fileName = '${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '$folderName/$fileName';

      final response = await _client.storage.from('images').upload(filePath, profileImage);
      // if (response.error != null) {
      //   throw Exception('Upload failed: ${response.error!.message}');
      // }

      final imageUrll = _client.storage.from('images').getPublicUrl(filePath);
      return imageUrll;

    } catch (e) {
      log('Upload failed: $e');
      throw Exception('Image upload failed: $e');
    }
  }
}