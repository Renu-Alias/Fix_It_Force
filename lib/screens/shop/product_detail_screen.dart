import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  bool _addedToCart = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final discount = ((1 - (p['price'] as double) / (p['originalPrice'] as double)) * 100).round();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Hero image / App bar
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8)
                          ],
                        ),
                        child: const Icon(Icons.arrow_back_ios_new,
                            size: 18, color: AppColors.textPrimary),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: _isFavorite
                                  ? AppColors.error
                                  : AppColors.textLight,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: (p['color'] as Color).withOpacity(0.08),
                      child: Center(
                        child: Icon(
                          p['icon'] as IconData,
                          size: 130,
                          color: (p['color'] as Color).withOpacity(0.75),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Badge + rating
                              Row(
                                children: [
                                  if (p['badge'] != null) ...[
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary
                                            .withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        p['badge'] as String,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryDark,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                  Row(
                                    children: List.generate(
                                      5,
                                      (i) => Icon(
                                        i < (p['rating'] as double).floor()
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: AppColors.primary,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${p['rating']} (${p['reviews']} Reviews)',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Product name
                              Text(
                                p['name'] as String,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Inter',
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'by ${p['brand']}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textLight,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Pricing
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'BUY NOW',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textLight,
                                          letterSpacing: 1,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      Text(
                                        '\$${p['price'].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.textPrimary,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'FIRST BUY',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textLight,
                                          letterSpacing: 1,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      Text(
                                        '\$${((p['price'] as double) * 0.08).toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.success,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.error.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '-$discount%',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.error,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Was \$${p['originalPrice'].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textLight,
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: AppColors.border, height: 1),
                        const SizedBox(height: 20),
                        // Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Product Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Built for demanding professionals and serious DIYers. This tool combines cutting-edge engineering with ergonomic design to give you the power and precision you need, every single time.',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                  fontFamily: 'Inter',
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Feature bullets
                              ..._featureBullets(),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        // Quantity selector
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  _QtyButton(
                                    icon: Icons.remove,
                                    onTap: () {
                                      if (_quantity > 1)
                                        setState(() => _quantity--);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      '$_quantity',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ),
                                  _QtyButton(
                                    icon: Icons.add,
                                    onTap: () => setState(() => _quantity++),
                                    filled: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom CTA
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 16,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _addedToCart = true);
                      Future.delayed(const Duration(seconds: 2),
                          () => setState(() => _addedToCart = false));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 54,
                      decoration: BoxDecoration(
                        color: _addedToCart
                            ? AppColors.success
                            : AppColors.primary,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.35),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _addedToCart
                                  ? Icons.check_circle_outline
                                  : Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _addedToCart ? 'Added to Cart!' : 'Add to Cart',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border, width: 1.5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.share_outlined,
                      color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _featureBullets() {
    final features = [
      'High-torque motor for maximum performance',
      'Ergonomic grip reduces fatigue',
      '2-year manufacturer warranty',
      'Includes carrying case and accessories',
    ];
    return features
        .map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle,
                      color: AppColors.primary, size: 16),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      f,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontFamily: 'Inter',
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  const _QtyButton({required this.icon, required this.onTap, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
              color: filled ? AppColors.primary : AppColors.border),
        ),
        child: Icon(icon,
            size: 18, color: filled ? Colors.white : AppColors.textPrimary),
      ),
    );
  }
}
