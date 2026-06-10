import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'service_booking_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final _searchController = TextEditingController();

  final List<Map<String, dynamic>> _popularServices = [
    {
      'name': 'Plumbing',
      'icon': Icons.plumbing,
      'color': const Color(0xFF2D6EA8),
      'jobs': '240+ jobs',
    },
    {
      'name': 'Electrical',
      'icon': Icons.electric_bolt,
      'color': const Color(0xFFE6A817),
      'jobs': '180+ jobs',
    },
    {
      'name': 'HVAC',
      'icon': Icons.ac_unit,
      'color': const Color(0xFF4CAF50),
      'jobs': '120+ jobs',
    },
    {
      'name': 'Painting',
      'icon': Icons.format_paint,
      'color': const Color(0xFFE91E63),
      'jobs': '95+ jobs',
    },
    {
      'name': 'Carpentry',
      'icon': Icons.carpenter,
      'color': const Color(0xFF795548),
      'jobs': '140+ jobs',
    },
    {
      'name': 'Roofing',
      'icon': Icons.roofing,
      'color': const Color(0xFF607D8B),
      'jobs': '60+ jobs',
    },
  ];

  final List<Map<String, dynamic>> _featuredServices = [
    {
      'title': 'Kitchen & Bathroom\nPlumbing',
      'subtitle': 'Fix leaks, clogs & installations',
      'price': 'From \$75',
      'rating': 4.9,
      'jobs': '320 completed',
      'color': const Color(0xFF2D6EA8),
      'icon': Icons.plumbing,
    },
    {
      'title': 'Smart Home\nElectrical',
      'subtitle': 'Wiring, panels & smart devices',
      'price': 'From \$95',
      'rating': 4.8,
      'jobs': '215 completed',
      'color': const Color(0xFFE6A817),
      'icon': Icons.electric_bolt,
    },
    {
      'title': 'AC Tune-Up &\nRepair',
      'subtitle': 'Full system diagnostics & service',
      'price': 'From \$120',
      'rating': 4.7,
      'jobs': '180 completed',
      'color': const Color(0xFF4CAF50),
      'icon': Icons.ac_unit,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App bar
            SliverToBoxAdapter(child: _buildAppBar()),
            // Hero section
            SliverToBoxAdapter(child: _buildHero()),
            // Popular Services
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Inter',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _popularServices.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final s = _popularServices[i];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              ServiceBookingScreen(serviceType: s['name'] as String),
                        ),
                      ),
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: (s['color'] as Color).withOpacity(0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(s['icon'] as IconData,
                                  color: s['color'] as Color, size: 22),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              s['name'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              s['jobs'] as String,
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppColors.textLight,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Featured banner
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A1A1A), Color(0xFF2D2D2D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '🔥 LIMITED OFFER',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '20% OFF\nFirst Service',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Use code FORCE20 at checkout',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9E9E9E),
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 14),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Claim Offer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.discount_outlined,
                      size: 80,
                      color: Color(0xFF3D3D3D),
                    ),
                  ],
                ),
              ),
            ),
            // Featured services
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Inter',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final s = _featuredServices[i];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ServiceBookingScreen(serviceType: s['title'] as String),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color:
                                  (s['color'] as Color).withOpacity(0.1),
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(16)),
                            ),
                            child: Icon(s['icon'] as IconData,
                                size: 40,
                                color:
                                    (s['color'] as Color).withOpacity(0.8)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    s['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                      fontFamily: 'Inter',
                                      height: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    s['subtitle'] as String,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: AppColors.primary, size: 13),
                                      const SizedBox(width: 3),
                                      Text(
                                        '${s['rating']}',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '• ${s['jobs']}',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textLight,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        s['price'] as String,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                          fontFamily: 'Inter',
                                        ),
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
                },
                childCount: _featuredServices.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
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
          Stack(
            children: [
              const Icon(Icons.notifications_outlined,
                  color: AppColors.textPrimary, size: 22),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WELCOME BACK',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              letterSpacing: 1.5,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Hi, neighbor.\nWhat needs\nfixing today?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              fontFamily: 'Inter',
              height: 1.15,
            ),
          ),
          const SizedBox(height: 18),
          // Search bar
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F4F0),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Icon(Icons.search, color: AppColors.textLight, size: 20),
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search for plumbing, electrical or ac...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLight,
                        fontFamily: 'Inter',
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
