import 'package:e_commerce/admin/controllers/order_provider.dart';
import 'package:e_commerce/admin/models/order_model.dart';
import 'package:e_commerce/user/views/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
    final List<String> statuses = ["Pending", "Shipped", "Delivered", "Cancelled"];

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'shipped':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
   final orderProvider=Provider.of<OrderProvider>(context,listen: false);
   orderProvider.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Orderss List'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          if(orderProvider.isLoading){
          return CircularProgressIndicator();
          }
          if(orderProvider.errorMessage !=null){
          return Text(orderProvider.errorMessage!);
          } 
          return 
        ListView.separated(
          padding: EdgeInsets.all(12),
          itemCount: orderProvider.orders.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            final order = orderProvider.orders[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsScreen(order: order)));             
                 },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                                  'Order: ${order.orderId}',
              
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                               '\$${order.orderAmount.toStringAsFixed(2)}',
              
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      
                      Text(
              
                           'Customer: ${order.userName}',
              
                        
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date: ${order.orderDate}',
              
              
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                           DropdownButton<String>(
                                                      value: order.orderStatus,
              
                            dropdownColor: Colors.white,
                            style: TextStyle(
                            color: statusColor(order.orderStatus),
              
                              fontWeight: FontWeight.w600,
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.deepPurple,
                            ),
                            items: statuses.map((status) {
                              return DropdownMenuItem<String>(
                                value: status,
                                child: Text(
                                  status,
                                  style: TextStyle(color: statusColor(status)),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) async {
                if (value == null) return;
              
                final updatedOrder = OrderModel(
                  orderId: order.orderId,
                  userId: order.userId,
                  userName: order.userName,
                  orderItems: order.orderItems,
                  orderStatus: value,
                  orderAmount: order.orderAmount,
                  orderDate: order.orderDate,
                );
                
                await Provider.of<OrderProvider>(context, listen: false).updateOrder(order.orderId, updatedOrder);
                
              },
              
                       ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
  }
      ),
    );
  }
}
