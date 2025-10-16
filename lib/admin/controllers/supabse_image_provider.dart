import 'dart:developer';
import 'dart:io';
// import 'dart:math';
// import 'dart:math';

import 'package:e_commerce/admin/services/supabase_image_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:e_commerce/services/supabase_image_service.dart';

class SupabaseImageProvider with ChangeNotifier { 
  final SupabaseImageService _imageService = SupabaseImageService();

  bool isLoading = false;
  String? errorMessage;
  String? uploadedImageUrl;
    String? uploadedProfileImage;


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

  Future<String?>uploadProfileimage(File  profileImage, String userId, String folderName)async{

  isLoading=true;
  errorMessage=null;
  notifyListeners();

  try{

 final url =await _imageService.uploadProfileImage(profileImage, userId: userId, folderName: folderName);

 if(url!=null && url.isNotEmpty ){
  uploadedImageUrl=url;

return url;
 } else{
  errorMessage="failed to upload images";
  log("image url is empty");
 } 

  }catch(e){
    errorMessage="failed to upload images ${e.toString()}";
    log("error in upload image $e");
  } finally{
    isLoading=false;
    notifyListeners(); 
     }
return null;

  }
}
