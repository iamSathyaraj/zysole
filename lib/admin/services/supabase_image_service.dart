// import 'dart:developer';
// import 'dart:io';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseImageService {
//   final SupabaseClient _client = Supabase.instance.client;

//   Future<String?> uploadImage(File imageFile, String folderName) async {
//     try {
//       final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
//       final filePath = '$folderName/$fileName';

//       await _client.storage
//           .from('images')
//           .upload(filePath, imageFile);

//       final imageUrl =
//           _client.storage.from('images').getPublicUrl(filePath);
//           // final imageUrl=imageUrlob.public

//       return imageUrl;
// //       final imageUrlObj = _client.storage.from('images').getPublicUrl(filePath);
// // final imageUrl = imageUrlObj.publicUrl;
// // return imageUrl;

//     } catch (e) {
//       log(' Upload failed: $e');

//       throw Exception('image uplaoad failed$e');
//     }
//   }

// Future<String?> uploadProfileImage(File profileImage, {required String userId, required String folderName})async{

//   try{
//     final fileNamee= '${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
//     final filePathh = '$folderName/$fileNamee';

//    await _client.storage.from('images').upload(filePathh, profileImage);

//    final imageUrll=_client.storage.from('images').getPublicUrl(filePathh);

//    return imageUrll;

//   } catch (e){
//     log("upload failed $e");
//     throw Exception("upload failed $e");
//   }
// }

//   }
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
// import 'dart:developer';
// import 'dart:io';
// // import 'dart:math';
// // import 'dart:math';

// import 'package:e_commerce/admin/services/supabase_image_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:e_commerce/services/supabase_image_service.dart';

// class SupabaseImageProvider with ChangeNotifier { 
//   final SupabaseImageService _imageService = SupabaseImageService();

//   bool isLoading = false;
//   String? errorMessage;
//   String? uploadedImageUrl;
//     String? uploadedProfileImage;


//   Future<void> uploadImage(File imageFile, String folderName) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();
//       try{
//     final url = await _imageService.uploadImage(imageFile, folderName);
//     if (url != null&& url.isNotEmpty) {
//       uploadedImageUrl = url;
//     } else {
//       errorMessage = "Failed to upload image";
//       log("image url is empty");
//     }
//       }catch(e){
//         errorMessage="failed to upload image ${e.toString()}";
//         log("error uploading images$e");
//       }finally{
//      isLoading = false;
//     notifyListeners();
//       }
    
//   }

//   Future<String?>uploadProfileimage(File  profileImage, String userId, String folderName)async{

//   isLoading=true;
//   errorMessage=null;
//   notifyListeners();

//   try{

//  final url =await _imageService.uploadProfileImage(profileImage, userId: userId, folderName: folderName);

//  if(url!=null && url.isNotEmpty ){
//   uploadedImageUrl=url;

// return url;
//  } else{
//   errorMessage="failed to upload images";
//   log("image url is empty");
//  } 

//   }catch(e){
//     errorMessage="failed to upload images ${e.toString()}";
//     log("error in upload image $e");
//   } finally{
//     isLoading=false;
//     notifyListeners(); 
//      }
// return null;

//   }
// }

