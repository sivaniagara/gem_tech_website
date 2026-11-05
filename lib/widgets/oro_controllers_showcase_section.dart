import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_design.dart';

// ─────────────────────────────────────────────────────────────
//  ORO CONTROLLERS SERIES - ASSETS (rename your images to these in assets/images/)
//
//  1. oro_shine.png       -> ORO SHINE product photo (4 Valves + 1 Pump)
//  2. oro_elite.png       -> ORO ELITE product photo (10 Valves + 1 Pump)
//  3. oro_nova.png        -> ORO NOVA product photo (16 Wired + 16 Wireless Valves + 2 Pumps)
//  4. oro_app_dashboard.png -> Mobile App & Web Dashboard screenshot
// ─────────────────────────────────────────────────────────────
const String _kOroShineImage = 'assets/images/oro_shine.png';
const String _kOroEliteImage = 'assets/images/oro_elite.png';
const String _kOroNovaImage = 'assets/images/oro_nova.png';
const String _kOroAppImage = 'assets/images/oro_app_dashboard.png';

class OroControllerModel {
  final String id;
  final String name;
  final String tagline;
  final String category;
  final String wiredValves;
  final String wirelessValves;
  final String pumpControl;
  final String fertigationSupport;
  final String filterFlush;
  final String imagePath;
  final Color brandColor;
  final List<String> modes;
  final List<String> highlights;
  final List<String> protections;

  const OroControllerModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.category,
    required this.wiredValves,
    required this.wirelessValves,
    required this.pumpControl,
    required this.fertigationSupport,
    required this.filterFlush,
    required this.imagePath,
    required this.brandColor,
    required this.modes,
    required this.highlights,
    required this.protections,
  });
}

const List<OroControllerModel> kOroControllers = [
  OroControllerModel(
    id: 'oro_shine',
    name: 'ORO SHINE',
    tagline: 'Time-Based Irrigation Automation (4 Solenoid Valves + 1 Pump)',
    category: 'Compact & Medium Farm Automation',
    wiredValves: '4 Solenoid Valves',
    wirelessValves: 'Not Supported',
    pumpControl: '1 Motor Pump',
    fertigationSupport: 'Optional Manual Dosing',
    filterFlush: 'Manual / Scheduled',
    imagePath: _kOroShineImage,
    brandColor: Color(0xFF0284C7), // Sky Blue
    modes: [
      'Real-Time Clock (RTC) Mode',
      'Timer-Based Valve Operation',
      'Manual Valve Control via App',
    ],
    highlights: [
      'Controls 4 solenoid valves for distinct irrigation zones',
      'Automatic Motor Pump startup & shutdown based on schedules',
      'Pressure sensor monitoring for optimized pump delivery',
      '24V AC solenoid coil output with power sensing capability',
      'GSM, Wi-Fi & Bluetooth optional connectivity for mobile app control',
    ],
    protections: [
      'Dry Run Protection (prevents motor running when dry)',
      'Overload Protection (guards motor against high current)',
      'High & Low Voltage Auto-Cut',
      'Phase Imbalance Voltage Protection',
      'Pressure Sensor Monitoring',
    ],
  ),
  OroControllerModel(
    id: 'oro_elite',
    name: 'ORO ELITE',
    tagline: 'Time-Based Irrigation Automation (10 Solenoid Valves + 1 Pump)',
    category: 'Commercial Multi-Zone Irrigation',
    wiredValves: '10 Solenoid Valves',
    wirelessValves: 'Not Supported',
    pumpControl: '1 Motor Pump',
    fertigationSupport: 'Compatible via Valve Assignment',
    filterFlush: 'Supported via Schedule',
    imagePath: _kOroEliteImage,
    brandColor: Color(0xFF0F766E), // Emerald Teal
    modes: [
      'Cycle Timer Mode',
      'Real-Time Clock (RTC) Mode',
      'Timer-Based Valve Operation',
      'Manual App & Web Control',
    ],
    highlights: [
      'Wired control for 10 individual solenoid valves (10+1 setup)',
      'Automatic motor pump control with onboard display interface',
      'Rugged design requiring minimal infrastructure for field deployment',
      '230V / 440V AC dual power supply input compatibility',
      'GSM, Wi-Fi & Bluetooth optional for cloud & web dashboard',
    ],
    protections: [
      'Dry Run Protection',
      'Overload Protection',
      'Low & High Voltage Protection',
      'Imbalance Voltage Protection',
      'Pressure Sensor Feedback',
    ],
  ),
  OroControllerModel(
    id: 'oro_nova',
    name: 'ORO NOVA',
    tagline: 'Timer & Flow-Based Irrigation Controller (16+16 Valves | 2 Pumps)',
    category: 'Flagship Precision Irrigation & Fertigation Skid',
    wiredValves: 'Up to 16 Wired Valves',
    wirelessValves: 'Up to 16 Wireless Valves (Optional Radio)',
    pumpControl: '2 Independent Motor Pumps',
    fertigationSupport: '1 Channel (Timer or Flow-Based)',
    filterFlush: '2 Dedicated Filter Backflush Valves',
    imagePath: _kOroNovaImage,
    brandColor: Color(0xFF7C3AED), // Royal Purple
    modes: [
      'Flow-Based Mode (Volumetric Liters/Gallons)',
      'Time-Based Mode (RTC Schedule)',
      'Cycle Timer Mode',
      'Single-Channel Fertigation Control',
    ],
    highlights: [
      'Supports up to 16 wired + 16 wireless valves via radio modules',
      'Dual pump control for multi-source water management',
      '2 dedicated valves for automated filter backflushing',
      'Single-channel precision fertigation dosing (ml per liter dosing)',
      'Flow-meter integrated volumetric precision for drip & greenhouse farming',
    ],
    protections: [
      'Dry Run Protection with Flow Rate Verification',
      'Overload Protection for Dual Pumps',
      'High & Low Voltage Auto Shutdown',
      '3-Phase Imbalance Voltage Protection',
      'Surge & Lightning Protection Compatibility',
    ],
  ),
];

class OroControllersShowcaseSection extends StatefulWidget {
  const OroControllersShowcaseSection({super.key});

  @override
  State<OroControllersShowcaseSection> createState() =>
      _OroControllersShowcaseSectionState();
}

class _OroControllersShowcaseSectionState
    extends State<OroControllersShowcaseSection> {
  int _selectedControllerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // 1. Top Hero Header Banner
          _buildHeroHeader(isDesktop),

          const SizedBox(height: 60),

          // Main Section Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60 : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Controller Selector (SHINE, ELITE, NOVA)
                _buildControllerSelector(isDesktop),

                const SizedBox(height: 60),

                // 3. Side-by-Side Comparison Matrix Table
                _buildComparisonTable(isDesktop),

                const SizedBox(height: 60),

                // 4. Operating Modes Grid
                _buildOperatingModesGrid(isDesktop),

                const SizedBox(height: 60),

                // 5. Motor Protections Suite
                _buildProtectionsGrid(isDesktop),

                const SizedBox(height: 60),

                // 6. Mobile & Web App Integration Banner
                _buildAppIntegrationBanner(isDesktop),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 1. HERO HEADER BANNER
  // ─────────────────────────────────────────────────────────────
  Widget _buildHeroHeader(bool isDesktop) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
            Color(0xFF0F2942),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Background grid lines accent
          Positioned.fill(
            child: Opacity(
              opacity: 0.04,
              child: CustomPaint(
                painter: _GridBackgroundPainter(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60 : 20,
              vertical: isDesktop ? 70 : 40,
            ),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0284C7).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                          border: Border.all(
                            color: const Color(0xFF0284C7).withValues(alpha: 0.5),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.memory_rounded,
                                size: 16, color: Color(0xFF38BDF8)),
                            SizedBox(width: 8),
                            Text(
                              'Smart irrigation controllers',
                              style: TextStyle(
                                color: Color(0xFF38BDF8),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'ORO Series Automation Controllers',
                        style: AppTextStyles.heroHeading(isDesktop: isDesktop)
                            .copyWith(
                          color: Colors.white,
                          height: 1.15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Text(
                          'From compact 4-valve farms to commercial 32-valve precision flow & fertigation skids. Built with industrial motor protection, RTC scheduling, and real-time app monitoring.',
                          style: TextStyle(
                            fontSize: isDesktop ? 16 : 14,
                            height: 1.6,
                            color: const Color(0xFF94A3B8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Series Badges
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: const [
                          _SeriesBadge(
                            title: 'ORO SHINE',
                            sub: '4 Valves + 1 Pump',
                            color: Color(0xFF0284C7),
                          ),
                          _SeriesBadge(
                            title: 'ORO ELITE',
                            sub: '10 Valves + 1 Pump',
                            color: Color(0xFF0F766E),
                          ),
                          _SeriesBadge(
                            title: 'ORO NOVA',
                            sub: '16+16 Valves | 2 Pumps | Flow',
                            color: Color(0xFF7C3AED),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 2. CONTROLLER SELECTOR (SHINE, ELITE, NOVA)
  // ─────────────────────────────────────────────────────────────
  Widget _buildControllerSelector(bool isDesktop) {
    final activeModel = kOroControllers[_selectedControllerIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Model explorer',
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
              ),
              const SizedBox(height: 6),
              Text(
                'Select an ORO Controller',
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Compare features, valve capacity, and operating modes across the ORO lineup.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Tabs
        Center(
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.bgLightGrey,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(kOroControllers.length, (index) {
                final model = kOroControllers[index];
                final isSelected = index == _selectedControllerIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedControllerIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? model.brandColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: isSelected
                          ? AppShadows.sm
                          : null,
                    ),
                    child: Text(
                      model.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.textDark,
                        fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 36),

        // Active Model Showcase Box
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(_selectedControllerIndex),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(
                  color: activeModel.brandColor.withValues(alpha: 0.3),
                  width: 1.5),
              boxShadow: AppShadows.md,
            ),
            padding: EdgeInsets.all(isDesktop ? 36 : 24),
            child: isDesktop
                ? Row(
              children: [
                Expanded(
                  flex: 12,
                  child: _buildControllerDetailsLeft(activeModel),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 10,
                  child: _buildControllerImageRight(activeModel),
                ),
              ],
            )
                : Column(
              children: [
                _buildControllerDetailsLeft(activeModel),
                const SizedBox(height: 24),
                _buildControllerImageRight(activeModel),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControllerDetailsLeft(OroControllerModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: model.brandColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Text(
                model.category,
                style: TextStyle(
                  color: model.brandColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        Text(
          model.tagline,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textMuted,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        // Key Capacity Badges
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            _SpecChip(icon: Icons.tune_rounded, text: model.wiredValves),
            if (model.wirelessValves != 'Not Supported')
              _SpecChip(
                  icon: Icons.wifi_tethering_rounded, text: model.wirelessValves),
            _SpecChip(icon: Icons.water_drop_rounded, text: model.pumpControl),
            _SpecChip(
                icon: Icons.science_rounded, text: model.fertigationSupport),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Key Features & Advantages:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 10),
        ...model.highlights.map(
              (h) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_rounded,
                    color: model.brandColor, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    h,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMedium,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControllerImageRight(OroControllerModel model) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.bgLightGrey,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Image.asset(
          model.imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(
            icon: Icons.developer_board_rounded,
            title: model.name,
            subtitle: 'Place ${model.imagePath.split('/').last} in assets/images/',
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 3. COMPARISON MATRIX TABLE
  // ─────────────────────────────────────────────────────────────
  Widget _buildComparisonTable(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Specification comparison',
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
              ),
              const SizedBox(height: 6),
              Text(
                'ORO Series Technical Matrix',
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Detailed parameter breakdown for SHINE, ELITE, and NOVA controllers.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: AppShadows.md,
          ),
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor:
              WidgetStateProperty.all(const Color(0xFFF8FAFC)),
              dataRowMinHeight: 52,
              dataRowMaxHeight: 60,
              columnSpacing: isDesktop ? 36 : 20,
              columns: const [
                DataColumn(
                  label: Text('FEATURE / PARAMETER',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                          fontSize: 13)),
                ),
                DataColumn(
                  label: Text('ORO SHINE',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0284C7),
                          fontSize: 13)),
                ),
                DataColumn(
                  label: Text('ORO ELITE',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F766E),
                          fontSize: 13)),
                ),
                DataColumn(
                  label: Text('ORO NOVA',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF7C3AED),
                          fontSize: 13)),
                ),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Wired Solenoid Valves',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('4 Valves')),
                  DataCell(Text('10 Valves')),
                  DataCell(Text('Up to 16 Valves',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w700))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Wireless Valve Support',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('—')),
                  DataCell(Text('—')),
                  DataCell(Text('Up to 16 Radio Nodes (Optional)',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w600))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Pump Motor Control',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('1 Pump')),
                  DataCell(Text('1 Pump')),
                  DataCell(Text('2 Independent Pumps',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w700))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Filter Backflush',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('Manual / Timer')),
                  DataCell(Text('Scheduled')),
                  DataCell(Text('2 Dedicated Valves (Automated)',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w600))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Fertigation Dosing',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('Manual Dosing')),
                  DataCell(Text('Valve Linked')),
                  DataCell(Text('1 Dedicated Channel (Timer/Flow)',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w700))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Flow-Based Volumetric Control',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('No')),
                  DataCell(Text('No')),
                  DataCell(Text('Yes (Flow Meter Integrated)',
                      style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w700))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Motor Protections Suite',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('Dry Run, Overload, Voltage, Phase')),
                  DataCell(Text('Dry Run, Overload, Voltage, Phase')),
                  DataCell(Text('Full Protections + Flow Check',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Solenoid Coil Output',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('24V AC')),
                  DataCell(Text('24V AC')),
                  DataCell(Text('24V AC')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Display & Interface',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('Digital Display')),
                  DataCell(Text('Onboard Display')),
                  DataCell(Text('Onboard LCD Screen')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Remote Connectivity',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text('GSM / Wi-Fi / Bluetooth (Optional)')),
                  DataCell(Text('GSM / Wi-Fi / Bluetooth (Optional)')),
                  DataCell(Text('GSM / Wi-Fi / Bluetooth Cloud App',
                      style: TextStyle(fontWeight: FontWeight.w600))),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 4. OPERATING MODES GRID
  // ─────────────────────────────────────────────────────────────
  Widget _buildOperatingModesGrid(bool isDesktop) {
    final modes = [
      _ModeCardData(
        icon: Icons.access_time_filled_rounded,
        title: 'RTC Mode (Real-Time Clock)',
        desc: 'Schedules valve opening and pump startup at exact wall-clock times daily (e.g. 6:00 AM & 5:00 PM).',
        color: const Color(0xFF0284C7),
      ),
      _ModeCardData(
        icon: Icons.timer_rounded,
        title: 'Timer-Based Mode',
        desc: 'Configures individual runtime durations per solenoid valve (e.g., Zone 1 = 30 mins, Zone 2 = 45 mins).',
        color: const Color(0xFF0F766E),
      ),
      _ModeCardData(
        icon: Icons.water_rounded,
        title: 'Flow-Based Mode (NOVA Only)',
        desc: 'Controls irrigation and fertigation by exact water volume (Liters/Gallons) measured via flow meter.',
        color: const Color(0xFF7C3AED),
      ),
      _ModeCardData(
        icon: Icons.loop_rounded,
        title: 'Cycle Timer Mode',
        desc: 'Repeats irrigation cycles at set intervals throughout the day for high-frequency low-volume watering.',
        color: const Color(0xFFD97706),
      ),
      _ModeCardData(
        icon: Icons.phone_android_rounded,
        title: 'Manual App Control',
        desc: 'Instant manual ON/OFF override for any valve or motor pump directly from the Mobile App or Web Dashboard.',
        color: const Color(0xFF10B981),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Flexible strategies',
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
              ),
              const SizedBox(height: 6),
              Text(
                'Intelligent Operating Modes',
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Tailor your irrigation strategy to match crop water requirements, soil types, and weather conditions.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop
                ? (constraints.maxWidth - 2 * 20) / 3
                : (constraints.maxWidth > 600
                ? (constraints.maxWidth - 20) / 2
                : constraints.maxWidth);
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: modes
                  .map((m) => SizedBox(
                width: cardWidth,
                child: _buildModeCard(m),
              ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildModeCard(_ModeCardData m) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: m.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(m.icon, color: m.color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            m.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            m.desc,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 5. MOTOR PROTECTIONS SUITE
  // ─────────────────────────────────────────────────────────────
  Widget _buildProtectionsGrid(bool isDesktop) {
    final protections = [
      _ProtItem(
        icon: Icons.opacity_rounded,
        title: 'Dry Run Protection',
        desc: 'Detects absence of water flow and automatically trips pump to prevent impeller burnout.',
      ),
      _ProtItem(
        icon: Icons.bolt_rounded,
        title: 'Overload Protection',
        desc: 'Monitors current draw and shuts down motor when electrical overload occurs.',
      ),
      _ProtItem(
        icon: Icons.arrow_downward_rounded,
        title: 'Low Voltage Protection',
        desc: 'Safely cuts off power supply when line voltage drops below operating threshold.',
      ),
      _ProtItem(
        icon: Icons.arrow_upward_rounded,
        title: 'High Voltage Protection',
        desc: 'Protects control panel and motor coils from sudden high voltage spikes.',
      ),
      _ProtItem(
        icon: Icons.swap_horiz_rounded,
        title: 'Phase Imbalance Protection',
        desc: 'Prevents 3-phase motor single-phasing and uneven phase voltage damage.',
      ),
      _ProtItem(
        icon: Icons.speed_rounded,
        title: 'Pressure Sensor Monitoring',
        desc: 'Continuously measures water line pressure to ensure safe pipeline operation.',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.md,
      ),
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shield_rounded,
                  color: Color(0xFF38BDF8),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Industrial-grade reliability',
                      style: TextStyle(
                        color: Color(0xFF38BDF8),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Comprehensive Motor Protection Suite',
                      style: AppTextStyles.sectionTitle(
                        isDesktop: isDesktop,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = isDesktop
                  ? (constraints.maxWidth - 2 * 20) / 3
                  : (constraints.maxWidth > 600
                  ? (constraints.maxWidth - 20) / 2
                  : constraints.maxWidth);
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: protections
                    .map((p) => SizedBox(
                  width: cardWidth,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(p.icon,
                            color: const Color(0xFF38BDF8), size: 24),
                        const SizedBox(height: 12),
                        Text(
                          p.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          p.desc,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF94A3B8),
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 6. MOBILE & WEB APP INTEGRATION BANNER
  // ─────────────────────────────────────────────────────────────
  Widget _buildAppIntegrationBanner(bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight),
      ),
      padding: EdgeInsets.all(isDesktop ? 36 : 24),
      child: isDesktop
          ? Row(
        children: [
          Expanded(
            flex: 12,
            child: _buildAppTextLeft(),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 10,
            child: _buildAppImageRight(),
          ),
        ],
      )
          : Column(
        children: [
          _buildAppTextLeft(),
          const SizedBox(height: 24),
          _buildAppImageRight(),
        ],
      ),
    );
  }

  Widget _buildAppTextLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: const Text(
            'Remote cloud connectivity',
            style: TextStyle(
              color: Color(0xFF10B981),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Mobile & Web App Control',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Monitor real-time pump status, open/close solenoid valves remotely, configure irrigation RTC schedules, and receive instant push notifications for low voltage or dry run alerts.',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: const [
            _AppFeaturePill(icon: Icons.smartphone_rounded, label: 'Android & iOS App'),
            _AppFeaturePill(icon: Icons.language_rounded, label: 'Web Dashboard'),
            _AppFeaturePill(icon: Icons.notifications_active_rounded, label: 'Real-time Alerts'),
          ],
        ),
      ],
    );
  }

  Widget _buildAppImageRight() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: InteractiveViewer(
                    maxScale: 4.0,
                    child: Image.asset(
                      _kOroAppImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: IconButton.filled(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                    style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 320,
          decoration: BoxDecoration(
            color: const Color(0xFF003F47),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.borderLight, width: 1.5),
            boxShadow: AppShadows.md,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // Dashboard Frame Top Bar
              Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                color: const Color(0xFF002B31),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(radius: 5, backgroundColor: Color(0xFFFF5F56)),
                        SizedBox(width: 6),
                        CircleAvatar(radius: 5, backgroundColor: Color(0xFFFFBD2E)),
                        SizedBox(width: 6),
                        CircleAvatar(radius: 5, backgroundColor: Color(0xFF27C93F)),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        height: 22,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Row(
                          children: [
                            Icon(Icons.lock_rounded, size: 10, color: Color(0xFF2DD4BF)),
                            SizedBox(width: 6),
                            Text(
                              'https://dashboard.orogem.com/valve-status',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10.5,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(radius: 3, backgroundColor: Color(0xFF10B981)),
                          SizedBox(width: 4),
                          Text(
                            'LIVE',
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 9.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Dashboard Image
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      _kOroAppImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(
                        icon: Icons.phone_android_rounded,
                        title: 'Niagara / ORO Web & Mobile Dashboard',
                        subtitle: 'Place oro_app_dashboard.png in assets/images/',
                      ),
                    ),
                    // Hover hint overlay
                    Positioned(
                      right: 12,
                      bottom: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.zoom_in_rounded, size: 14, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              'Tap to Expand',
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // PLACEHOLDER BUILDER
  // ─────────────────────────────────────────────────────────────
  Widget _buildImagePlaceholder({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: const Color(0xFFF1F5F9),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color(0xFF94A3B8)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// HELPER COMPONENTS
// ─────────────────────────────────────────────────────────────
class _SeriesBadge extends StatelessWidget {
  final String title;
  final String sub;
  final Color color;

  const _SeriesBadge({
    required this.title,
    required this.sub,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Text(
                sub,
                style: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpecChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SpecChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bgLightGrey,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.primaryTeal),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppFeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AppFeaturePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF10B981)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeCardData {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const _ModeCardData({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });
}

class _ProtItem {
  final IconData icon;
  final String title;
  final String desc;

  const _ProtItem({
    required this.icon,
    required this.title,
    required this.desc,
  });
}

class _GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    const step = 40.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}