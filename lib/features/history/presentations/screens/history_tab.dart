import 'package:flutter/material.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/core/utils/color_utils.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() =>
      _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  int selectedBottomIndex = 2;
  int selectedTab = 0;

  final List<Transaction> transactions = [
    Transaction(
      invoice: '#INV-2024-001',
      date: 'Oct 12, 2023',
      service: 'Premium Freight Services',
      amount: '\$4,500.00',
      payment: 'via Wire Transfer',
      status: TransactionStatus.paid,
    ),
    Transaction(
      invoice: '#INV-2024-004',
      date: 'Oct 28, 2023',
      service: 'Express Customs Clearance',
      amount: '\$2,250.00',
      payment: 'Due in 4 days',
      status: TransactionStatus.pending,
    ),
    Transaction(
      invoice: '#INV-2023-982',
      date: 'Sep 15, 2023',
      service: 'International Shipping',
      amount: '\$12,700.00',
      payment: 'via ACH',
      status: TransactionStatus.paid,
    ),
    Transaction(
      invoice: '#INV-2023-945',
      date: 'Aug 22, 2023',
      service: 'Warehouse Storage Q3',
      amount: '\$8,000.00',
      payment: '12 days overdue',
      status: TransactionStatus.overdue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilsPallets.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  32,
                  16,
                  110,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCustomerHeader(),

                    const SizedBox(height: 24),

                    _buildFinancialSummary(),

                    const SizedBox(height: 24),

                    _buildTransactionSection(),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TOP BAR
  // ---------------------------------------------------------------------------

  Widget _buildTopBar() {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: ColorUtilsPallets.background,
        border: Border(
          bottom: BorderSide(
            color: ColorUtilsPallets.border,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: ColorUtilsPallets.avatarBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const Icon(
                Icons.person,
                size: 20,
                color: ColorUtilsPallets.primary,
              ),
            ),
          ),

          const SizedBox(width: 16),

          const Text(
            'MerchantHub',
            style: TextStyle(
              fontSize: 20,
              height: 28 / 20,
              fontWeight: FontWeight.w700,
              color: ColorUtilsPallets.primary,
            ),
          ),

          const Spacer(),

          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
            icon: const Icon(
              Icons.visibility_outlined,
              size: 20,
              color: ColorUtilsPallets.primary,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // CUSTOMER HEADER
  // ---------------------------------------------------------------------------

  Widget _buildCustomerHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorUtilsPallets.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'JH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  height: 56 / 48,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.96,
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jonathan Higgins',
                    style: TextStyle(
                      fontSize: 24,
                      height: 32 / 24,
                      fontWeight: FontWeight.w600,
                      color: ColorUtilsPallets.textPrimary,
                      letterSpacing: -0.24,
                    ),
                  ),

                  const Text(
                    'Global Logistics Solutions Ltd.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 24 / 16,
                      fontWeight: FontWeight.w400,
                      color: ColorUtilsPallets.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  _contactRow(
                    Icons.email_outlined,
                    'j.higgins@globallogistics.com',
                  ),

                  const SizedBox(height: 6),

                  _contactRow(
                    Icons.phone_outlined,
                    '+1 (555) 012-3456',
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: _primaryButton(
                icon: Icons.add,
                label: 'Create Invoice',
                onTap: () {},
              ),
            ),

            const SizedBox(width: 8),

            _squareButton(
              Icons.edit_outlined,
              onTap: () {},
            ),

            const SizedBox(width: 8),

            _squareButton(
              Icons.chat_outlined,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _contactRow(
      IconData icon,
      String text,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: ColorUtilsPallets.textMuted,
        ),

        const SizedBox(width: 4),

        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: ColorUtilsPallets.textMuted,
            ),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // FINANCIAL SUMMARY
  // ---------------------------------------------------------------------------

  Widget _buildFinancialSummary() {
    return Column(
      children: [
        _buildTotalBilledCard(),

        const SizedBox(height: 18),

        _buildTotalPaidCard(),

        const SizedBox(height: 18),

        _buildOutstandingCard(),
      ],
    );
  }

  Widget _buildTotalBilledCard() {
    return _financialCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Billed',
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: ColorUtilsPallets.textMuted,
            ),
          ),

          const SizedBox(height: 4),

           Text(
            '\$128,450.00',
            style: TextStyle(
              fontSize: 32,
              height: 40 / 32,
              fontWeight: FontWeight.w600,
              color: ColorUtilsPallets.textPrimary,
              letterSpacing: -0.32,
            ),
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              const Icon(
                Icons.trending_up,
                size: 18,
                color: ColorUtilsPallets.success,
              ),

              const SizedBox(width: 4),

              const Text(
                '+12% from last month',
                style: TextStyle(
                  fontSize: 14,
                  height: 16 / 14,
                  fontWeight: FontWeight.w600,
                  color: ColorUtilsPallets.success,
                  letterSpacing: 0.14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPaidCard() {
    return _financialCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Paid',
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: ColorUtilsPallets.textMuted,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            '\$114,200.00',
            style: TextStyle(
              fontSize: 32,
              height: 40 / 32,
              fontWeight: FontWeight.w600,
              color: ColorUtilsPallets.success,
              letterSpacing: -0.32,
            ),
          ),

          const SizedBox(height: 32),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const LinearProgressIndicator(
                  value: 0.88,
                  minHeight: 8,
                  backgroundColor: ColorUtilsPallets.progressBackground,
                  valueColor: AlwaysStoppedAnimation(
                    ColorUtilsPallets.success,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                '88% completion rate',
                style: TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w500,
                  color: ColorUtilsPallets.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutstandingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: ColorUtilsPallets.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorUtilsPallets.primary.withOpacity(0.10),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Opacity(
            opacity: 0.8,
            child: Text(
              'Outstanding Balance',
              style: TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            '\$14,250.00',
            style: TextStyle(
              fontSize: 32,
              height: 40 / 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: -0.32,
            ),
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text(
                  '3 Overdue Invoices',
                  style: TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.14,
                  ),
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _financialCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: ColorUtilsPallets.surface,
        border: Border.all(
          color: ColorUtilsPallets.border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  // ---------------------------------------------------------------------------
  // TRANSACTIONS
  // ---------------------------------------------------------------------------

  Widget _buildTransactionSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorUtilsPallets.surface,
        border: Border.all(
          color: ColorUtilsPallets.border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildTabs(),

          ...List.generate(
            transactions.length,
                (index) {
              return _buildTransactionRow(
                transactions[index],
                index == transactions.length - 1,
              );
            },
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 25,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ColorUtilsPallets.border,
                ),
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'View All 42 Transactions',
                  style: TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w600,
                    color: ColorUtilsPallets.primary,
                    letterSpacing: 0.14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    const tabs = [
      'Purchase\nHistory',
      'Activity\nLog',
      'Documents',
    ];

    return Container(
      height: 57,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorUtilsPallets.border,
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
              (index) {
            final selected = selectedTab == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selected
                          ? ColorUtilsPallets.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? ColorUtilsPallets.primary
                        : ColorUtilsPallets.textSecondary,
                    letterSpacing: 0.14,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionRow(
      Transaction transaction,
      bool isLast,
      ) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 72,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
          bottom: BorderSide(
            color: ColorUtilsPallets.border,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTransactionIcon(transaction.status),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invoice ${transaction.invoice}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w600,
                    color: ColorUtilsPallets.textPrimary,
                    letterSpacing: 0.14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  '${transaction.date} • ${transaction.service}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 20 / 14,
                    fontWeight: FontWeight.w400,
                    color: ColorUtilsPallets.textMuted,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction.amount,
                style: const TextStyle(
                  fontSize: 14,
                  height: 16 / 14,
                  fontWeight: FontWeight.w600,
                  color: ColorUtilsPallets.textPrimary,
                  letterSpacing: 0.14,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                transaction.payment,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w400,
                  color: transaction.status ==
                      TransactionStatus.overdue
                      ? ColorUtilsPallets.error
                      : ColorUtilsPallets.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionIcon(
      TransactionStatus status,
      ) {
    late Color background;
    late Color foreground;
    late IconData icon;

    switch (status) {
      case TransactionStatus.paid:
        background = ColorUtilsPallets.successLight;
        foreground = ColorUtilsPallets.success;
        icon = Icons.check_circle_outline;
        break;

      case TransactionStatus.pending:
        background = ColorUtilsPallets.errorLight;
        foreground = ColorUtilsPallets.error;
        icon = Icons.more_horiz;
        break;

      case TransactionStatus.overdue:
        background = ColorUtilsPallets.errorLight;
        foreground = ColorUtilsPallets.error;
        icon = Icons.warning_amber_rounded;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: foreground,
        size: 20,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // BUTTONS
  // ---------------------------------------------------------------------------

  Widget _primaryButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorUtilsPallets.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
        ),
        icon: Icon(
          icon,
          size: 14,
        ),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.14,
          ),
        ),
      ),
    );
  }

  Widget _squareButton(
      IconData icon, {
        required VoidCallback onTap,
      }) {
    return SizedBox(
      width: 40,
      height: 40,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: const BorderSide(
            color: ColorUtilsPallets.border,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: ColorUtilsPallets.primary,
        ),
      ),
    );
  }


}

// -----------------------------------------------------------------------------
// MODELS
// -----------------------------------------------------------------------------

enum TransactionStatus {
  paid,
  pending,
  overdue,
}

class Transaction {
  final String invoice;
  final String date;
  final String service;
  final String amount;
  final String payment;
  final TransactionStatus status;

  const Transaction({
    required this.invoice,
    required this.date,
    required this.service,
    required this.amount,
    required this.payment,
    required this.status,
  });
}

