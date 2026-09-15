import 'package:flutter/material.dart';



class MerchantDashboard extends StatefulWidget {
  const MerchantDashboard({super.key});

  @override
  State<MerchantDashboard> createState() => _MerchantDashboardState();
}

class _MerchantDashboardState extends State<MerchantDashboard> {
  int selectedNav = 0;
  bool showBalance = true;
  bool isWeek = true;

  static const primary = Color(0xFF003EC7);
  static const background = Color(0xFFF9F9FF);
  static const border = Color(0xFFC3C5D9);
  static const textPrimary = Color(0xFF141B2B);
  static const textSecondary = Color(0xFF434656);
  static const success = Color(0xFF006E2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 100),
                child: Column(
                  children: [
                    _buildBalanceCard(),
                    const SizedBox(height: 14),
                    _buildSalesOverview(),
                    const SizedBox(height: 14),
                    _buildQuickActions(),
                    const SizedBox(height: 16),
                    _buildSalesTrends(),
                    const SizedBox(height: 16),
                    _buildRecentTransactions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ---------------------------------------------------------------------------
  // HEADER
  // ---------------------------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          bottom: BorderSide(
            color: border,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Container(
                color: const Color(0xFFE8ECF7),
                child: const Icon(
                  Icons.person,
                  size: 24,
                  color: primary,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          const Text(
            'MerchantHub',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: primary,
            ),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 38,
              minHeight: 38,
            ),
            icon: const Icon(
              Icons.visibility_outlined,
              size: 21,
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // AVAILABLE BALANCE
  // ---------------------------------------------------------------------------

  Widget _buildBalanceCard() {
    return Container(
      height: 145,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'AVAILABLE BALANCE',
                    style: TextStyle(
                      color: Color(0xCCFFFFFF),
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showBalance = !showBalance;
                      });
                    },
                    child: Icon(
                      showBalance
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white70,
                      size: 12,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 2),

              Text(
                showBalance ? '\$24,850.42' : '••••••••',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.0,
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  _balanceStat(
                    'Active Payouts',
                    '\$1,200.00',
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white.withOpacity(.2),
                  ),
                  _balanceStat(
                    'In Review',
                    '\$420.15',
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            right: -65,
            top: -65,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.04),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xB3FFFFFF),
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // SALES OVERVIEW
  // ---------------------------------------------------------------------------

  Widget _buildSalesOverview() {
    return Container(
      // height: 145,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Sales",
                      style: TextStyle(
                        fontSize: 9,
                        color: textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Text(
                      '\$4,250.00',
                      style: TextStyle(
                        fontSize: 23,
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                        letterSpacing: -.3,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: const [
                        Icon(
                          Icons.trending_up,
                          color: success,
                          size: 11,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '+12.4% vs yesterday',
                          style: TextStyle(
                            fontSize: 9,
                            color: success,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDFF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.payments_outlined,
                  size: 16,
                  color: primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            height: 1,
            color: const Color(0x80C3C5D9),
          ),

          const SizedBox(height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly Revenue',
                      style: TextStyle(
                        fontSize: 9,
                        color: textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      '\$124,500.00',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '82% of Goal',
                style: TextStyle(
                  fontSize: 8,
                  color: textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 4,
              child: LinearProgressIndicator(
                value: .82,
                backgroundColor: const Color(0xFFF1F3FF),
                valueColor: const AlwaysStoppedAnimation(primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // QUICK ACTIONS
  // ---------------------------------------------------------------------------

  Widget _buildQuickActions() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.6,
      children: [
        _quickAction(
          icon: Icons.qr_code_2,
          title: 'Receive Payment',
          background: const Color(0xFFE9F0FF),
          iconColor: primary,
          onTap: () {},
        ),
        _quickAction(
          icon: Icons.send_outlined,
          title: 'Send Money',
          background: const Color(0xFFD9FFE2),
          iconColor: success,
          onTap: () {},
        ),
        _quickAction(
          icon: Icons.description_outlined,
          title: 'Create Invoice',
          background: const Color(0xFFF0F0F5),
          iconColor: textSecondary,
          onTap: () {},
        ),
        _quickAction(
          icon: Icons.account_balance_wallet_outlined,
          title: 'Withdraw',
          background: const Color(0xFFF0F0F5),
          iconColor: textSecondary,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _quickAction({
    required IconData icon,
    required String title,
    required Color background,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // SALES TRENDS
  // ---------------------------------------------------------------------------

  Widget _buildSalesTrends() {
    final values = [
      .55,
      .74,
      .37,
      .92,
      .83,
      .45,
      .55,
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 12),
            child: Row(
              children: [
                const Text(
                  'Sales Trends',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 28,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EDFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isWeek = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isWeek ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: isWeek
                                ? const [
                              BoxShadow(
                                color: Color(0x0D000000),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ]
                                : null,
                          ),
                          child: Text(
                            'Week',
                            style: TextStyle(
                              fontSize: 8,
                              color: isWeek
                                  ? textPrimary
                                  : textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isWeek = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Text(
                            'Month',
                            style: TextStyle(
                              fontSize: 8,
                              color: !isWeek
                                  ? textPrimary
                                  : textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 185,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  values.length,
                      (index) {
                    final selected = index == 3;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: values[index],
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected
                                    ? primary
                                    : const Color(0xFFE5EBFA),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // RECENT TRANSACTIONS
  // ---------------------------------------------------------------------------

  Widget _buildRecentTransactions() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
            child: Row(
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            color: border,
          ),

          _transaction(
            icon: Icons.person_outline,
            iconBackground: const Color(0xFFD9FFE2),
            iconColor: success,
            title: 'Alex Rivera',
            subtitle: '10:42 AM • Visa ***42',
            amount: '+\$842.00',
          ),

          _transaction(
            icon: Icons.shopping_cart_outlined,
            iconBackground: const Color(0xFFE9E9EF),
            iconColor: textSecondary,
            title: 'Coffee & Co.',
            subtitle: '09:15 AM • Mastercard',
            amount: '+\$12.50',
          ),

          _transaction(
            icon: Icons.swap_horiz,
            iconBackground: const Color(0xFFE9F0FF),
            iconColor: primary,
            title: 'Internal Payout',
            subtitle: 'Yesterday • Bank Transfer',
            amount: '-\$1,500.00',
            last: true,
          ),
        ],
      ),
    );
  }

  Widget _transaction({
    required IconData icon,
    required Color iconBackground,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    bool last = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(
          bottom: BorderSide(
            color: Color(0x80C3C5D9),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 16,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 8,
                    color: textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: const Color(0x1A5CFD80),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'SUCCESS',
                  style: TextStyle(
                    fontSize: 7,
                    height: 1.5,
                    color: success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // BOTTOM NAVIGATION
  // ---------------------------------------------------------------------------

  Widget _buildBottomNavigation() {
    final items = [
      (Icons.home_outlined, Icons.home, 'Home'),
      (Icons.account_balance_wallet_outlined,
      Icons.account_balance_wallet, 'Payments'),
      (Icons.receipt_long_outlined, Icons.receipt_long, 'History'),
      (Icons.insights_outlined, Icons.insights, 'Insights'),
      (Icons.menu, Icons.menu, 'More'),
    ];

    return Container(
      height: 81,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          top: BorderSide(
            color: border,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
              (index) {
            final selected = selectedNav == index;
            final item = items[index];

            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedNav = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selected ? item.$2 : item.$1,
                      size: 18,
                      color: selected
                          ? primary
                          : textSecondary,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$3,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: selected
                            ? primary
                            : textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}