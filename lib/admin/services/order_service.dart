import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/models/order_model.dart';

class OrderService {
final FirebaseFirestore _firestore =FirebaseFirestore.instance;

final CollectionReference _orderCollection =FirebaseFirestore.instance.collection('orders');

 Stream<List<OrderModel>>getOrders(){
     return _orderCollection.snapshots()
     .map((snapshot){
      return snapshot.docs.map((doc)=>OrderModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
     });


}


  Future<OrderModel?> getOrderById(String orderId) async {
    try {
      DocumentSnapshot doc = await _orderCollection.doc(orderId).get();
      if (doc.exists && doc.data() != null) {
        return OrderModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        log("Order not found: $orderId");
        return null;
      }
    } on FirebaseException catch (e) {
      log("Get order error: ${e.message}");
      throw Exception("Failed to get order: ${e.message}");
    } catch (e) {
      log("Unexpected error getting order: $e");
      throw Exception("Unexpected error retrieving order");
    }
  } 


Future<void>createOrder(OrderModel order)async{

try{
    await  _orderCollection .doc(order.orderId).set(order.toJson());
    log("Order created successfully");

}  on FirebaseException catch (e){
  log("create order error$e");
  throw Exception("create order error $e");
} catch (e){
log("failed to create order$e");
throw Exception("failed to create order$e");

}
}


  Future<void>updateOrder( String orderId,  OrderModel orderModel)async{
    
  try{ 
  _orderCollection.doc(orderId).update(orderModel.toJson());
  log("order updated succesfully");

} on FirebaseException catch(e){
  log("order update error$e");
  throw Exception("order update error$e");
} catch (e){
  log("failed to update order:$e");
  throw Exception("failed to update order:$e");
}
  }
  
Future<void>deleteOrder(String orderId)async{

try{
    _orderCollection.doc(orderId).delete();
   log("order deleted succesfully");
} on FirebaseException catch(e){
  log("order deleting error: $e");
  throw Exception("order deleting error: $e");
} catch (e){
  log("failed to delete order:$e");
  throw Exception("failed to delete order: $e");
}

}




// Stream<List<OrderModel>>getOrders(){
//   return _orderCollection.snapshots().map((snapshot){
//     return snapshot.docs.map((doc)=>OrderModel.fromMap(doc.data() as Map<String, dynamic>,)).toList();
//   });
// }


}