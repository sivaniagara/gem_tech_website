import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FarmArchitectureSection extends StatelessWidget {
  const FarmArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1B232A),
            Color(0xFF0F172A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 70,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryTeal.withAlpha(30),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Build for Smarter Farming',
              style: TextStyle(
                color: AppColors.primaryTeal,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your Entire Farm, Connected',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(
              isDesktop: isDesktop,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete Integration from Cloud to Soil',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionSubtitle(
              isDesktop: isDesktop,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 50),

          // Layer Stack Cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: const [
                _ArchitectureLayerCard(
                  stepNum: '01',
                  layerName: 'Cloud / App Layer',
                  badgeColor: Color(0xFF00ADFF),
                  items: 'ORO GEM Workplace, API, Mobile App, Web Interface',
                  icon: Icons.cloud_done_rounded,
                ),
                SizedBox(height: 20),
                _ArchitectureLayerCard(
                  stepNum: '02',
                  layerName: 'Master Controller Layer',
                  badgeColor: Color(0xFF36C5BC),
                  items: 'ORO GEM+ Master Devices',
                  icon: Icons.memory_rounded,
                ),
                SizedBox(height: 20),
                _ArchitectureLayerCard(
                  stepNum: '03',
                  layerName: 'Field Node Layer (Slave Devices)',
                  badgeColor: Color(0xFFFFB800),
                  items: 'oroSMART+, oroRTU+, oroSENSE+, oroLEVEL+',
                  icon: Icons.hub_rounded,
                ),
                SizedBox(height: 20),
                _ArchitectureLayerCard(
                  stepNum: '04',
                  layerName: 'Field Execution Layer',
                  badgeColor: Color(0xFF00C3D9),
                  items:
                      'Pumps, Filters, Fertilizer Injectors, Flow Meters, Pressure Sensors, and Solenoid Valves',
                  icon: Icons.precision_manufacturing_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // See More Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: AppColors.primaryTeal, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'See More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArchitectureLayerCard extends StatelessWidget {
  final String stepNum;
  final String layerName;
  final Color badgeColor;
  final String items;
  final IconData icon;

  const _ArchitectureLayerCard({
    required this.stepNum,
    required this.layerName,
    required this.badgeColor,
    required this.items,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF232B34),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: badgeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: badgeColor, size: 30),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$stepNum. ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: badgeColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        layerName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  items,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.white70,
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
