import 'package:e_commerce/admin/controllers/order_provider.dart';
import 'package:e_commerce/admin/models/order_model.dart';
import 'package:e_commerce/user/controller/address_provider.dart';
import 'package:e_commerce/user/controller/cart_provider.dart';
import 'package:e_commerce/user/models/address_model.dart';
import 'package:e_commerce/user/models/cart_model.dart';
import 'package:e_commerce/user/views/address_screen.dart';
import 'package:e_commerce/user/views/order_placed_congrats_screen.dart';
import 'package:e_commerce/user/views/product_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/auth/controller/auth_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  String selectedPayment = 'Credit Card';
  final paymentMethods = ['Credit Card', 'Gpay', 'Cash on Delivery'];

  final double shippingFee = 15.0;



void initState() {
  super.initState();
    final authProvider = Provider.of<AuthProviderr>(context, listen: false);
  final addressProvider = Provider.of<AddressProvider>(context, listen: false);
        String userId = authProvider.user!.id;

  addressProvider.fetchAddress(userId);
}

  

  @override
  Widget build(BuildContext context) {
      final authProvider=Provider.of<AuthProviderr>(context,listen: false);
      final addressProvider=Provider.of<AddressProvider>(context);
        String userId = authProvider.user!.id;

         addressProvider.fetchAddress(userId);
      Address address=addressProvider.address!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
          backgroundColor: const Color.fromARGB(185, 104, 58, 183),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
          ),
        ),
        body: Consumer<CartProvider>(
          builder: (context, cart, child) {
            if (cart.cartItems.isEmpty) {
              return const Center(
                child: Text('Your cart is empty'),
              );
            }
      
            double subtotal = cart.totalPrice;
            double total = subtotal + shippingFee;
      
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.cartItems.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 15),
                          itemBuilder: (context, index) {
                            CartItem item = cart.cartItems[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                ProductDetailScreen(productId: item.id)));
                              },
                              child: Container(
                              
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 6,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: item.imageUrl != null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Image.network(
                                                item.imageUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : const Icon(Icons.image, size: 50),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '\$${item.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(height: 8),
                                          Text("Qty: ${item.quantity}"),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline,
                                          color: Colors.orange),
                                      onPressed: () {
                                        cart.removeFromCart(item.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
      
                        const SizedBox(height: 24),
      
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: Offset(0, 1),
                                blurRadius: 6
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 251, 251, 249)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Shipping Address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                            //   ],
                            // ),
                                                    // ),
                                                    const SizedBox(height: 8),
                                  
                                                    Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child:  Text(
                                         address==null? "addres not found please enter your address":"${address.street}, ${address.city},${address.state},${address.country},${address.postalCode}",
                                    
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Change',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                                                    ),
                              ],
                            ),
                          ),
                        ),
      
                        const SizedBox(height: 24),
      
                   
      
                        const SizedBox(height: 24),
      
                        const Text(
                          'Payment Method',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
      
                        ...paymentMethods.map(
                          (method) => RadioListTile<String>(
                            title: Text(method),
                            value: method,
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                          ),
                        ),
      
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.05),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                _buildSummaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
                                const SizedBox(height: 8),
                                _buildSummaryRow('Shipping', '\$${shippingFee.toStringAsFixed(2)}'),
                                const Divider(height: 25),
                                _buildSummaryRow('Total', '\$${total.toStringAsFixed(2)}', isTotal: true),
                              ],
                            ),
                          ),
                     ),
      
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    
                    child: ElevatedButton(
                      
                      
onPressed: () async {
  final orderProvider = Provider.of<OrderProvider>(context, listen: false);
final authProvider = Provider.of<AuthProviderr>(context, listen: false);
final cartProvider = Provider.of<CartProvider>(context, listen: false);
  // Build orderItems from cartItems
  List<OrderItem> orderItems = cartProvider.cartItems.map((cartItem) => OrderItem(
    productId: cartItem.id,
    productName: cartItem.name,
    image: cartItem.imageUrl ?? '',
    price: cartItem.price,
    quantity: cartItem.quantity,
  )).toList();

  final order = OrderModel(
    orderId: UniqueKey().toString(), // or use UUID
    userId: authProvider.user!.id,
    userName: authProvider.user!.name ?? '',
    orderItems: orderItems,
    orderStatus: 'Pending',
    orderAmount: cartProvider.totalPrice + shippingFee,
    orderDate: DateTime.now(),
  );

  try {
    await orderProvider.addOrder(order);
    cartProvider.cartItems;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderPlacedCongratsScreen()));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed successfully!')));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to place order: $e')));
  }
},
                      // onPressed: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPlacedCongratsScreen()));
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Order placed successfully!')),
                      //   );
                      // },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        Text(value,
            style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
