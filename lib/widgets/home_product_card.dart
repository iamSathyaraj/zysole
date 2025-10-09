
import 'package:flutter/material.dart';

class HomeProductCard extends StatelessWidget {
  final String label;
  final String title;
  final String price;
  final bool isFavourite; 
  final VoidCallback onTap; 
  final VoidCallback onAdd; 

  const HomeProductCard({
    super.key,
    required this.label,
    required this.title,
    required this.price,
    required this.isFavourite,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                  color: Colors.amber, 

                ),
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 2,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add, color: Colors.white, size: 20),
              onPressed: onAdd,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: isFavourite ? Colors.red : Colors.grey,
            ),
            onPressed: onTap,
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeProductCard extends StatefulWidget {
//   final String label;
//   final String title;
//   final String price;
//   final bool isFavourite;
//   final VoidCallback onTap;
//   final VoidCallback onAdd;
//   final String? imageUrl; // Optional product image URL

//   const HomeProductCard({
//     super.key,
//     required this.label,
//     required this.title,
//     required this.price,
//     required this.isFavourite,
//     required this.onTap,
//     required this.onAdd,
//     this.imageUrl,
//   });

//   @override
//   State<HomeProductCard> createState() => _HomeProductCardState();
// }

// class _HomeProductCardState extends State<HomeProductCard>
//     with SingleTickerProviderStateMixin {
//   late bool _isFav;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _isFav = widget.isFavourite;
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//       lowerBound: 0.7,
//       upperBound: 1.0,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _toggleFavorite() {
//     setState(() {
//       _isFav = !_isFav;
//       _controller.forward().then((_) => _controller.reverse());
//     });
//     widget.onTap();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 6,
//       borderRadius: BorderRadius.circular(20),
//       shadowColor: Colors.black26,
//       child: Container(
//         width: 180,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           // Prevent column from expanding infinitely and causing overflow
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 // Product image with placeholder and loading/error handling
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//                   child: widget.imageUrl != null
//                       ? Image.network(
//                           widget.imageUrl!,
//                           height: 140,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                           loadingBuilder: (context, child, progress) {
//                             if (progress == null) return child;
//                             return Container(
//                               height: 140,
//                               color: Colors.grey[300],
//                               child: const Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               height: 140,
//                               color: Colors.grey[300],
//                               child: const Center(
//                                 child: Icon(Icons.broken_image, size: 50),
//                               ),
//                             );
//                           },
//                         )
//                       : Container(
//                           height: 140,
//                           color: Colors.grey.shade300,
//                           child: const Center(
//                             child: Icon(Icons.image, size: 60, color: Colors.white54),
//                           ),
//                         ),
//                 ),
//                 // Label banner
//                 Positioned(
//                   top: 10,
//                   left: 0,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20),
//                         bottomRight: Radius.circular(20),
//                       ),
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromARGB(220, 0, 123, 255),
//                           Color.fromARGB(180, 0, 86, 179),
//                         ],
//                       ),
//                     ),
//                     child: Text(
//                       widget.label.toUpperCase(),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         shadows: [Shadow(blurRadius: 3, color: Colors.black26)],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Favorite icon
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: ScaleTransition(
//                     scale: _controller,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: _toggleFavorite,
//                       child: Icon(
//                         _isFav ? Icons.favorite : Icons.favorite_border,
//                         color: _isFav ? Colors.redAccent : Colors.grey,
//                         size: 26,
//                         shadows: const [
//                           Shadow(
//                               blurRadius: 4, offset: Offset(0, 2), color: Colors.black26)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black87,
//                       height: 1.3,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     "\$${widget.price}",
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8, right: 12),
//               child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     backgroundColor: Colors.deepPurple,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
//                     elevation: 5,
//                     shadowColor: Colors.deepPurpleAccent,
//                   ),
//                   onPressed: widget.onAdd,
//                   child: const Icon(Icons.add, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomeProductCard extends StatefulWidget {
//   final String label;
//   final String title;
//   final String price;
//   final bool isFavourite;
//   final VoidCallback onTap;
//   final VoidCallback onAdd;
//   final String? imageUrl;

//   const HomeProductCard({
//     super.key,
//     required this.label,
//     required this.title,
//     required this.price,
//     required this.isFavourite,
//     required this.onTap,
//     required this.onAdd,
//     this.imageUrl,
//   });

//   @override
//   State<HomeProductCard> createState() => _HomeProductCardState();
// }

// class _HomeProductCardState extends State<HomeProductCard>
//     with SingleTickerProviderStateMixin {
//   late bool _isFav;
//   late AnimationController _favController;

//   @override
//   void initState() {
//     super.initState();
//     _isFav = widget.isFavourite;
//     _favController = AnimationController(
//       duration: const Duration(milliseconds: 350),
//       vsync: this,
//       lowerBound: 1.0,
//       upperBound: 1.15,
//     );
//   }

//   @override
//   void dispose() {
//     _favController.dispose();
//     super.dispose();
//   }

//   void _toggleFavorite() {
//     setState(() {
//       _isFav = !_isFav;
//       _favController.forward().then((_) => _favController.reverse());
//     });
//     widget.onTap();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 190,
//       height: 280,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade400.withOpacity(0.5),
//             blurRadius: 24,
//             spreadRadius: 1,
//             offset: const Offset(0, 16),
//           ),
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 24,
//             spreadRadius: 1,
//             offset: const Offset(0, -8),
//           ),
//         ],
//         color: Colors.white,
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(32),
//         child: Stack(
//           children: [
//             // Image with colored overlay
//             Positioned.fill(
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                     Colors.deepPurple.withOpacity(0.25), BlendMode.multiply),
//                 child: widget.imageUrl != null
//                     ? Image.network(
//                         widget.imageUrl!,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (context, child, progress) {
//                           if (progress == null) return child;
//                           return Container(
//                             color: Colors.grey[200],
//                             child: const Center(
//                               child: CircularProgressIndicator(),
//                             ),
//                           );
//                         },
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: Colors.grey[200],
//                             child: const Center(
//                               child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
//                             ),
//                           );
//                         },
//                       )
//                     : Container(
//                         color: Colors.grey[200],
//                         child: const Center(
//                           child: Icon(Icons.image, size: 60, color: Colors.grey),
//                         ),
//                       ),
//               ),
//             ),

//             // Gradient curved label badge top-left
//             Positioned(
//               top: 12,
//               left: 12,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                       colors: [Color(0xFF536DFE), Color(0xFF7BA7FF)]),
//                   borderRadius: BorderRadius.circular(24),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   widget.label.toUpperCase(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w800,
//                     fontSize: 13,
//                     shadows: [Shadow(blurRadius: 4, color: Colors.black26)],
//                   ),
//                 ),
//               ),
//             ),

//             // Price floating badge top-right
//             Positioned(
//               top: 12,
//               right: 16,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.deepPurple,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.deepPurple.withOpacity(0.5),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child: Text(
//                   "\$${widget.price}",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       shadows: [Shadow(blurRadius: 3, color: Colors.black38)]),
//                 ),
//               ),
//             ),

//             // Favorite toggle button bottom-left
//             Positioned(
//               bottom: 16,
//               left: 16,
//               child: ScaleTransition(
//                 scale: _favController,
//                 child: GestureDetector(
//                   onTap: _toggleFavorite,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: _isFav
//                           ? Colors.red.shade400
//                           : Colors.white.withOpacity(0.9),
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26.withOpacity(0.2),
//                           blurRadius: 6,
//                           offset: const Offset(0, 2),
//                         )
//                       ],
//                     ),
//                     padding: const EdgeInsets.all(12),
//                     child: Icon(
//                       _isFav ? Icons.favorite : Icons.favorite_border,
//                       color: _isFav ? Colors.white : Colors.grey.shade600,
//                       size: 28,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Add to cart floating circular button bottom-right
//             Positioned(
//               bottom: 12,
//               right: 12,
//               child: FloatingActionButton(
//                 heroTag: null, // avoid conflicts if multiple FABs
//                 backgroundColor: Colors.deepPurple,
//                 elevation: 6,
//                 mini: true,
//                 onPressed: widget.onAdd,
//                 child: const Icon(Icons.add, color: Colors.white),
//               ),
//             ),

//             // Title text bottom center with semi-transparent background
//             Positioned(
//               bottom: 64,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                 color: Colors.black54.withOpacity(0.5),
//                 child: Text(
//                   widget.title,
//                   maxLines: 2,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     shadows: [Shadow(blurRadius: 4, color: Colors.black87)],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
