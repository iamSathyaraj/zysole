import 'dart:developer';
import 'dart:io';
// import 'dart:math';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:e_commerce/services/supabase_image_service.dart';

class SupabaseImageProvider with ChangeNotifier {
  final SupabaseImageService _imageService = SupabaseImageService();

  bool isLoading = false;
  String? errorMessage;
  String? uploadedImageUrl;

  Future<void> uploadImage(File imageFile, String folderName) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
      try{
    final url = await _imageService.uploadImage(imageFile, folderName);
    if (url != null&& url.isNotEmpty) {
      uploadedImageUrl = url;
    } else {
      errorMessage = "Failed to upload image";
      log("image url is empty");
    }
      }catch(e){
        errorMessage="failed to upload image ${e.toString()}";
        log("error uploading images$e");
      }finally{
     isLoading = false;
    notifyListeners();
      }
    
  }
}
