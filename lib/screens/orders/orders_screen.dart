import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _activeOrders = [
    {
      'title': 'Kitchen Faucet Repair',
      'amount': '\$85.00',
      'date': 'Scheduled for Oct 24, 2023',
      'id': '#FIF-9920',
      'status': 'In Progress',
      'statusColor': AppColors.inProgress,
      'type': 'service',
      'icon': Icons.plumbing,
      'color': const Color(0xFF2D6EA8),
      'action': 'Track Order',
    },
    {
      'title': 'AC System Tune-up',
      'amount': '\$120.00',
      'date': 'Oct 28, 09:00 AM',
      'id': '#FIF-9902',
      'status': 'Scheduled',
      'statusColor': AppColors.scheduled,
      'type': 'service',
      'icon': Icons.ac_unit,
      'color': const Color(0xFF4CAF50),
      'action': 'View Details',
    },
    {
      'title': 'Premium Tool Set',
      'amount': '\$195.50',
      'date': 'Arriving by Today, 6PM',
      'id': '#FIF-3329',
      'status': 'On the Way',
      'statusColor': AppColors.onTheWay,
      'type': 'product',
      'icon': Icons.build,
      'color': const Color(0xFF1A1A1A),
      'action': 'Track Shipment',
    },
  ];

  final List<Map<String, dynamic>> _pastOrders = [
    {
      'title': 'Electrical Panel Upgrade',
      'amount': '\$450.00',
      'date': 'Completed Sep 15, 2023',
      'id': '#FIF-7821',
      'status': 'Completed',
      'statusColor': AppColors.success,
      'type': 'service',
      'icon': Icons.electric_bolt,
      'color': const Color(0xFFE6A817),
      'action': 'Book Again',
    },
    {
      'title': 'Cordless Drill Set',
      'amount': '\$149.00',
      'date': 'Delivered Aug 30, 2023',
      'id': '#FIF-6541',
      'status': 'Delivered',
      'statusColor': AppColors.success,
      'type': 'product',
      'icon': Icons.electric_bolt,
      'color': const Color(0xFFE6A817),
      'action': 'Reorder',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            _buildAppBar(),
            // Title + tabs
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Orders',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 14),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.textSecondary,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'Active'),
                      Tab(text: 'Past'),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOrderList(_activeOrders, showPromo: true),
                  _buildOrderList(_pastOrders),
                ],
              ),
            ),
          ],
        ),
      ),
      // Emergency CTA
      bottomSheet: _buildEmergencyCTA(),
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

  Widget _buildOrderList(List<Map<String, dynamic>> orders,
      {bool showPromo = false}) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: orders.length + (showPromo ? 1 : 0),
      itemBuilder: (context, i) {
        // Insert promo after 2nd item
        if (showPromo && i == 2) return _buildPromoCard();
        final index = showPromo && i > 2 ? i - 1 : i;
        return _OrderCard(order: orders[index]);
      },
    );
  }

  Widget _buildPromoCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Keep your home\nin top shape',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Subscribe to our monthly maintenance plan\nand save 20% on all repair services.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFFE0A0),
                    fontFamily: 'Inter',
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Learn More',
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
            Icons.home_repair_service,
            size: 70,
            color: Color(0x33000000),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyCTA() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Need a fix right now?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Our team is available 24/7 for emergency repairs.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.flash_on, size: 18),
              label: const Text(
                'Book Emergency Service',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: (order['color'] as Color).withOpacity(0.1),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(
                    order['icon'] as IconData,
                    size: 56,
                    color: (order['color'] as Color).withOpacity(0.6),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: order['statusColor'] as Color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order['status'] as String,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Info
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        order['title'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    Text(
                      order['amount'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  order['date'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['id'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                        fontFamily: 'Inter',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            order['action'] as String,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(width: 3),
                          const Icon(Icons.chevron_right,
                              color: AppColors.primary, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
