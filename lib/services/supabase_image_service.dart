import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseImageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String?> uploadImage(File imageFile, String folderName) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '$folderName/$fileName';

      await _client.storage
          .from('project-images')
          .upload(filePath, imageFile);

      final imageUrl =
          _client.storage.from('project-images').getPublicUrl(filePath);
          // final imageUrl=imageUrlob.public

      return imageUrl;
//       final imageUrlObj = _client.storage.from('images').getPublicUrl(filePath);
// final imageUrl = imageUrlObj.publicUrl;
// return imageUrl;

    } catch (e) {
      log(' Upload failed: $e');
      
      throw Exception('image uplaoad failed$e');
    }
  }
  }
