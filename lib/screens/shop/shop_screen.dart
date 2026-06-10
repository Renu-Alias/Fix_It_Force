import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'product_detail_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'All Tools',
    'Power Drills',
    'Saws & Cutting',
    'Hand Tools',
    'Storage',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Titan-X 18V Cordless Drill',
      'brand': 'TitanX Pro',
      'price': 149.00,
      'originalPrice': 189.00,
      'rating': 4.8,
      'reviews': 124,
      'badge': 'Top Rated',
      'category': 'Power Drills',
      'color': const Color(0xFFE8A020),
      'icon': Icons.electric_bolt,
    },
    {
      'name': 'ProGrip Circular Saw 7.5"',
      'brand': 'ProGrip',
      'price': 219.00,
      'originalPrice': 269.00,
      'rating': 4.6,
      'reviews': 87,
      'badge': 'Best Seller',
      'category': 'Saws & Cutting',
      'color': const Color(0xFF2D6EA8),
      'icon': Icons.content_cut,
    },
    {
      'name': 'MaxForce Hammer Set (5pc)',
      'brand': 'MaxForce',
      'price': 64.99,
      'originalPrice': 84.99,
      'rating': 4.5,
      'reviews': 203,
      'badge': null,
      'category': 'Hand Tools',
      'color': const Color(0xFF5A3E2B),
      'icon': Icons.hardware,
    },
    {
      'name': 'TechBox Rolling Tool Chest',
      'brand': 'TechBox',
      'price': 349.00,
      'originalPrice': 429.00,
      'rating': 4.9,
      'reviews': 56,
      'badge': 'New',
      'category': 'Storage',
      'color': const Color(0xFF1A1A1A),
      'icon': Icons.inventory_2,
    },
    {
      'name': 'VoltMaster Impact Driver',
      'brand': 'VoltMaster',
      'price': 129.00,
      'originalPrice': 159.00,
      'rating': 4.7,
      'reviews': 98,
      'badge': 'Sale',
      'category': 'Power Drills',
      'color': const Color(0xFF1E7A4E),
      'icon': Icons.settings,
    },
    {
      'name': 'SteelGrip Plier Set (8pc)',
      'brand': 'SteelGrip',
      'price': 44.50,
      'originalPrice': 59.00,
      'rating': 4.4,
      'reviews': 165,
      'badge': null,
      'category': 'Hand Tools',
      'color': const Color(0xFF8B1A1A),
      'icon': Icons.build,
    },
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    if (_selectedCategory == 0) return _products;
    return _products.where((p) => p['category'] == _categories[_selectedCategory]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            _buildAppBar(context),
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'The Tool Shed',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Quality gear for every project. From heavy-duty power tools to precision hand instruments, we\'ve got the muscle for your hustle.',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      fontFamily: 'Inter',
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Categories
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () => setState(() => _selectedCategory = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedCategory == i
                                ? AppColors.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _selectedCategory == i
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            _categories[i],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: _selectedCategory == i
                                  ? Colors.white
                                  : AppColors.textSecondary,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Products grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemCount: _filteredProducts.length,
                itemBuilder: (context, i) {
                  final p = _filteredProducts[i];
                  return _ProductCard(
                    product: p,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: p),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.handyman, color: AppColors.primary, size: 22),
          const SizedBox(width: 8),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Fix It ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontFamily: 'Inter',
                  ),
                ),
                TextSpan(
                  text: 'Force',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, size: 22),
            onPressed: () {},
            color: AppColors.textPrimary,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, size: 22),
                onPressed: () {},
                color: AppColors.textPrimary,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image area
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: (product['color'] as Color).withOpacity(0.08),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Center(
                      child: Icon(
                        product['icon'] as IconData,
                        size: 64,
                        color: (product['color'] as Color).withOpacity(0.7),
                      ),
                    ),
                  ),
                  if (product['badge'] != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: product['badge'] == 'Sale'
                              ? AppColors.error
                              : product['badge'] == 'New'
                                  ? AppColors.success
                                  : AppColors.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          product['badge'] as String,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.favorite_border,
                          size: 14, color: AppColors.textLight),
                    ),
                  ),
                ],
              ),
            ),
            // Info
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'] as String,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Inter',
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.primary, size: 12),
                        const SizedBox(width: 3),
                        Text(
                          '${product['rating']}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          ' (${product['reviews']})',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textLight,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$${product['price'].toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '\$${product['originalPrice'].toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textLight,
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
