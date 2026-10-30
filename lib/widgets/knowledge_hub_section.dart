import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class KnowledgeHubSection extends StatelessWidget {
  const KnowledgeHubSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 70,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            'Your Farming Knowledge Hub',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
          ),
          const SizedBox(height: 50),

          // Content Row / Column
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left: Graphic Image
              Expanded(
                flex: isDesktop ? 5 : 0,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(15),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/img_p1_24.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/img_p1_3.png', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),

              if (isDesktop) const SizedBox(width: 50) else const SizedBox(height: 40),

              // Right: Intelligence Pillars
              Expanded(
                flex: isDesktop ? 6 : 0,
                child: Column(
                  children: const [
                    _FeatureTile(
                      icon: Icons.sensors_rounded,
                      iconBg: Color(0xFF00ADFF),
                      title: 'Soil & Environmental Intelligence:',
                      description:
                          'Real-time tracking of soil moisture, EC, pH, CO₂, temperature, and rainfall to calculate exact water needs.',
                    ),
                    SizedBox(height: 24),
                    _FeatureTile(
                      icon: Icons.water_drop_rounded,
                      iconBg: Color(0xFF36C5BC),
                      title: 'Automated Fertigation Management:',
                      description:
                          'Precise dosing modes (Continuous, Volume, Proportional) supporting up to 8 fertilizer channels per site.',
                    ),
                    SizedBox(height: 24),
                    _FeatureTile(
                      icon: Icons.verified_user_rounded,
                      iconBg: Color(0xFF006670),
                      title: 'Hydraulic Safety & Pressure Control:',
                      description:
                          'Continuous monitoring via electromagnetic flow meters and quick pressure relief valves to safeguard field infrastructure.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String description;

  const _FeatureTile({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBg.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconBg, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textMedium,
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
