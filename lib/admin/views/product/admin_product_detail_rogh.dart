import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/views/product/admin_edit_product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:provider/provider.dart';

class AdminProductDetailScreen extends StatefulWidget {
  final String productId;
  const AdminProductDetailScreen({super.key,required this.productId});

  @override
  State<AdminProductDetailScreen> createState() => _AdminProductDetailScreenState();
}

class _AdminProductDetailScreenState extends State<AdminProductDetailScreen> {
  
  Product?product;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final fetched = await provider.getProductById(widget.productId);
    setState(() {
      product = fetched;
      isLoading = false;
    });
  }
   Future<void>showDeleteDialoguee(BuildContext context)async{
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Delete product"),
        content: Text("Are you sure want to delete product"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Delete"))
        ],
      ));
   }
  // @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class AdminProductDetailScreen extends StatelessWidget {
  
  
  // final Product product=Product( 
    // id: "id", name: "kvnasd;kfnas;df", description: "descript S;CN jkh ljn kjjjkjn  SNCKSDNLnbjlbljkb;kjn;kn  FKJVNASDb KJFN descript dmnfv S;CN SNCKSD NLnbj lbljkb;kjn;kn descript dmnfv S;CN SNCKSDNLnbjlbljkb;kjn;kn  feion", price: 255, category: 's,mfn asdf dfs asd ', stock: 9, brand: 'br asjhbash fbasjhfbshbojhg',size: 9);
  // final VoidCallback? onEdit;
  // final VoidCallback? onDelete;

  // const 
  // AdminProductDetailScreen({ 
    // super.key,
    // required this.product,
    // this.onEdit,
    // this.onDelete,
  // });

  @override
  Widget build(BuildContext context) {
  if(isLoading==true){
    return Scaffold(
      appBar: AppBar(title: Text("Product details"),),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
  if(product==null){
    return Scaffold(
      appBar: AppBar(title: Text("Product Not found"),),
    );
  }


    
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminEditProduct()));
            },
            tooltip: "Edit Product",
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: (){
              showDeleteDialoguee(context);
            },
            tooltip: "Delete Product",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          elevation: 6,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: 
                    // product.imageUrl != null && product.imageUrl.isNotEmpty
                    //     ? Image.network(
                    //         // product.imageUrl,
                    //         height: 120,
                    //         width: 120,
                    //         fit: BoxFit.cover,
                    //       )
                    // :
                         Container(
                            height: 120,
                            width: 120,
                            color: Colors.grey[300],
                            child: Icon(Icons.image, size: 60, color: Colors.white54),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                // Name and Category
                Text(
                  product!.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Text("id :${product!.id}",
                  
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 7),
                Divider(),
                // Short Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // _InfoChip(
                    //   icon: Icons.monetization_on,
                    //   label: 'Price',
                    //   value: '\$${product.price.toStringAsFixed(2)}',
                    // ),
                    _InfoChip(
                      icon: Icons.inventory_2,
                      label: 'Stock',
                      value: '${product!.stock}',
                    ),
                    _InfoChip(
                      icon: Icons.money ,
                      label: 'PRICE',
                      value: '255',
                      // value: product.isActive ? 'Yes' : 'No',
                      valueColor:
                      //  product.isActive ? 
                      Colors.green 
                      // : Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Description
                Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                // _buildTextField("description", onSaved: (value)=>value,maxLines: 4),

                Text(
                  product!.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                // Product details table
                // ProductDetailsTable(product),
                detail_row(product: product),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.edit,color: Colors.white,),
                        Text("Edit",style: TextStyle(color: Colors.white),)
                      ],
                    )),
                    SizedBox(width: 10),
                     ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.delete,color: Colors.white,),
                        Text("Delete",style: TextStyle(color: Colors.white),)
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class detail_row extends StatelessWidget {
Product? product;  
   detail_row({
    super.key,
    required this
    .product
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
           Row(
            children: [
              Text("brand :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(width: 10,),
              Expanded(child: Text("${product!.brand}",))
            ],
           ),
           SizedBox(height: 10,),
            Row(
            children: [
              Text("size :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(width: 20,),
              Text(product!.size.toString())
            ],
           ),
           SizedBox(height: 10),
            Row(
            children: [
              Text("colors :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(width: 20,),
              Text(product!.color.toString())
            ],
           )
        ],
    );
  }
}

// Widget _buildTextField(String label,
//       {int maxLines = 1,
//       required FormFieldSetter<String> onSaved,
//       String? Function(String?)? validator,
//       TextInputType keyboardType = TextInputType.text}) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//       maxLines: maxLines,
//       onSaved: onSaved,
//       validator: validator,
//       keyboardType: keyboardType,
//     );
//   }

// Info chip helper
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.grey[100],
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 18),
          SizedBox(width: 6),
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Details table helper
// Widget ProductDetailsTable(Product product) {
//   return Table(
//     columnWidths: {0: IntrinsicColumnWidth()},
//     children: [
//       _buildTableRow('Brand :', product.brand),
//       _buildTableRow('Size :', product.size?.toString() ?? 'N/A'),
//       _buildTableRow('Color :', product.color != null ? product.color.toString() : 'N/A'),
//       _buildTableRow('Product ID :', product.id),
      
//     ],
//   );
// }

// TableRow _buildTableRow(String label, String value) {
//   return TableRow(
//     // decoration: ,
//     children: [
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: Text(
//         label,
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: Text(value, style: TextStyle(fontSize: 15)),
//     ),
//   ]);
// }
