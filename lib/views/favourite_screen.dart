
import 'package:e_commerce/controllers/favorite_provider.dart';
import 'package:e_commerce/controllers/product_provider.dart';
import 'package:e_commerce/widgets/home_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    final favoriteProducts = productProvider.products
        .where((p) => favoriteProvider.isFavorite(p.id))
        .toList();

    if (favoriteProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (favoriteProducts.isEmpty) {
      return const Center(child: Text("No favorites yet"));
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: favoriteProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 255,
        ),
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          final isFav = favoriteProvider.isFavorite(product.id);

          return HomeProductCard(
            label: "Best Seller",
            title: product.name,
            price: product.price.toString(),
            isFavourite: isFav,
            onTap: () {
              favoriteProvider.toggleFavorite(product.id);
            },
            onAdd: () {
            },
          );
        },
      ),
    );
  }
}
