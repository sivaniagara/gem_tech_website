import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_design.dart';

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
  static const _kIrrigation = 'Smart Farming Irrigation';
  static const _kTank = 'Water Level / Tank Automation';
  static const _kFertigation = 'Fertigation & Precision Dosing';
  static const _kSensors = 'Sensors & Microclimate';

  String _selectedApplication = _kIrrigation;
  String _selectedScale = 'Medium Farm (5-25 Acres)';
  String _selectedPower = '3-Phase 440V AC';

  final List<String> _applications = [_kIrrigation, _kTank, _kFertigation, _kSensors];

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

  // Recommendation engine logic (unchanged)
  Map<String, dynamic> _getRecommendation() {
    if (_selectedApplication == _kTank) {
      if (_selectedPower == 'Single Phase 230V') {
        return {
          'title': 'NIAGARA WLC-1P-7S',
          'category': 'Water Level Controller',
          'description': 'Digital 7-segment single-phase water level controller with dry-run and high/low voltage cut-off protection.',
          'badge': 'Best for residential and small sump/tank',
          'savings': 'Up to 35% electricity savings and zero water overflow',
          'icon': Icons.water_drop_rounded,
          'color': AppColors.accentBlueDeep,
          'navTarget': 'Smart Water',
        };
      } else {
        return {
          'title': 'NIAGARA AWPC 3-Phase LCD GSM',
          'category': 'Industrial Water Controller',
          'description': '3-phase smart pump controller featuring LCD screen, single-phasing preventer, current sensing dry-run, and GSM mobile triggers.',
          'badge': 'Best for commercial and high-power pumps',
          'savings': 'Full motor protection with remote mobile control',
          'icon': Icons.phonelink_ring_rounded,
          'color': AppColors.accentBlueDeep,
          'navTarget': 'Smart Water',
        };
      }
    } else if (_selectedApplication == _kFertigation) {
      return {
        'title': 'NutriFlow™ 400 Fertigation System',
        'category': 'Automated Dosing Machine',
        'description': 'Precision EC/pH-guided proportional fertigation skid supporting up to 6 fertilizer channels and high-pressure bypass dosing.',
        'badge': 'Best for hydroponics and commercial agriculture',
        'savings': '30% lower fertilizer cost and 25% higher yield',
        'icon': Icons.science_rounded,
        'color': AppColors.accentTealDeep,
        'navTarget': 'Fertigation',
      };
    } else if (_selectedApplication == _kSensors) {
      return {
        'title': 'ORO Precision Sensor Suite',
        'category': 'Field Data Acquisition',
        'description': 'Granular soil moisture matrix, 4-20mA pressure transmitters, optical level sensors, and industrial 4-ceramic junction pH/EC probes.',
        'badge': 'Best for data-driven microclimate monitoring',
        'savings': 'Optimal root-zone hydration with accurate monitoring',
        'icon': Icons.sensors_rounded,
        'color': AppColors.accentAmber,
        'navTarget': 'Sensors',
      };
    } else {
      if (_selectedScale == 'Small Farm (< 5 Acres)') {
        return {
          'title': 'ORO SHINE Controller',
          'category': '4-Valve Zone Automation',
          'description': 'Compact 4-valve solenoid controller + 1 motor pump trigger with RTC real-time clock scheduling and mobile Bluetooth control.',
          'badge': 'Best for small farms and greenhouses',
          'savings': 'No manual valve switching, up to 40% less labor',
          'icon': Icons.memory_rounded,
          'color': AppColors.accentBlueDeep,
          'navTarget': 'Controllers',
        };
      } else if (_selectedScale == 'Medium Farm (5-25 Acres)') {
        return {
          'title': 'ORO ELITE Controller',
          'category': '10-Valve Commercial Controller',
          'description': 'Heavy-duty 10-valve wired controller + pump protection suite with GSM cloud dashboard and cycle-timer irrigation options.',
          'badge': 'Best for medium-scale commercial orchards',
          'savings': '45% less water waste and more uniform crops',
          'icon': Icons.memory_rounded,
          'color': AppColors.accentTealDeep,
          'navTarget': 'Controllers',
        };
      } else {
        return {
          'title': 'ORO GEM+ (RL) Enterprise Master',
          'category': 'Hybrid RS485 + 2 km LoRa RF Master',
          'description': 'Multi-node enterprise master controller driving hundreds of wireless field valves, fertigation skids, and weather stations over 2 km LoRa RF.',
          'badge': 'Best for large agri-estates and corporate farms',
          'savings': 'Fully autonomous irrigation with zero cable cost',
          'icon': Icons.hub_rounded,
          'color': AppColors.accentViolet,
          'navTarget': 'ORO GEM OS',
        };
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppLayout.isDesktop(context);
    final rec = _getRecommendation();

    return AppSection(
      color: AppColors.surfaceDark,
      child: Column(
        children: [
          const SectionHeader(
            eyebrow: 'System finder',
            eyebrowIcon: Icons.tune_rounded,
            title: 'Find the right automation setup for your farm',
            subtitle:
            'Answer three questions to see the recommended product, its key capabilities, and the impact you can expect.',
            onDark: true,
          ),
          SizedBox(height: isDesktop ? 56 : 36),
          isDesktop
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: _buildSelectionForm(isDesktop)),
              const SizedBox(width: 32),
              Expanded(
                flex: 5,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: KeyedSubtree(
                    key: ValueKey(rec['title']),
                    child: _buildRecommendationCard(rec, isDesktop),
                  ),
                ),
              ),
            ],
          )
              : Column(
            children: [
              _buildSelectionForm(isDesktop),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: KeyedSubtree(
                  key: ValueKey(rec['title']),
                  child: _buildRecommendationCard(rec, isDesktop),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Left: three-step form ──────────────────────────────────
  Widget _buildSelectionForm(bool isDesktop) {
    return SurfaceCard(
      onDark: true,
      radius: AppRadius.xl,
      padding: EdgeInsets.all(isDesktop ? 32 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepHeader(1, 'What do you want to automate?'),
          const SizedBox(height: 14),
          _buildChoiceChips(_applications, _selectedApplication, (val) {
            setState(() => _selectedApplication = val);
          }),
          _divider(),
          _buildStepHeader(2, 'How large is your land?', hint: 'Used to size irrigation controllers'),
          const SizedBox(height: 14),
          _buildChoiceChips(_scales, _selectedScale, (val) {
            setState(() => _selectedScale = val);
          }),
          _divider(),
          _buildStepHeader(3, 'What is your power supply?', hint: 'Used to match water level controllers'),
          const SizedBox(height: 14),
          _buildChoiceChips(_powers, _selectedPower, (val) {
            setState(() => _selectedPower = val);
          }),
        ],
      ),
    );
  }

  Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 24),
    child: Divider(height: 1, thickness: 1, color: AppColors.hairlineOnDark),
  );

  // Steps are a real sequence, so numbering is meaningful here.
  Widget _buildStepHeader(int step, String title, {String? hint}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.14),
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: AppColors.primaryTeal.withOpacity(0.4)),
          ),
          child: Text(
            '$step',
            style: AppTextStyles.label(color: AppColors.primaryTeal),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.cardTitle(color: Colors.white).copyWith(fontSize: 16),
              ),
              if (hint != null) ...[
                const SizedBox(height: 2),
                Text(
                  hint,
                  style: AppTextStyles.cardDescription(color: AppColors.textOnDarkMuted).copyWith(fontSize: 12.5),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChoiceChips(
      List<String> options,
      String currentValue,
      Function(String) onSelected,
      ) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((opt) {
        final isSelected = opt == currentValue;
        return Semantics(
          button: true,
          selected: isSelected,
          label: opt,
          child: InkWell(
            onTap: () => onSelected(opt),
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryTeal : Colors.transparent,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(
                  color: isSelected ? AppColors.primaryTeal : AppColors.hairlineOnDark,
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected) ...[
                    const Icon(Icons.check_rounded, size: 16, color: AppColors.textDark),
                    const SizedBox(width: 6),
                  ],
                  Flexible(
                    child: Text(
                      opt,
                      style: AppTextStyles.badgeText(
                        color: isSelected ? AppColors.textDark : AppColors.textLight,
                      ).copyWith(fontSize: 13.5, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Right: recommendation (light card on dark for contrast) ─
  Widget _buildRecommendationCard(Map<String, dynamic> rec, bool isDesktop) {
    final color = rec['color'] as Color;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 32 : 22),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended for you', style: AppTextStyles.label()),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTile(rec['icon'] as IconData, color: color, size: 52),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rec['title'] as String,
                      style: AppTextStyles.cardTitle().copyWith(fontSize: 21),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rec['category'] as String,
                      style: AppTextStyles.cardDescription(color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Text(
              rec['badge'] as String,
              style: AppTextStyles.badgeText(color: color).copyWith(fontSize: 12.5),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            rec['description'] as String,
            style: AppTextStyles.cardDescription(color: AppColors.textMedium).copyWith(fontSize: 14.5, height: 1.65),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.successSoft,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.success.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.trending_up_rounded, color: AppColors.success, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estimated impact', style: AppTextStyles.label(color: AppColors.success)),
                      const SizedBox(height: 3),
                      Text(
                        rec['savings'] as String,
                        style: AppTextStyles.cardDescription(color: AppColors.textDark)
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            'View product details',
            color: color,
            trailingIcon: Icons.arrow_forward_rounded,
            expand: true,
            onPressed: () => widget.onSelectProductCategory?.call(rec['navTarget'] as String),
          ),
        ],
      ),
    );
  }
}