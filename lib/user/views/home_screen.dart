    import 'dart:ffi';

  import 'package:e_commerce/admin/models/product_model.dart';
    import 'package:e_commerce/controllers/auth_provider.dart';
    import 'package:e_commerce/controllers/cart_provider.dart';
import 'package:e_commerce/controllers/category_provider.dart';
    import 'package:e_commerce/controllers/favorite_provider.dart';
    import 'package:e_commerce/admin/controllers/product_provider.dart';
    import 'package:e_commerce/auth/login_screen.dart';
    import 'package:e_commerce/models/cart_model.dart';
    import 'package:e_commerce/user/views/cart_screen.dart';
    import 'package:e_commerce/user/views/home/widgets/custom_banner.dart';
    import 'package:e_commerce/user/views/home/widgets/custom_category.dart';
    import 'package:e_commerce/user/views/product_detail_screen.dart';
    import 'package:e_commerce/widgets/custom_search_bar.dart';
    import 'package:e_commerce/widgets/home_product_card.dart';
    import 'package:flutter/material.dart';
    import 'package:provider/provider.dart';
    import 'package:carousel_slider/carousel_slider.dart';

    class HomeScreen extends StatefulWidget {
      const HomeScreen({super.key});

      @override
      State<HomeScreen> createState() => _HomeScreenState();
    }

    class _HomeScreenState extends State<HomeScreen> {
      final List<String> categories = ['All', 'nike', 'adidas', 'puma'];


      String? selectedCategory;
      final TextEditingController _searchController = TextEditingController();
      List<Product> filteredProducts = [];
      
      @override
      void initState() {
        super.initState();
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        final favoriteProvider =
            Provider.of<FavoriteProvider>(context, listen: false);
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        productProvider.fetchProducts();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (authProvider.user != null) {
            favoriteProvider.loadFavorites();
          }
        });
        _searchController.addListener(() {
          _filterProducts(productProvider);
        });
      }
Widget buildCategoryButtons() {
  final categoryProvider = Provider.of<CategoryProvider>(context);
  final categories = ['All', ...categoryProvider.categories];

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories.map((category) {
        final isSelected = (category == 'All' && selectedCategory == null) || selectedCategory == category;
        return GestureDetector(
          onTap: () {
            setState(() {
              if (category == 'All') {
                selectedCategory = null;
              } else {
                selectedCategory = category;
              }
              _filterProducts(Provider.of<ProductProvider>(context, listen: false));
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.deepPurple : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}


      void _filterProducts(ProductProvider productProvider) {
  final query = _searchController.text.toLowerCase();

  setState(() {
    filteredProducts = productProvider.products.where((product) {
      final matchesSearch = query.isEmpty || product.name.toLowerCase().contains(query);
      final matchesCategory = selectedCategory == null || product.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  });
}


      Future<void> showLogoutDialog(BuildContext context) async {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure want to logout?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await authProvider.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Logout failed: $e")),
                    );
                  }
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        );
      }
      @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final productProvider = Provider.of<ProductProvider>(context);
    if (filteredProducts.isEmpty && productProvider.products.isNotEmpty) {
      filteredProducts = productProvider.products;
    }
  }


      @override
      Widget build(BuildContext context) {
        final productProvider = Provider.of<ProductProvider>(context);
        final favoriteProvider = Provider.of<FavoriteProvider>(context);

        return Scaffold(
            appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(36, 123, 209, 1),
        title: Row(
          children: [
            Flexible(
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  final userName = authProvider.user?.name??'User';
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Hello $userName",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () => showLogoutDialog(context),
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          ],
        ),
        ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BannerSection(controller: _searchController, onChanged: (value){
                  _filterProducts(productProvider);
                }),
                const SizedBox(height: 10),
                buildCategoryButtons(),
                const SizedBox(height: 20),
                if (productProvider.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (productProvider.errorMessage != null)
                  Center(
                    child: Text(
                      productProvider.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                else
                  ProductsGrid(
                    products: filteredProducts,
                    // products: productProvider.products,
                    favoriteProvider: favoriteProvider,
                  ),
              ],
            ),
          ),
        );
      }
    
    }


    
    class ProductsGrid extends StatelessWidget {
    final List<Product> products;
    final FavoriteProvider favoriteProvider;

    const ProductsGrid({
      super.key,
      required this.products,
      required this.favoriteProvider,
    });

    @override
    Widget build(BuildContext context) {
      if (products.isEmpty) return const Center(child: Text("No products available"));

      return Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 255,
          ),
          itemBuilder: (context, index) {
            final producted = products[index];
            final isFav = favoriteProvider.isFavorite(producted.id);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailScreen(productId: producted.id)),
                );
              },
              child: HomeProductCard(
                imageUrl: producted.imageUrl ?? "",
                label: "Best Seller",
                title: producted.name,
                price: producted.price.toDouble(),
                isFavourite: isFav,
                onFavouriteTap: () {
                  favoriteProvider.toggleFavorite(producted.id);
                },
                onAddTap: () {
                  sizeSelectionDialog(context, producted);
                },
              ),
            );
          },
        ),
      );
    }

    
    void sizeSelectionDialog(BuildContext context, Product product) {
      int? selectedSize;
      final List<int> availableSizes = [7, 8, 9, 10, 11, 12]; 

      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Select Size",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    Wrap(
                      spacing: 10,
                      children: availableSizes.map((size) {
                        final isSelected = selectedSize == size;
                        return GestureDetector(
                          onTap: () => setState(() => selectedSize = size),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.deepPurple : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                size.toString(),
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async {
                        if (selectedSize == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please select a size")),
                          );
                          return;
                        }

                        final authProvider = Provider.of<AuthProvider>(context, listen: false);
                        final cartProvider = Provider.of<CartProvider>(context, listen: false);
                        final currentUser = authProvider.user;

                        if (currentUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please login to add items to cart")),
                          );
                          return;
                        }

                        final cartItem = CartItem(
                          id: UniqueKey().toString(),
                          productId: product.id,
                          userId: currentUser.id,
                          name: product.name,
                          price: product.price,
                          quantity: 1,
                          size: selectedSize.toString(), 
                        );

                        try {
                          await cartProvider.addToCart(cartItem);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item added to cart successfully")),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Failed to add to cart: $e")),
                          );
                        }
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }



    class VerticalCategoryCard extends StatelessWidget {
      final String image;
      final String title;

      const VerticalCategoryCard({required this.image, required this.title});

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: Center(child: Image.asset(image, fit: BoxFit.cover)),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 55,
                child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black87)),
              )
            ],
          ),
        );
      }
    }

