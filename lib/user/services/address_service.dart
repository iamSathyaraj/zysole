
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/user/models/address_model.dart';

class AddressService {


final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  final String _collection='addresses';


Future<void>saveAddress(Address address)async{

await _firestore.collection(_collection).doc(address.id).set(address.toMap());

}

Future<void> updateAddress(Address address) async {
  await _firestore.collection(_collection).doc(address.id).update(address.toMap());
}


Future<Address?>getAddressByUserId(String userId)async{
  
final snapshot=await _firestore.collection(_collection).where('userId', isEqualTo: userId).limit(1).get();
if(snapshot.docs.isNotEmpty){
  return Address.fromMap(snapshot.docs.first.data());
}
return null;

}



}