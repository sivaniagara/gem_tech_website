import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProductSelectorSection extends StatefulWidget {
  final Function(String)? onSelectProductCategory;

  const ProductSelectorSection({
    super.key,
    this.onSelectProductCategory,
  });

  @override
  State<ProductSelectorSection> createState() => _ProductSelectorSectionState();
}

class _ProductSelectorSectionState extends State<ProductSelectorSection> {
  // Wizard State
  String _selectedApplication = 'Smart Farming Irrigation';
  String _selectedScale = 'Medium Farm (5-25 Acres)';
  String _selectedPower = '3-Phase 440V AC';

  final List<String> _applications = [
    'Smart Farming Irrigation',
    'Water Level / Tank Automation',
    'Fertigation & Precision Dosing',
    'Sensors & Microclimate',
  ];

  final List<String> _scales = [
    'Small Farm (< 5 Acres)',
    'Medium Farm (5-25 Acres)',
    'Large Estate (> 25 Acres)',
  ];

  final List<String> _powers = [
    'Single Phase 230V',
    '3-Phase 440V AC',
    'Solar / Wireless LoRa RF',
  ];

  // Recommendation engine logic
  Map<String, dynamic> _getRecommendation() {
    if (_selectedApplication == 'Water Level / Tank Automation') {
      if (_selectedPower == 'Single Phase 230V') {
        return {
          'title': 'NIAGARA WLC-1P-7S',
          'category': 'Water Level Controller',
          'description': 'Digital 7-segment single-phase water level controller with dry-run and high/low voltage cut-off protection.',
          'badge': 'Best for Residential & Small Sump/Tank',
          'savings': 'Up to 35% Electricity & Zero Water Overflow',
          'icon': Icons.water_drop_rounded,
          'color': const Color(0xFF0A9AAE),
          'navTarget': 'Smart Water',
        };
      } else {
        return {
          'title': 'NIAGARA AWPC 3-Phase LCD GSM',
          'category': 'Industrial Water Controller',
          'description': '3-phase smart pump controller featuring LCD screen, single-phasing preventer, current sensing dry-run, and GSM mobile triggers.',
          'badge': 'Commercial & High Power Pumps',
          'savings': '100% Motor Protection & Remote Mobile Control',
          'icon': Icons.phonelink_ring_rounded,
          'color': const Color(0xFF0284C7),
          'navTarget': 'Smart Water',
        };
      }
    } else if (_selectedApplication == 'Fertigation & Precision Dosing') {
      return {
        'title': 'NutriFlow™ 400 Fertigation System',
        'category': 'Automated Dosing Machine',
        'description': 'Precision EC/pH-guided proportional fertigation skid supporting up to 6 fertilizer channels and high-pressure bypass dosing.',
        'badge': 'High-Yield Hydroponics & Commercial Agriculture',
        'savings': '30% Fertilizer Cost Reduction & 25% Higher Yield',
        'icon': Icons.science_rounded,
        'color': AppColors.emeraldTeal,
        'navTarget': 'Fertigation',
      };
    } else if (_selectedApplication == 'Sensors & Microclimate') {
      return {
        'title': 'ORO Precision Sensor Suite',
        'category': 'Field Data Acquisition',
        'description': 'Granular soil moisture matrix, 4-20mA pressure transmitters, optical level sensors, and industrial 4-ceramic junction pH/EC probes.',
        'badge': 'Data-Driven Microclimate Intelligence',
        'savings': 'Optimal Root-Zone Hydration & Accurate Monitoring',
        'icon': Icons.sensors_rounded,
        'color': const Color(0xFFFF9F43),
        'navTarget': 'Sensors',
      };
    } else {
      // Smart Farming Irrigation
      if (_selectedScale == 'Small Farm (< 5 Acres)') {
        return {
          'title': 'ORO SHINE Controller',
          'category': '4-Valve Zone Automation',
          'description': 'Compact 4-valve solenoid controller + 1 motor pump trigger with RTC real-time clock scheduling and mobile Bluetooth control.',
          'badge': 'Small Farms & Greenhouses',
          'savings': 'Eliminates Manual Valve Switching & Saves 40% Labor',
          'icon': Icons.memory_rounded,
          'color': const Color(0xFF0284C7),
          'navTarget': 'Controllers',
        };
      } else if (_selectedScale == 'Medium Farm (5-25 Acres)') {
        return {
          'title': 'ORO ELITE Controller',
          'category': '10-Valve Commercial Controller',
          'description': 'Heavy-duty 10-valve wired controller + pump protection suite with GSM cloud dashboard and cycle-timer irrigation options.',
          'badge': 'Medium Scale Commercial Orchards',
          'savings': 'Reduces Water Waste by 45% & Maximizes Crop Uniformity',
          'icon': Icons.memory_rounded,
          'color': const Color(0xFF0F766E),
          'navTarget': 'Controllers',
        };
      } else {
        return {
          'title': 'ORO GEM+ (RL) Enterprise Master',
          'category': 'Hybrid RS485 + 2 km LoRa RF Master',
          'description': 'Multi-node enterprise master controller driving hundreds of wireless field valves, fertigation skids, and weather stations over 2 km LoRa RF.',
          'badge': 'Large Scale Agri-Estates & Corporate Farms',
          'savings': 'Fully Autonomous Irrigation with Zero Cable Cost',
          'icon': Icons.hub_rounded,
          'color': const Color(0xFF7C3AED),
          'navTarget': 'ORO GEM OS',
        };
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    final rec = _getRecommendation();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0B192C),
            Color(0xFF1E2A38),
            Color(0xFF0F2027),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryTeal.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primaryTeal.withOpacity(0.4)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome_rounded, color: AppColors.primaryTeal, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'INTERACTIVE SYSTEM FINDER & ROI CALCULATOR',
                      style: TextStyle(
                        color: AppColors.primaryTeal,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Find the Perfect Automation Setup for Your Farm',
                textAlign: TextAlign.center,
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white)
                    .copyWith(fontSize: isDesktop ? 36 : 24),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  'Select your requirements below to instantly receive tailored product recommendations, capacity specs, and estimated water/labor savings.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cardDescription(color: Colors.white70)
                      .copyWith(fontSize: isDesktop ? 15 : 14, height: 1.6),
                ),
              ),
              const SizedBox(height: 48),

              // Layout: Left Selection Controls, Right Recommended Result Card
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 6, child: _buildSelectionForm(isDesktop)),
                        const SizedBox(width: 40),
                        Expanded(flex: 5, child: _buildRecommendationCard(rec, isDesktop)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildSelectionForm(isDesktop),
                        const SizedBox(height: 32),
                        _buildRecommendationCard(rec, isDesktop),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionForm(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 28 : 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepHeader('Step 1', 'Primary Application / Goal'),
          const SizedBox(height: 12),
          _buildChoiceChips(_applications, _selectedApplication, (val) {
            setState(() => _selectedApplication = val);
          }, isDesktop),
          const SizedBox(height: 24),

          _buildStepHeader('Step 2', 'Land Area / Operating Scale'),
          const SizedBox(height: 12),
          _buildChoiceChips(_scales, _selectedScale, (val) {
            setState(() => _selectedScale = val);
          }, isDesktop),
          const SizedBox(height: 24),

          _buildStepHeader('Step 3', 'Power Supply & Connectivity'),
          const SizedBox(height: 12),
          _buildChoiceChips(_powers, _selectedPower, (val) {
            setState(() => _selectedPower = val);
          }, isDesktop),
        ],
      ),
    );
  }

  Widget _buildStepHeader(String step, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            step,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChoiceChips(
    List<String> options,
    String currentValue,
    Function(String) onSelected,
    bool isDesktop,
  ) {
    return Wrap(
      spacing: isDesktop ? 10 : 8,
      runSpacing: isDesktop ? 10 : 8,
      children: options.map((opt) {
        final isSelected = opt == currentValue;
        return InkWell(
          onTap: () => onSelected(opt),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 16 : 12,
              vertical: isDesktop ? 10 : 8,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryTeal : Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primaryTeal : Colors.white.withOpacity(0.15),
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primaryTeal.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              opt,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: isDesktop ? 13 : 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecommendationCard(Map<String, dynamic> rec, bool isDesktop) {
    final color = rec['color'] as Color;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(isDesktop ? 32 : 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: color.withOpacity(0.6), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withOpacity(0.4)),
                ),
                child: Icon(rec['icon'] as IconData, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RECOMMENDED SYSTEM',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rec['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.4)),
            ),
            child: Text(
              rec['badge'] as String,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12.5,
              ),
            ),
          ),
          const SizedBox(height: 18),

          Text(
            rec['description'] as String,
            style: const TextStyle(
              color: Color(0xFFCBD5E1),
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),

          // Savings Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF064E3B).withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF10B981).withOpacity(0.4)),
            ),
            child: Row(
              children: [
                const Icon(Icons.trending_up_rounded, color: Color(0xFF34D399), size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ESTIMATED IMPACT',
                        style: TextStyle(
                          color: Color(0xFF34D399),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        rec['savings'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                widget.onSelectProductCategory?.call(rec['navTarget'] as String);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                shadowColor: color.withOpacity(0.5),
              ),
              icon: const Icon(Icons.arrow_forward_rounded, size: 20),
              label: const Text(
                'Explore Product Details',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
