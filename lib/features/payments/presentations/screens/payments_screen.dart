import 'package:flutter/material.dart';

class ReceivePaymentScreen extends StatelessWidget {
  const ReceivePaymentScreen({super.key});

  static const Color backgroundColor = Color(0xFFF9F9FF);
  static const Color primaryBlue = Color(0xFF0052FF);
  static const Color darkText = Color(0xFF141B2B);
  static const Color secondaryText = Color(0xFF434656);
  static const Color borderColor = Color(0xFFC3C5D9);
  static const Color iconBackground = Color(0xFFF1F3FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _MerchantHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 110),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _PageHeader(),

                      const SizedBox(height: 32),

                      const _BankTransferCard(),

                      const SizedBox(height: 16),

                      _PaymentMethodCard(
                        icon: Icons.qr_code_2_rounded,
                        title: 'Dynamic QR',
                        description:
                        'Generate a unique code for a specific amount.',
                      ),

                      const SizedBox(height: 16),

                      _PaymentMethodCard(
                        icon: Icons.link_rounded,
                        title: 'Payment Link',
                        description:
                        'Create a secure URL to send via SMS, email or chat.',
                      ),

                      const SizedBox(height: 16),

                      _PaymentMethodCard(
                        icon: Icons.dialpad_rounded,
                        title: 'USSD Code',
                        description:
                        'Best for customers without smartphones or data.',
                      ),

                      const SizedBox(height: 16),

                      _PaymentMethodCard(
                        icon: Icons.point_of_sale_rounded,
                        title: 'POS Terminal',
                        description:
                        'Collect in-person card payments via hardware.',
                      ),

                      const SizedBox(height: 32),

                      const _TrustIndicators(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}

// -----------------------------------------------------------------------------
// HEADER
// -----------------------------------------------------------------------------

class _MerchantHeader extends StatelessWidget {
  const _MerchantHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: ReceivePaymentScreen.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ReceivePaymentScreen.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ReceivePaymentScreen. primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.storefront_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              'MerchantHub',
              style: TextStyle(
                color: Color(0xFF003EC7),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.4,
              ),
            ),

            const Spacer(),

            IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: const Icon(
                Icons.visibility_outlined,
                size: 20,
                color: ReceivePaymentScreen.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PAGE HEADER
// -----------------------------------------------------------------------------

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receive Payment',
          style: TextStyle(
            color:  ReceivePaymentScreen.darkText,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.33,
            letterSpacing: -0.24,
          ),
        ),

        SizedBox(height: 4),

        Text(
          'Choose a method to accept money from your\ncustomers.',
          style: TextStyle(
            color:  ReceivePaymentScreen.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// BANK TRANSFER
// -----------------------------------------------------------------------------

class _BankTransferCard extends StatelessWidget {
  const _BankTransferCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 220,
      ),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:  ReceivePaymentScreen.primaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.account_balance_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5CFD80),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Recommended',
                      style: TextStyle(
                        color: Color(0xFF00732C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.33,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Bank Transfer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 2),

              const Text(
                'Instantly share your business account\n'
                    'details. The fastest way to get paid with\n'
                    'zero processing delays.',
                style: TextStyle(
                  color: Color(0xCCFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Share Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Decorative background shape.
          Positioned(
            right: -20,
            top: 35,
            child: Opacity(
              opacity: .10,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 16,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PAYMENT METHOD CARD
// -----------------------------------------------------------------------------

class _PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _PaymentMethodCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 214),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ReceivePaymentScreen. borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color:ReceivePaymentScreen. iconBackground,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              color: ReceivePaymentScreen.primaryBlue,
              size: 21,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: ReceivePaymentScreen.darkText,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.14,
              letterSpacing: .14,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            description,
            style: const TextStyle(
              color: ReceivePaymentScreen.secondaryText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.43,
            ),
          ),

          const SizedBox(height: 16),

          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.chevron_right_rounded,
              color: ReceivePaymentScreen.secondaryText,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TRUST INDICATORS
// -----------------------------------------------------------------------------

class _TrustIndicators extends StatelessWidget {
  const _TrustIndicators();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 32),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ReceivePaymentScreen.borderColor,
            width: 1,
          ),
        ),
      ),
      child: const Column(
        children: [
          _TrustItem(
            icon: Icons.verified_user_outlined,
            title: 'Secure Encryption',
            description:
            'All transactions are PCI-DSS Level 1 compliant.',
          ),

          SizedBox(height: 24),

          _TrustItem(
            icon: Icons.bolt_rounded,
            title: 'Instant Notification',
            description:
            'Get push alerts the second a payment hits your account.',
          ),

          SizedBox(height: 24),

          _TrustItem(
            icon: Icons.support_agent_rounded,
            title: '24/7 Merchant Support',
            description:
            'Speak to a specialist anytime for payment issues.',
          ),
        ],
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TrustItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          child: Icon(
            icon,
            color:ReceivePaymentScreen. primaryBlue,
            size: 18,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ReceivePaymentScreen.darkText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.14,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                description,
                style: const TextStyle(
                  color: ReceivePaymentScreen.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
