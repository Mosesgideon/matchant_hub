import 'package:flutter/material.dart';

class BusinessInformationScreen extends StatefulWidget {
  const BusinessInformationScreen({super.key});

  @override
  State<BusinessInformationScreen> createState() =>
      _BusinessInformationScreenState();
}

class _BusinessInformationScreenState
    extends State<BusinessInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController businessNameController =
  TextEditingController();

  final TextEditingController cacController =
  TextEditingController();

  final TextEditingController taxIdController =
  TextEditingController();

  String? selectedBusinessType;

  final List<String> businessTypes = [
    'Sole Proprietorship',
    'Partnership',
    'Limited Liability Company',
    'Public Limited Company',
    'Other',
  ];

  @override
  void dispose() {
    businessNameController.dispose();
    cacController.dispose();
    taxIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
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
                  128,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 640,
                    ),
                    child: Column(
                      children: [
                        _buildProgressIndicator(),

                        const SizedBox(height: 48),

                        _buildFormCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // TOP BAR
  // ----------------------------------------------------------

  Widget _buildTopBar() {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9FF),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFC3C5D9),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'MerchantHub',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                height: 28 / 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF003EC7),
              ),
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 38,
                    minHeight: 38,
                  ),
                  icon: const Icon(
                    Icons.visibility_outlined,
                    size: 22,
                    color: Color(0xFF003EC7),
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1E8FD),
                    border: Border.all(
                      color: const Color(0xFFC3C5D9),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.network(
                      'https://www.figma.com/api/mcp/asset/270c40bf-cff0-4023-b53b-e575b66d8475.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return const Icon(
                          Icons.person,
                          size: 20,
                          color: Color(0xFF003EC7),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // PROGRESS
  // ----------------------------------------------------------

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'STEP 1 OF 4',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                height: 16 / 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.7,
                color: Color(0xFF003EC7),
              ),
            ),
            Text(
              'Business Profile',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                height: 16 / 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.14,
                color: Color(0xFF434656),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            _progressBar(active: true),
            const SizedBox(width: 8),
            _progressBar(),
            const SizedBox(width: 8),
            _progressBar(),
            const SizedBox(width: 8),
            _progressBar(),
          ],
        ),
      ],
    );
  }

  Widget _progressBar({
    bool active = false,
  }) {
    return Expanded(
      child: Container(
        height: 6,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFF003EC7)
              : const Color(0xFFDCE2F7),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // FORM CARD
  // ----------------------------------------------------------

  Widget _buildFormCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(33),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFC3C5D9),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const SizedBox(height: 40),

            _buildBusinessNameField(),

            const SizedBox(height: 32),

            _buildBusinessTypeField(),

            const SizedBox(height: 32),

            _buildCACField(),

            const SizedBox(height: 24),

            _buildTaxIdField(),

            const SizedBox(height: 24),

            _buildInformationBox(),

            const SizedBox(height: 24),

            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // HEADER
  // ----------------------------------------------------------

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Register your business',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            height: 32 / 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.24,
            color: Color(0xFF141B2B),
          ),
        ),

        SizedBox(height: 8),

        Text(
          'Provide your official business details\n'
              'to begin the onboarding process. This\n'
              'information will be used for\n'
              'verification.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            height: 24 / 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF434656),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // BUSINESS NAME
  // ----------------------------------------------------------

  Widget _buildBusinessNameField() {
    return _buildTextField(
      label: 'Business Name',
      hint: 'Enter legal business name',
      controller: businessNameController,
    );
  }

  // ----------------------------------------------------------
  // BUSINESS TYPE
  // ----------------------------------------------------------

  Widget _buildBusinessTypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            'Business Type',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF434656),
            ),
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: selectedBusinessType,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF737688),
            size: 24,
          ),
          decoration: InputDecoration(
            hintText: 'Select business type',
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              height: 24 / 16,
              color: Color(0xFF141B2B),
            ),
            filled: true,
            fillColor: const Color(0xFFF9F9FF),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFF003EC7),
                width: 1.5,
              ),
            ),
          ),
          items: businessTypes.map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(
                type,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0xFF141B2B),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedBusinessType = value;
            });
          },
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // CAC
  // ----------------------------------------------------------

  Widget _buildCACField() {
    return _buildTextField(
      label: 'CAC Number',
      hint: 'RC1234567',
      controller: cacController,
    );
  }

  // ----------------------------------------------------------
  // TAX ID
  // ----------------------------------------------------------

  Widget _buildTaxIdField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                'Tax ID',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF434656),
                ),
              ),
            ),
            Text(
              'Optional',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF737688),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: taxIdController,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFF141B2B),
          ),
          decoration: InputDecoration(
            hintText: 'TIN-00000000',
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Color(0xFF737688),
            ),
            filled: true,
            fillColor: const Color(0xFFF9F9FF),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFF003EC7),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // GENERIC TEXT FIELD
  // ----------------------------------------------------------

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF434656),
            ),
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFF141B2B),
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Color(0xFF737688),
            ),
            filled: true,
            fillColor: const Color(0xFFF9F9FF),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFFC3C5D9),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xFF003EC7),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // INFORMATION BOX
  // ----------------------------------------------------------

  Widget _buildInformationBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FF),
        border: Border.all(
          color: const Color(0xFFDCE2F7),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(
              Icons.info_outline,
              size: 20,
              color: Color(0xFF003EC7),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              'Ensure the business name\n'
                  'matches exactly what is on your\n'
                  'registration documents.\n'
                  'Verification typically takes 24-\n'
                  '48 business hours.',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                height: 22.75 / 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF434656),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // BUTTONS
  // ----------------------------------------------------------

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _handleContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003EC7),
              foregroundColor: Colors.white,
              elevation: 1,
              shadowColor: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.14,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: _handleSaveProgress,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF003EC7),
              side: const BorderSide(
                color: Color(0xFF003EC7),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'Save Progress',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                height: 16 / 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // ACTIONS
  // ----------------------------------------------------------

  void _handleContinue() {
    if (businessNameController.text.trim().isEmpty) {
      _showMessage('Please enter your business name.');
      return;
    }

    if (selectedBusinessType == null) {
      _showMessage('Please select your business type.');
      return;
    }

    if (cacController.text.trim().isEmpty) {
      _showMessage('Please enter your CAC number.');
      return;
    }

    // TODO:
    // Navigate to Step 2.
  }

  void _handleSaveProgress() {
    // TODO:
    // Persist form data locally/API.
    _showMessage('Progress saved.');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}