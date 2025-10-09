import 'package:e_commerce/admin/models/product_model.dart';
import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/controllers/favorite_provider.dart';
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/auth/login_screen.dart';
import 'package:e_commerce/user/views/cart_screen.dart';
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
              final userName = authProvider.user!.name;
              return Text(
                "Hello $userName",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
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
            BannerSection(),
            const SizedBox(height: 10),
            PopularCategoriesSection(),
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
                products: productProvider.products,
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productId: producted.id)));
            },
            // child: ModernProductCard(
            //   title: producted.name,
            //    price: producted.price.toString(),
            //     label: 'best seller',
            //      isFavorite: isFav, onFavorite: favoriteProvider.toggleFavorite(producted.id), onAdd: (){}),
            child: HomeProductCard(
              label: "Best Seller",
              title: producted.name,
              price: producted.price.toString(),
              isFavourite: isFav,
              onTap: () {
                favoriteProvider.toggleFavorite(producted.id);
              },
              onAdd: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
              },
            ),

          );
        },
      ),
    );
  }
}

class PopularCategoriesSection extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'image': 'assets/images/shoes.png', 'title': 'Nike'},
    {'image': 'assets/images/clothes.png', 'title': 'Adidas'},
    {'image': 'assets/images/accessories.png', 'title': 'puma'},
    {'image': 'assets/images/sports.png', 'title': 'Sports'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('Popular Categories',
             style: TextStyle(color: Colors.black87,
              fontSize: 18)),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                
                return _VerticalCategoryCard(
                  image: category['image']!,
                   title: category['title']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalCategoryCard extends StatelessWidget {
  final String image;
  final String title;

  const _VerticalCategoryCard({required this.image, required this.title});

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


class BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(36, 123, 209, 1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
         bottomRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CustomSearchBar(text: "Search", icon: Icons.search),
          const SizedBox(height: 20),
          CarouselSlider(
            items: List.generate(
              3,
              (index) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/banner.png",
                 fit: BoxFit.contain, width: double.infinity),
              ),
            ),
            options: CarouselOptions(viewportFraction: 1.0,
             autoPlay: true,
              height: 150),
          ),
        ],
      ),
    );
  }
}
