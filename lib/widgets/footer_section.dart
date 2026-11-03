import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FooterSection extends StatelessWidget {
  final Function(String)? onNavSelected;
  final VoidCallback? onDownloadApp;

  const FooterSection({
    super.key,
    this.onNavSelected,
    this.onDownloadApp,
  });

  void _showDealerInquiryDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final companyController = TextEditingController();
    final cityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Row(
          children: [
            Icon(Icons.handshake_rounded, color: AppColors.primaryTeal, size: 28),
            SizedBox(width: 12),
            Text('Become a Dealer / Partner'),
          ],
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Partner with ORO GEM Automation to distribute smart farm controllers, valves, and fertigation units in your region.',
                    style: TextStyle(fontSize: 13.5, color: AppColors.textMedium, height: 1.4),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name / Contact Person',
                      prefixIcon: const Icon(Icons.person_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    validator: (v) => (v == null || v.isEmpty) ? 'Please enter your name' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone / WhatsApp Number',
                      prefixIcon: const Icon(Icons.phone_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    validator: (v) => (v == null || v.isEmpty) ? 'Please enter your phone number' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: companyController,
                    decoration: InputDecoration(
                      labelText: 'Company / Business Name',
                      prefixIcon: const Icon(Icons.business_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'City / Region of Operation',
                      prefixIcon: const Icon(Icons.location_city_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Thank you! Our dealership team will contact you shortly.'),
                    backgroundColor: AppColors.primaryTeal,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryTeal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Submit Inquiry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Container(
      width: double.infinity,
      color: AppColors.bgDarkSlate,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 70 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            children: [
              // Top Grid
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: _buildBrandCol(context)),
                        const SizedBox(width: 40),
                        Expanded(flex: 2, child: _buildQuickNavCol()),
                        const SizedBox(width: 30),
                        Expanded(flex: 3, child: _buildProductsCol()),
                        const SizedBox(width: 30),
                        Expanded(flex: 3, child: _buildContactCol(context)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandCol(context),
                        const SizedBox(height: 32),
                        Wrap(
                          spacing: 40,
                          runSpacing: 28,
                          children: [
                            _buildQuickNavCol(),
                            _buildProductsCol(),
                          ],
                        ),
                        const SizedBox(height: 32),
                        _buildContactCol(context),
                      ],
                    ),

              const SizedBox(height: 50),
              Container(height: 1, color: Colors.white.withOpacity(0.1)),
              const SizedBox(height: 30),

              // Bottom Bar: Certifications & Copyright
              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCertificationsRow(),
                        _buildCopyrightText(),
                      ],
                    )
                  : Column(
                      children: [
                        _buildCertificationsRow(),
                        const SizedBox(height: 20),
                        _buildCopyrightText(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandCol(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.eco_rounded, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 10),
            const Text(
              'ORO GEM TECH',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Text(
          'Pioneering next-generation smart farm controllers, fertigation systems, hydraulic control valves, and IoT precision sensors for global agricultural sustainability.',
          style: TextStyle(
            fontSize: 13.5,
            color: Colors.white70,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => _showDealerInquiryDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTeal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          icon: const Icon(Icons.handshake_rounded, size: 18),
          label: const Text('Become a Dealer / Partner'),
        ),
      ],
    );
  }

  Widget _buildQuickNavCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'QUICK LINKS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryTeal,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 14),
        _footerLink('Home', () => onNavSelected?.call('Home')),
        _footerLink('ORO GEM OS', () => onNavSelected?.call('ORO GEM OS')),
        _footerLink('Smart Water', () => onNavSelected?.call('Smart Water')),
        _footerLink('Fertigation', () => onNavSelected?.call('Fertigation')),
        _footerLink('Controllers', () => onNavSelected?.call('Controllers')),
        _footerLink('Sensors', () => onNavSelected?.call('Sensors')),
        _footerLink('Valves', () => onNavSelected?.call('Valves')),
      ],
    );
  }

  Widget _buildProductsCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOLUTIONS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryTeal,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 14),
        _footerText('ORO SHINE / ELITE / NOVA'),
        _footerText('NutriFlow™ 400 Fertigation'),
        _footerText('NIAGARA AWLC Water Controllers'),
        _footerText('100 / 200 / 300 Series Valves'),
        _footerText('Soil & Water Quality Sensors'),
        _footerText('2 km LoRa RF Automation'),
      ],
    );
  }

  Widget _buildContactCol(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CONTACT & SUPPORT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryTeal,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 14),
        _iconDetail(Icons.phone_rounded, '+91 73737 05677'),
        _iconDetail(Icons.email_rounded, 'info@niagaraautomation.com'),
        _iconDetail(Icons.language_rounded, 'www.niagaraautomation.com'),
        _iconDetail(Icons.location_on_rounded, 'Coimbatore, Tamil Nadu, India'),
        const SizedBox(height: 12),
        InkWell(
          onTap: onDownloadApp,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.get_app_rounded, color: AppColors.primaryTeal, size: 18),
                SizedBox(width: 8),
                Text(
                  'Download Mobile App',
                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerLink(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(fontSize: 13.5, color: Colors.white70),
        ),
      ),
    );
  }

  Widget _footerText(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13.5, color: Colors.white60),
      ),
    );
  }

  Widget _iconDetail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryTeal, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsRow() {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: const [
        _CertBadge(label: 'ISO 9001:2015 Certified'),
        _CertBadge(label: 'CE Compliant'),
        _CertBadge(label: 'IP67 Waterproof'),
        _CertBadge(label: 'Made in India'),
      ],
    );
  }

  Widget _buildCopyrightText() {
    return const Text(
      '© 2026 ORO GEM Tech / Niagara Automation. All Rights Reserved.',
      style: TextStyle(fontSize: 12.5, color: Colors.white54),
    );
  }
}

class _CertBadge extends StatelessWidget {
  final String label;
  const _CertBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.verified_user_rounded, color: AppColors.primaryTeal, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 11.5, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
