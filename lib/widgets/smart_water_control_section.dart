import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_design.dart';

// ─────────────────────────────────────────────────────────────
//  ASSETS (add these to assets/images/ – see pubspec note)
//    smart_water_control_hero.png   – hero scene from the brochure
//    niagara_app_home.png           – app screenshot (home)
//    niagara_app_schedule.png       – app screenshot (schedule)
//    dealer_partner.png             – cut-out photo for dealer banner
//  Everything else (controller units, matrix, icons) is drawn in code.
// ─────────────────────────────────────────────────────────────
const String _kHeroImage = 'assets/images/smart_water_control_hero.png';
const String _kAppHome = 'assets/images/niagara_app_home.png';
const String _kAppSchedule = 'assets/images/niagara_app_schedule.png';
const String _kDealerImage = 'assets/images/dealer_partner.png';

class SmartWaterModelItem {
  final String id;
  final String name;
  final String phase;
  final String display;
  final String rating;
  final String description;
  final List<String> features;

  /// Brand colour of the model (matches the brochure's model matrix)
  final Color color;

  /// 0 = LED, 1/2/3 = 7-segment, 4 = LCD + GSM  (used by the drawn unit)
  final int unitVariant;

  const SmartWaterModelItem({
    required this.id,
    required this.name,
    required this.phase,
    required this.display,
    required this.rating,
    required this.description,
    required this.features,
    required this.color,
    required this.unitVariant,
  });
}

const List<SmartWaterModelItem> kSmartWaterModels = [
  SmartWaterModelItem(
    id: 'wlc_1p',
    name: 'WLC-1P',
    phase: 'Single Phase (1∅)',
    display: 'LED Indicators',
    rating: 'Up to 5 HP',
    description: 'Entry-level automatic water level controller for single-phase pumps with overhead tank and sump monitoring.',
    features: [
      'Automatic ON when overhead tank is empty & sump has water',
      'Automatic OFF when overhead tank is full or sump is empty',
      'LED status indication for tank levels and pump state',
      'Simple plug-and-play installation for homes & villas',
    ],
    color: Color(0xFF0B3C8C),
    unitVariant: 0,
  ),
  SmartWaterModelItem(
    id: 'wlc_1p_7s',
    name: 'WLC-1P-7S',
    phase: 'Single Phase (1∅)',
    display: '7-Segment Digital',
    rating: 'Up to 5 HP',
    description: 'Digital 7-segment display single-phase controller with real-time level monitoring and voltage protection.',
    features: [
      'Digital 7-segment real-time status display',
      'High & Low voltage auto-cut and auto-resume',
      'Dry run and overflow protection',
      'Microcontroller-based high precision operation',
    ],
    color: Color(0xFF0A9AAE),
    unitVariant: 1,
  ),
  SmartWaterModelItem(
    id: 'wlcs_1p_7s',
    name: 'WLCS-1P-7S',
    phase: 'Single Phase (1∅)',
    display: '7-Segment Digital',
    rating: 'Up to 5 HP',
    description: 'Current sensing-based advanced single-phase controller with precise overload & dry run trip protection.',
    features: [
      'Current sensing-based dry run & overload protection',
      'Adjustable voltage & current limit settings',
      'Digital 7-segment display for voltage & current readings',
      'Extends motor lifespan and prevents coil burnout',
    ],
    color: Color(0xFF1E7B34),
    unitVariant: 2,
  ),
  SmartWaterModelItem(
    id: 'wlc_3p_7s',
    name: 'WLC-3P-7S',
    phase: '3-Phase (3∅)',
    display: '7-Segment Digital',
    rating: 'Up to 15 HP',
    description: 'Heavy-duty 3-phase digital water level controller with single phasing preventer and high/low voltage protection.',
    features: [
      'Operating voltage range 300V - 470V (3∅ 50Hz)',
      'Built-in digital single-phase preventer',
      'Multi-level tank monitoring for commercial sumps',
      'Heavy-duty industrial relay control',
    ],
    color: Color(0xFFF26B0F),
    unitVariant: 3,
  ),
  SmartWaterModelItem(
    id: 'wlc_3p_lcd_gsm',
    name: 'WLC-3P LCD GSM',
    phase: '3-Phase (3∅)',
    display: 'LCD & GSM Smart',
    rating: 'Up to 15 HP',
    description: 'Flagship GSM-enabled smart 3-phase controller with interactive LCD display and remote SMS/Mobile app control.',
    features: [
      'Full GSM mobile remote monitoring & SMS alerts',
      'Interactive LCD display for detailed diagnostics',
      'Automatic time scheduling and timer operations',
      'Complete pump protection: Dry run, overload, phase fault',
    ],
    color: Color(0xFF5B2A9E),
    unitVariant: 4,
  ),
];

// Feature matrix from the brochure (page 3). Order of the 5 values = kSmartWaterModels order.
class _MatrixRow {
  final IconData icon;
  final String label;
  final List<bool> has;
  const _MatrixRow(this.icon, this.label, this.has);
}

const List<_MatrixRow> _kMatrixRows = [
  _MatrixRow(Icons.signal_cellular_alt_rounded, 'GSM', [false, false, false, false, true]),
  _MatrixRow(Icons.wifi_rounded, 'WiFi / Bluetooth', [true, true, true, true, false]),
  _MatrixRow(Icons.vertical_align_top_rounded, 'Top Tank Level', [true, true, true, true, true]),
  _MatrixRow(Icons.vertical_align_bottom_rounded, 'Bottom Tank Level', [true, true, true, true, true]),
  _MatrixRow(Icons.electric_bolt_rounded, 'Low & High Voltage Protector', [false, false, true, true, true]),
  _MatrixRow(Icons.warning_amber_rounded, 'Dry Run Overload Protection', [false, false, true, true, true]),
  _MatrixRow(Icons.timer_rounded, 'Delay On Timer', [false, false, true, true, true]),
  _MatrixRow(Icons.restart_alt_rounded, 'Dry Run Restart Timer', [false, false, true, true, true]),
  _MatrixRow(Icons.autorenew_rounded, 'Cyclic Timer', [false, false, true, true, true]),
  _MatrixRow(Icons.update_rounded, 'Real Time Cyclic Timer', [false, false, true, true, true]),
  _MatrixRow(Icons.hourglass_bottom_rounded, 'Maximum Run Timer', [false, false, true, true, true]),
  _MatrixRow(Icons.show_chart_rounded, 'Single Phasing Preventer', [false, false, false, false, true]),
  _MatrixRow(Icons.sensors_rounded, 'Dry Run Sensor', [false, false, true, true, true]),
];

// ─────────────────────────────────────────────────────────────
//  SECTION
// ─────────────────────────────────────────────────────────────
class SmartWaterControlSection extends StatefulWidget {
  const SmartWaterControlSection({super.key});

  @override
  State<SmartWaterControlSection> createState() => _SmartWaterControlSectionState();
}

class _SmartWaterControlSectionState extends State<SmartWaterControlSection> {
  int _selectedModelIndex = 0;

  static const double _gap = 80;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    final isTablet = size.width >= 600 && size.width < 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.heroBgLight, AppColors.bgOffWhite],
          stops: [0.0, 0.25],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : (isTablet ? 30 : 16),
        vertical: isDesktop ? 80 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBadge(),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  style: AppTextStyles.sectionTitle(isDesktop: isDesktop)
                      .copyWith(fontSize: isDesktop ? 46 : 28),
                  children: const [
                    TextSpan(text: 'NIAGARA '),
                    TextSpan(
                      text: 'Smart Water Control',
                      style: TextStyle(color: AppColors.primaryTeal),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Smart Water Control. Reliable Supply. Effortless Automation.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop).copyWith(
                  color: AppColors.darkTeal,
                  fontWeight: FontWeight.w700,
                  fontSize: isDesktop ? 20 : 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  'NIAGARA delivers innovative water automation and management solutions. Our Water Level Controllers automatically monitor water levels and pump operations to optimize usage, reduce wastage, and improve operational efficiency for homes, apartments, commercial buildings, and industries.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 64,
                height: 4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryTeal, AppColors.accentCyan],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 48),

              _buildMainShowcaseCard(isDesktop),
              const SizedBox(height: 56),

              _buildCoreBenefitsGrid(isDesktop),
              const SizedBox(height: _gap),

              _buildHowItWorks(isDesktop),
              const SizedBox(height: _gap),

              // ── Models ──
              _Heading(
                title: 'Smart Water Controller Models',
                subtitle: 'Explore our range of 1-Phase and 3-Phase digital water level controllers',
                isDesktop: isDesktop,
              ),
              const SizedBox(height: 32),
              _buildInteractiveModelShowcase(isDesktop),
              const SizedBox(height: 28),
              _ModelsMatrix(
                selectedIndex: _selectedModelIndex,
                onSelect: (i) => setState(() => _selectedModelIndex = i),
              ),
              const SizedBox(height: _gap),

              _buildAppSection(isDesktop),
              const SizedBox(height: _gap),

              _buildTechSpecsTable(isDesktop),
              const SizedBox(height: _gap),

              _buildApplicationsSection(isDesktop),
              const SizedBox(height: _gap),

              _buildWhyChooseUs(isDesktop),
              const SizedBox(height: _gap),

              _buildDealerBanner(isDesktop),
            ],
          ),
        ),
      ),
    );
  }

  // ── Badge ──────────────────────────────────────────────────
  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.primaryTeal.withOpacity(0.3)),
        boxShadow: AppShadows.md,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.water_drop_rounded, color: AppColors.primaryTeal, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Automatic pump & water level management',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.badgeText(color: AppColors.primaryTeal).copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Hero showcase ──────────────────────────────────────────
  Widget _buildMainShowcaseCard(bool isDesktop) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primaryTeal.withOpacity(0.4)),
          ),
          child: Text(
            'Smart resource utilization',
            style: AppTextStyles.badgeText(color: AppColors.primaryTeal)
                .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Complete Water & Motor Automation',
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white)
              .copyWith(fontSize: isDesktop ? 34 : 24, height: 1.2),
        ),
        const SizedBox(height: 14),
        Text(
          'Automatically turn ON the pump when the upper tank is empty and the sump has water. Automatically turn OFF when the upper tank is full or the sump runs dry. Protects pump motors against voltage fluctuations, dry run, and overload.',
          style: AppTextStyles.cardDescription(color: Colors.white70)
              .copyWith(fontSize: isDesktop ? 15 : 14, height: 1.65),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _FeaturePill(icon: Icons.water_drop_rounded, label: 'Overflow Prevention'),
            _FeaturePill(icon: Icons.water_damage_rounded, label: 'Dry Run Protection'),
            _FeaturePill(icon: Icons.electric_bolt_rounded, label: 'High & Low Voltage Cut-Off'),
            _FeaturePill(icon: Icons.speed_rounded, label: 'Current Sensing Protection'),
          ],
        ),
        const SizedBox(height: 28),
        Container(height: 1, color: Colors.white12),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(child: _HeroStat(value: '5', label: 'Controller models')),
            Expanded(child: _HeroStat(value: '15 HP', label: 'Max motor rating')),
            Expanded(child: _HeroStat(value: '±2.5%', label: 'Calibration accuracy')),
          ],
        ),
      ],
    );

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.bgDarkSlate, Color(0xFF0F2027)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.lg,
      ),
      child: Stack(
        children: [
          // decorative glow
          Positioned(
            top: -80,
            left: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryTeal.withOpacity(0.12),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isDesktop ? 40 : 20),
            child: isDesktop
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: content),
                const SizedBox(width: 44),
                const Expanded(flex: 6, child: _ZoomableImage(path: _kHeroImage)),
              ],
            )
                : Column(
              children: [
                const _ZoomableImage(path: _kHeroImage),
                const SizedBox(height: 24),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Core benefits ──────────────────────────────────────────
  Widget _buildCoreBenefitsGrid(bool isDesktop) {
    final benefits = [
      {
        'icon': Icons.invert_colors_rounded,
        'title': 'Water Saving',
        'desc': 'Prevents overflow, reduces water wastage, and ensures continuous water availability across all tanks.',
        'color': AppColors.primaryTeal,
      },
      {
        'icon': Icons.bolt_rounded,
        'title': 'Energy Efficient',
        'desc': 'Optimized pump operations reduce electricity consumption and significantly extend pump motor life.',
        'color': const Color(0xFFFF9F43),
      },
      {
        'icon': Icons.memory_rounded,
        'title': 'Smart Automation',
        'desc': 'Fully automatic monitoring and pump control with high reliability and minimal human intervention.',
        'color': const Color(0xFF6C5CE7),
      },
      {
        'icon': Icons.security_rounded,
        'title': 'Advanced Protection',
        'desc': 'Digital single-phase preventer with current sensing dry run and overload trip protection.',
        'color': AppColors.emeraldTeal,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = isDesktop ? 4 : (constraints.maxWidth >= 600 ? 2 : 1);
        const spacing = 20.0;
        final width = (constraints.maxWidth - spacing * (cols - 1)) / cols;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: benefits.map((b) {
            final color = b['color'] as Color;
            return SizedBox(
              width: width,
              child: _HoverCard(
                builder: (hover) => AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  padding: const EdgeInsets.all(24),
                  decoration: _cardDecoration(hover, color),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: hover
                              ? LinearGradient(colors: [color, color.withOpacity(0.7)])
                              : null,
                          color: hover ? null : color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                        ),
                        child: Icon(b['icon'] as IconData,
                            color: hover ? Colors.white : color, size: 28),
                      ),
                      const SizedBox(height: 18),
                      Text(b['title'] as String,
                          style: AppTextStyles.cardTitle().copyWith(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text(b['desc'] as String,
                          style: AppTextStyles.cardDescription().copyWith(height: 1.55)),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  // ── How it works ───────────────────────────────────────────
  Widget _buildHowItWorks(bool isDesktop) {
    final steps = [
      {'icon': Icons.sensors_rounded, 'title': 'Sense', 'desc': 'Top & bottom tank level sensors and the dry-run sensor watch your sump and overhead tank.'},
      {'icon': Icons.memory_rounded, 'title': 'Decide', 'desc': 'The microcontroller checks water level, supply voltage and motor current in real time.'},
      {'icon': Icons.power_settings_new_rounded, 'title': 'Act', 'desc': 'Pump switches ON when the tank is empty and the sump has water, and OFF when full, dry or faulty.'},
      {'icon': Icons.phone_iphone_rounded, 'title': 'Monitor', 'desc': 'Follow status on the LED / LCD display or in the mobile app.'},
    ];

    Widget stepCard(int i) {
      final s = steps[i];
      return Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryTeal, AppColors.accentCyan],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.md,
                ),
                child: Icon(s['icon'] as IconData, color: Colors.white, size: 32),
              ),
              Positioned(
                top: -4,
                right: -6,
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryTeal, width: 2),
                  ),
                  child: Text('${i + 1}',
                      style: AppTextStyles.badgeText().copyWith(fontSize: 11)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(s['title'] as String, style: AppTextStyles.cardTitle().copyWith(fontSize: 18)),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              s['desc'] as String,
              textAlign: TextAlign.center,
              style: AppTextStyles.cardDescription().copyWith(height: 1.5),
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 20, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      child: Column(
        children: [
          _Heading(
            title: 'How It Works',
            subtitle: 'From sensing to switching – fully automatic, around the clock',
            isDesktop: isDesktop,
            titleSize: isDesktop ? 28 : 22,
          ),
          const SizedBox(height: 36),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < steps.length; i++) ...[
                  Expanded(child: stepCard(i)),
                  if (i < steps.length - 1)
                    const Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: Icon(Icons.arrow_forward_rounded, color: AppColors.primaryTeal, size: 28),
                    ),
                ],
              ],
            )
          else
            Column(
              children: [
                for (int i = 0; i < steps.length; i++) ...[
                  stepCard(i),
                  if (i < steps.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Icon(Icons.arrow_downward_rounded, color: AppColors.primaryTeal),
                    ),
                ],
              ],
            ),
        ],
      ),
    );
  }

  // ── Interactive model showcase ─────────────────────────────
  Widget _buildInteractiveModelShowcase(bool isDesktop) {
    final m = kSmartWaterModels[_selectedModelIndex];

    final selector = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(kSmartWaterModels.length, (index) {
          final model = kSmartWaterModels[index];
          final isSelected = _selectedModelIndex == index;
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => setState(() => _selectedModelIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                decoration: BoxDecoration(
                  color: isSelected ? model.color : AppColors.bgLightGrey,
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  boxShadow: isSelected
                      ? AppShadows.sm
                      : [],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.white : model.color,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      model.name,
                      style: AppTextStyles.navLink(isSelected: true).copyWith(
                        fontSize: 14,
                        color: isSelected ? Colors.white : AppColors.textMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );

    final stage = Container(
      height: 340,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        gradient: RadialGradient(
          radius: 0.95,
          colors: [Colors.white, m.color.withOpacity(0.14)],
        ),
        border: Border.all(color: m.color.withOpacity(0.2)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(shape: BoxShape.circle, color: m.color.withOpacity(0.10)),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: ScaleTransition(scale: Tween(begin: 0.9, end: 1.0).animate(anim), child: child),
            ),
            child: Padding(
              key: ValueKey(m.id),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: 200,
                  height: 280,
                  child: CustomPaint(
                    painter: _ControllerUnitPainter(accent: m.color, variant: m.unitVariant),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.sm,
              ),
              child: Text(m.display,
                  style: AppTextStyles.badgeText(color: m.color).copyWith(fontSize: 12)),
            ),
          ),
        ],
      ),
    );

    Widget chip(String text, Color c) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: c.withOpacity(0.12), borderRadius: BorderRadius.circular(AppRadius.lg)),
      child: Text(text, style: AppTextStyles.badgeText(color: c).copyWith(fontSize: 12.5)),
    );

    final detail = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey('detail_${m.id}'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [chip(m.phase, m.color), chip('Motor: ${m.rating}', AppColors.darkTeal)],
          ),
          const SizedBox(height: 16),
          Text(m.name,
              style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: m.color)
                  .copyWith(fontSize: isDesktop ? 34 : 26)),
          const SizedBox(height: 10),
          Text(m.description,
              style: AppTextStyles.cardDescription(color: AppColors.textMedium)
                  .copyWith(fontSize: 15, height: 1.6)),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: _InfoTile(icon: Icons.flash_on_rounded, label: 'MOTOR CAPACITY', value: m.rating, color: m.color)),
              const SizedBox(width: 12),
              Expanded(child: _InfoTile(icon: Icons.tv_rounded, label: 'DISPLAY', value: m.display, color: m.color)),
            ],
          ),
          const SizedBox(height: 24),
          Text('Key Specifications & Operations',
              style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...m.features.map(
                (f) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(color: m.color.withOpacity(0.14), shape: BoxShape.circle),
                    child: Icon(Icons.check_rounded, size: 14, color: m.color),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(f,
                        style: AppTextStyles.cardDescription(color: AppColors.textMedium)
                            .copyWith(fontSize: 14, height: 1.45)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      padding: EdgeInsets.all(isDesktop ? 32 : 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selector,
          const SizedBox(height: 28),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: stage),
                const SizedBox(width: 40),
                Expanded(flex: 7, child: detail),
              ],
            )
          else
            Column(children: [stage, const SizedBox(height: 24), detail]),
        ],
      ),
    );
  }

  // ── Mobile app ─────────────────────────────────────────────
  Widget _buildAppSection(bool isDesktop) {
    final points = [
      {'icon': Icons.dashboard_rounded, 'text': 'Live valve, pump & pressure-sensor status on one screen'},
      {'icon': Icons.event_repeat_rounded, 'text': 'Program and schedule sequences – start date, cycles & zones'},
      {'icon': Icons.speed_rounded, 'text': 'Monitor pressure and water-meter readings in real time'},
      {'icon': Icons.history_rounded, 'text': 'Activity log and quick settings at your fingertips'},
    ];

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_rounded, size: 15, color: AppColors.primaryTeal),
              const SizedBox(width: 6),
              Text('Mobile app control',
                  style: AppTextStyles.badgeText().copyWith(fontSize: 11.5, )),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Your Whole Water System, In Your Pocket',
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop).copyWith(fontSize: isDesktop ? 34 : 24),
        ),
        const SizedBox(height: 12),
        Text(
          'Check tank levels, start or pause lines and review schedules from anywhere – no more walking to the pump room.',
          style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop).copyWith(height: 1.6),
        ),
        const SizedBox(height: 24),
        ...points.map(
              (p) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryTeal, AppColors.accentCyan],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(p['icon'] as IconData, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(p['text'] as String,
                      style: AppTextStyles.cardTitle().copyWith(fontSize: 14.5, fontWeight: FontWeight.w500, height: 1.4)),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final phones = FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 460,
        height: 540,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 40,
              child: Transform.rotate(angle: -0.06, child: const _PhoneFrame(path: _kAppHome, width: 210)),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Transform.rotate(angle: 0.05, child: const _PhoneFrame(path: _kAppSchedule, width: 210)),
            ),
          ],
        ),
      ),
    );

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, AppColors.heroBgLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.primaryTeal.withOpacity(0.2)),
        boxShadow: AppShadows.lg,
      ),
      child: isDesktop
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: text),
          const SizedBox(width: 40),
          Expanded(flex: 5, child: Center(child: phones)),
        ],
      )
          : Column(children: [text, const SizedBox(height: 28), phones]),
    );
  }

  // ── Technical specs ────────────────────────────────────────
  Widget _buildTechSpecsTable(bool isDesktop) {
    const headers = [
      'Specification Parameter',
      'AWLC (Water Level Controller)',
      'AWPC (Pump Controller)',
    ];

    const rows = [
      ['Operating Voltage (AC)', '1∅ 180V – 260V / 3∅ 300V – 470V (50Hz)', '1∅ 180V – 260V / 3∅ 300V – 470V (50Hz)'],
      ['Calibration Accuracy', '±2.5%', '±2.5%'],
      ['Motor Rating', 'Up to 5 HP (Single Phase), Indirect Load (Any)', 'Up to 15 HP, Indirect Load (Any)'],
      ['Display Type', '7 Segment Display', 'LCD / 7 Segment Display'],
      ['Protection Features', 'Dry Run, Overflow Prevention', 'Dry Run, Single Phasing, Voltage Protection'],
      ['Operating Temperature', '0°C to 55°C', '0°C to 55°C'],
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 36 : 22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), AppColors.bgDarkSlate],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
        boxShadow: AppShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryTeal.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: const Icon(Icons.settings_suggest_rounded, color: AppColors.primaryTeal, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Technical Specifications Matrix',
                        style: AppTextStyles.sectionTitle(isDesktop: false, color: Colors.white)
                            .copyWith(fontSize: isDesktop ? 22 : 18)),
                    const SizedBox(height: 4),
                    Text('Technical parameters for AWLC & AWPC Smart Water Controllers',
                        style: AppTextStyles.cardDescription(color: Colors.white60)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Container(
              color: Colors.white.withOpacity(0.03),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.white12),
                  child: DataTable(
                    headingRowHeight: 56,
                    dataRowMinHeight: 58,
                    dataRowMaxHeight: 66,
                    columnSpacing: 40,
                    headingRowColor: WidgetStateProperty.all(AppColors.primaryTeal.withOpacity(0.22)),
                    columns: headers
                        .map((h) => DataColumn(
                      label: Text(h, style: AppTextStyles.buttonText().copyWith(fontSize: 13.5)),
                    ))
                        .toList(),
                    rows: List.generate(rows.length, (i) {
                      final r = rows[i];
                      return DataRow(
                        color: WidgetStateProperty.all(
                          i.isOdd ? Colors.white.withOpacity(0.04) : Colors.transparent,
                        ),
                        cells: [
                          DataCell(Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(color: AppColors.accentCyan, shape: BoxShape.circle),
                              ),
                              const SizedBox(width: 10),
                              Text(r[0], style: AppTextStyles.buttonText().copyWith(fontSize: 14)),
                            ],
                          )),
                          for (int j = 1; j < r.length; j++)
                            DataCell(Text(r[j],
                                style: AppTextStyles.cardDescription(color: Colors.white70).copyWith(fontSize: 13.5))),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Applications ───────────────────────────────────────────
  Widget _buildApplicationsSection(bool isDesktop) {
    final apps = [
      {'title': 'Residential Homes & Villas', 'icon': Icons.home_rounded, 'color': AppColors.primaryTeal},
      {'title': 'Apartments & Residential Complexes', 'icon': Icons.apartment_rounded, 'color': const Color(0xFF6C5CE7)},
      {'title': 'Hospitals & Healthcare Facilities', 'icon': Icons.local_hospital_rounded, 'color': const Color(0xFFE5484D)},
      {'title': 'Schools & Educational Institutions', 'icon': Icons.school_rounded, 'color': const Color(0xFFFF9F43)},
      {'title': 'Hotels & Resorts', 'icon': Icons.hotel_rounded, 'color': AppColors.emeraldTeal},
      {'title': 'Industrial & Commercial Buildings', 'icon': Icons.factory_rounded, 'color': const Color(0xFF0B3C8C)},
    ];

    return Column(
      children: [
        _Heading(
          title: 'Applications',
          subtitle: 'Versatile water automation built for every property type',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final cols = isDesktop ? 3 : (constraints.maxWidth >= 600 ? 2 : 1);
            const spacing = 20.0;
            final width = (constraints.maxWidth - spacing * (cols - 1)) / cols;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: apps.map((a) {
                final color = a['color'] as Color;
                return SizedBox(
                  width: width,
                  child: _HoverCard(
                    builder: (hover) => AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: _cardDecoration(hover, color, radius: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [color, color.withOpacity(0.7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(AppRadius.lg),
                            ),
                            child: Icon(a['icon'] as IconData, color: Colors.white, size: 26),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(a['title'] as String,
                                style: AppTextStyles.cardTitle().copyWith(fontSize: 15.5, height: 1.3)),
                          ),
                          AnimatedSlide(
                            duration: const Duration(milliseconds: 220),
                            offset: Offset(hover ? 0.3 : 0, 0),
                            child: Icon(Icons.arrow_forward_rounded,
                                size: 18, color: hover ? color : AppColors.borderLight),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  // ── Why choose us ──────────────────────────────────────────
  Widget _buildWhyChooseUs(bool isDesktop) {
    final items = [
      {'icon': Icons.shield_rounded, 'text': 'Advanced Protection For Pump & Motor'},
      {'icon': Icons.schedule_rounded, 'text': 'Automatic Operation With Time Scheduling'},
      {'icon': Icons.build_circle_rounded, 'text': 'Easy Installation & Operation'},
      {'icon': Icons.electrical_services_rounded, 'text': 'Wide Voltage Compatibility'},
      {'icon': Icons.workspace_premium_rounded, 'text': 'Long Life, Low Maintenance'},
    ];

    return Column(
      children: [
        _Heading(
          title: 'Why Choose Us?',
          subtitle: 'Built in Coimbatore. Trusted for reliable, low-maintenance water automation.',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            final cols = isDesktop ? 5 : (constraints.maxWidth >= 600 ? 3 : 2);
            const spacing = 20.0;
            final width = (constraints.maxWidth - spacing * (cols - 1)) / cols;

            return Wrap(
              spacing: spacing,
              runSpacing: 28,
              alignment: WrapAlignment.center,
              children: items.map((it) {
                return SizedBox(
                  width: width,
                  child: _HoverCard(
                    builder: (hover) => Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: hover ? null : Colors.white,
                            gradient: hover
                                ? const LinearGradient(
                              colors: [AppColors.primaryTeal, AppColors.accentCyan],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                                : null,
                            border: Border.all(color: AppColors.primaryTeal.withOpacity(0.35), width: 2),
                            boxShadow: AppShadows.sm,
                          ),
                          child: Icon(it['icon'] as IconData,
                              size: 38, color: hover ? Colors.white : AppColors.primaryTeal),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          it['text'] as String,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.cardTitle().copyWith(fontSize: 14.5, height: 1.35),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  // ── Dealer banner ──────────────────────────────────────────
  Widget _buildDealerBanner(bool isDesktop) {
    const points = [
      'Expand your product line with exclusive irrigation control solutions',
      'Boost your sales with a trusted and reliable brand',
      'Get expert support and marketing materials',
      'Grow your business and profits',
      'Exclusive dealer opportunities',
      'ISO 9001-2015 certified manufacturing',
    ];

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Text("LET'S GROW TOGETHER!",
              style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontWeight: FontWeight.w800)),
        ),
        const SizedBox(height: 16),
        Text(
          'Exclusive Dealer & Business Opportunities',
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white)
              .copyWith(fontSize: isDesktop ? 34 : 24),
        ),
        const SizedBox(height: 22),
        ...points.map(
              (p) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.check_rounded, size: 15, color: AppColors.primaryTeal),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(p,
                      style: AppTextStyles.cardDescription(color: Colors.white).copyWith(fontSize: 15, height: 1.4)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _ContactChip(icon: Icons.phone_rounded, label: '+91 73737 05677'),
            _ContactChip(icon: Icons.email_rounded, label: 'info@niagaraautomation.com'),
            _ContactChip(icon: Icons.language_rounded, label: 'www.niagaraautomation.com'),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_rounded, color: Colors.white70, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Manufactured by Niagara Automations, 295 Niagara Road, near M.G.R Nagar, Athipalayam, Coimbatore - 641 110, Tamil Nadu, India',
                style: AppTextStyles.cardDescription(color: Colors.white70).copyWith(fontSize: 13, height: 1.5),
              ),
            ),
          ],
        ),
      ],
    );

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(minHeight: isDesktop ? 460 : 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0B4F8A), AppColors.primaryTeal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.lg,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -80,
            bottom: -100,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
            ),
          ),
          Positioned(
            left: -60,
            top: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.06)),
            ),
          ),
          if (isDesktop)
            Positioned(
              right: 30,
              bottom: 0,
              height: 430,
              child: Image.asset(
                _kDealerImage,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) => const SizedBox.shrink(),
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(isDesktop ? 48 : 24, isDesktop ? 48 : 28, isDesktop ? 400 : 24, isDesktop ? 48 : 28),
            child: content,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SHARED HELPERS
// ─────────────────────────────────────────────────────────────
BoxDecoration _cardDecoration(bool hover, Color color, {double radius = 22}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: hover ? color.withOpacity(0.55) : AppColors.borderLight,
      width: hover ? 1.5 : 1,
    ),
    boxShadow: AppShadows.sm,
  );
}

/// Lifts its child on hover (desktop / web)
class _HoverCard extends StatefulWidget {
  final Widget Function(bool hover) builder;
  const _HoverCard({required this.builder});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
        child: widget.builder(_hover),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDesktop;
  final double? titleSize;

  const _Heading({
    required this.title,
    required this.subtitle,
    required this.isDesktop,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop)
              .copyWith(fontSize: titleSize ?? (isDesktop ? 36 : 24)),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppColors.primaryTeal, AppColors.accentCyan]),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeaturePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primaryTeal, size: 17),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.sectionTitle(isDesktop: true, color: AppColors.primaryTeal)
              .copyWith(fontSize: 24),
        ),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.cardDescription(color: Colors.white60).copyWith(fontSize: 12)),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bgOffWhite,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(AppRadius.md)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppTextStyles.badgeText(color: AppColors.textMuted)
                        .copyWith(fontSize: 10.5, )),
                const SizedBox(height: 2),
                Text(value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle().copyWith(fontSize: 14.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(label,
                style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 13.5, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  IMAGES
// ─────────────────────────────────────────────────────────────

/// Hero image with hover zoom + tap-to-enlarge viewer
class _ZoomableImage extends StatefulWidget {
  final String path;
  const _ZoomableImage({required this.path});

  @override
  State<_ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<_ZoomableImage> {
  bool _hover = false;

  void _open() {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                child: Image.asset(widget.path, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                icon: const Icon(Icons.close_rounded, color: AppColors.textDark),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: _open,
        child: AspectRatio(
          aspectRatio: 1402 / 1122,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
              boxShadow: AppShadows.md,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedScale(
                  scale: _hover ? 1.04 : 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  child: Image.asset(
                    widget.path,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      color: Colors.white10,
                      child: const Center(
                        child: Icon(Icons.water_rounded, color: AppColors.primaryTeal, size: 64),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 12,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _hover ? 1 : 0.85,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.bgDarkSlate.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.zoom_in_rounded, color: Colors.white, size: 16),
                          const SizedBox(width: 6),
                          Text('Enlarge',
                              style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 11.5)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  final String path;
  final double width;

  const _PhoneFrame({required this.path, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(34),
        boxShadow: AppShadows.md,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: AspectRatio(
          aspectRatio: 716 / 1600,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                path,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(
                  color: AppColors.bgLightGrey,
                  child: const Icon(Icons.phone_android_rounded, size: 48, color: AppColors.primaryTeal),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: 56,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  MODELS FEATURE MATRIX  (replaces smart_water_control_models.png)
// ─────────────────────────────────────────────────────────────
class _ModelsMatrix extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _ModelsMatrix({required this.selectedIndex, required this.onSelect});

  Widget _check() => Container(
    width: 24,
    height: 24,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Color(0xFF22A745), Color(0xFF168A34)]),
    ),
    child: const Icon(Icons.check_rounded, size: 16, color: Colors.white),
  );

  Widget _dash() => Container(
    width: 14,
    height: 3,
    decoration: BoxDecoration(color: const Color(0xFFCBD5E1), borderRadius: BorderRadius.circular(3)),
  );

  @override
  Widget build(BuildContext context) {
    final models = kSmartWaterModels;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryTeal.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Icon(Icons.compare_arrows_rounded, color: AppColors.primaryTeal),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Compare Water Level Controllers',
                        style: AppTextStyles.cardTitle().copyWith(fontSize: 18)),
                    Text('Tap a model to highlight it above',
                        style: AppTextStyles.cardDescription().copyWith(fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) {
              final labelW = c.maxWidth < 700 ? 170.0 : 250.0;
              final minW = labelW + models.length * 120;
              final totalW = c.maxWidth > minW ? c.maxWidth : minW;
              final colW = (totalW - labelW) / models.length;

              Widget cellBg(int i, Widget child, {double height = 48}) => Container(
                width: colW,
                height: height,
                alignment: Alignment.center,
                color: i == selectedIndex ? models[i].color.withOpacity(0.07) : Colors.transparent,
                child: child,
              );

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: totalW,
                  child: Column(
                    children: [
                      // header
                      Row(
                        children: [
                          SizedBox(width: labelW, height: 92),
                          for (int i = 0; i < models.length; i++)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => onSelect(i),
                                child: Container(
                                  width: colW,
                                  height: 92,
                                  decoration: BoxDecoration(
                                    color: i == selectedIndex ? models[i].color.withOpacity(0.07) : Colors.transparent,
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: i == selectedIndex ? models[i].color : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(color: models[i].color, shape: BoxShape.circle),
                                        child: const Icon(Icons.memory_rounded, color: Colors.white, size: 19),
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Text(
                                          models[i].name,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.badgeText(color: models[i].color)
                                              .copyWith(fontSize: 12.5, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      // rows
                      for (int r = 0; r < _kMatrixRows.length; r++)
                        Container(
                          decoration: BoxDecoration(
                            color: r.isEven ? AppColors.bgOffWhite : Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: labelW,
                                height: 48,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    children: [
                                      Icon(_kMatrixRows[r].icon, size: 18, color: AppColors.primaryTeal),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          _kMatrixRows[r].label,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.badgeText(color: AppColors.textDark)
                                              .copyWith(fontSize: 12.5, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              for (int i = 0; i < models.length; i++)
                                cellBg(i, _kMatrixRows[r].has[i] ? _check() : _dash()),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 22),

          // Pump controllers
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FAF3),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: const Color(0xFF22A745).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.settings_rounded, color: Color(0xFF168A34)),
                    Text('Pump Controllers', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
                    for (final n in const ['AWPC-3∅-7S', 'AWPC-3∅ LCD GSM'])
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF168A34),
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                        ),
                        child: Text(n, style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 12)),
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final f in const [
                      'Top Tank Level',
                      'Bottom Tank Level',
                      'Low & High Voltage Protector',
                      'Dry Run Overload Protection',
                      'Delay On Timer',
                      'Dry Run Restart Timer',
                      'Cyclic Timer',
                      'Real Time Cyclic Timer',
                      'Maximum Run Timer',
                      'Single Phasing Preventer',
                      'Dry Run Sensor',
                    ])
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle_rounded, size: 16, color: Color(0xFF22A745)),
                            const SizedBox(width: 6),
                            Text(f,
                                style: AppTextStyles.badgeText(color: AppColors.textDark)
                                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _check(),
              const SizedBox(width: 8),
              Text('Available', style: AppTextStyles.cardDescription().copyWith(fontSize: 12.5)),
              const SizedBox(width: 20),
              _dash(),
              const SizedBox(width: 8),
              Text('Not available', style: AppTextStyles.cardDescription().copyWith(fontSize: 12.5)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  DRAWN CONTROLLER UNIT  (replaces smart_water_controller_unit.png)
//  Canvas: 200 x 280.
//  variant 0: LED  | 1-3: 7-segment | 4: LCD + GSM antenna
// ─────────────────────────────────────────────────────────────
class _ControllerUnitPainter extends CustomPainter {
  final Color accent;
  final int variant;

  const _ControllerUnitPainter({required this.accent, required this.variant});

  void _text(Canvas c, String s, Offset o,
      {double size = 9, Color color = Colors.white, FontWeight w = FontWeight.w700, double spacing = 0.5}) {
    final tp = TextPainter(
      text: TextSpan(
        text: s,
        style: TextStyle(fontSize: size, color: color, fontWeight: w, letterSpacing: spacing),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, Offset(o.dx - tp.width / 2, o.dy));
  }

  void _led(Canvas c, Offset o, Color color, {double r = 4.5}) {
    c.drawCircle(o, r * 2.2, Paint()..color = color.withOpacity(0.35)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5));
    c.drawCircle(o, r, Paint()..color = color);
    c.drawCircle(o.translate(-r * 0.3, -r * 0.3), r * 0.35, Paint()..color = Colors.white.withOpacity(0.7));
  }

  void _digit(Canvas c, Offset o, double w, double h, int d, Color on) {
    const segs = <int, String>{
      0: 'abcdef', 1: 'bc', 2: 'abdeg', 3: 'abcdg', 4: 'bcfg',
      5: 'acdfg', 6: 'acdefg', 7: 'abc', 8: 'abcdefg', 9: 'abcdfg',
    };
    final t = w * 0.17;
    final rects = <String, Rect>{
      'a': Rect.fromLTWH(o.dx + t, o.dy, w - 2 * t, t),
      'g': Rect.fromLTWH(o.dx + t, o.dy + h / 2 - t / 2, w - 2 * t, t),
      'd': Rect.fromLTWH(o.dx + t, o.dy + h - t, w - 2 * t, t),
      'f': Rect.fromLTWH(o.dx, o.dy + t * 1.1, t, h / 2 - t * 1.6),
      'b': Rect.fromLTWH(o.dx + w - t, o.dy + t * 1.1, t, h / 2 - t * 1.6),
      'e': Rect.fromLTWH(o.dx, o.dy + h / 2 + t * 0.5, t, h / 2 - t * 1.6),
      'c': Rect.fromLTWH(o.dx + w - t, o.dy + h / 2 + t * 0.5, t, h / 2 - t * 1.6),
    };
    final onPaint = Paint()..color = on;
    final glow = Paint()..color = on.withOpacity(0.5)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    final offPaint = Paint()..color = on.withOpacity(0.10);
    rects.forEach((k, r) {
      final rr = RRect.fromRectAndRadius(r, Radius.circular(t / 2));
      final isOn = segs[d]!.contains(k);
      if (isOn) c.drawRRect(rr, glow);
      c.drawRRect(rr, isOn ? onPaint : offPaint);
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    // ── antenna (GSM model)
    if (variant == 4) {
      final ant = RRect.fromRectAndRadius(const Rect.fromLTWH(156, 2, 9, 48), const Radius.circular(5));
      canvas.drawRRect(ant, Paint()..color = const Color(0xFF1F2937));
      canvas.drawRRect(
        RRect.fromRectAndRadius(const Rect.fromLTWH(152, 40, 17, 14), const Radius.circular(4)),
        Paint()..color = const Color(0xFF111827),
      );
      for (int i = 1; i <= 3; i++) {
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(160.5, 14), radius: 8.0 + i * 6),
          -math.pi * 0.85,
          math.pi * 0.7,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.6
            ..strokeCap = StrokeCap.round
            ..color = accent.withOpacity(0.7 - i * 0.15),
        );
      }
    }

    // ── body
    final body = RRect.fromRectAndRadius(const Rect.fromLTWH(14, 34, 172, 224), const Radius.circular(20));
    canvas.drawRRect(
      body.shift(const Offset(0, 16)),
      Paint()..color = Colors.black.withOpacity(0.2)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFDDE5EE)],
        ).createShader(body.outerRect),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = const Color(0xFFC3CEDB),
    );
    // accent top band
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        const Rect.fromLTWH(14, 34, 172, 10),
        topLeft: const Radius.circular(20),
        topRight: const Radius.circular(20),
      ),
      Paint()..color = accent,
    );
    // screws
    for (final o in const [Offset(30, 58), Offset(170, 58), Offset(30, 244), Offset(170, 244)]) {
      canvas.drawCircle(o, 4, Paint()..color = const Color(0xFFB4C0CE));
      canvas.drawLine(o.translate(-2.5, 0), o.translate(2.5, 0),
          Paint()..color = const Color(0xFF7A8798)..strokeWidth = 1.2);
    }

    // ── brand
    _text(canvas, 'NIAGARA', const Offset(100, 52), size: 12, color: accent, spacing: 2.4, w: FontWeight.w800);
    _text(canvas, 'WATER LEVEL CONTROLLER', const Offset(100, 67),
        size: 5.8, color: const Color(0xFF64748B), spacing: 0.9, w: FontWeight.w600);

    // ── display window
    const win = Rect.fromLTWH(34, 82, 132, 62);
    final winR = RRect.fromRectAndRadius(win, const Radius.circular(10));
    canvas.drawRRect(winR, Paint()..color = const Color(0xFF0B1220));
    canvas.drawRRect(
      winR,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..color = const Color(0xFF334155),
    );

    if (variant == 0) {
      const xs = [56.0, 84.0, 112.0, 140.0];
      const cols = [Color(0xFF22C55E), Color(0xFF22C55E), Color(0xFFFFB800), Color(0xFFEF4444)];
      const labels = ['TOP', 'LOW', 'AUTO', 'FAULT'];
      for (int i = 0; i < 4; i++) {
        _led(canvas, Offset(xs[i], 108), cols[i], r: 5);
        _text(canvas, labels[i], Offset(xs[i], 124), size: 5.5, color: Colors.white60, spacing: 0.3);
      }
    } else if (variant >= 1 && variant <= 3) {
      final on = variant == 1
          ? const Color(0xFFFF3B30)
          : (variant == 2 ? const Color(0xFFFFB800) : const Color(0xFF34D399));
      const w = 24.0, h = 40.0, gap = 9.0;
      final startX = 100 - (3 * w + 2 * gap) / 2;
      const digits = [2, 3, 0];
      for (int i = 0; i < 3; i++) {
        _digit(canvas, Offset(startX + i * (w + gap), 92), w, h, digits[i], on);
      }
      _text(canvas, 'V', const Offset(155, 128), size: 7, color: on.withOpacity(0.8));
    } else {
      // LCD
      final lcd = RRect.fromRectAndRadius(
        const Rect.fromLTWH(38, 86, 124, 54),
        const Radius.circular(6),
      );
      canvas.drawRRect(
        lcd,
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2AA7C9), Color(0xFF0E6B8A)],
          ).createShader(lcd.outerRect),
      );
      _text(canvas, 'TANK 75%', const Offset(80, 92), size: 11, spacing: 0.6);
      // signal bars
      for (int i = 0; i < 4; i++) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(Rect.fromLTWH(138 + i * 5.0, 102 - i * 3.0 - 6, 3.2, 6 + i * 3.0), const Radius.circular(1)),
          Paint()..color = Colors.white,
        );
      }
      // level bar
      canvas.drawRRect(
        RRect.fromRectAndRadius(const Rect.fromLTWH(46, 110, 108, 9), const Radius.circular(5)),
        Paint()..color = Colors.white.withOpacity(0.25),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(const Rect.fromLTWH(46, 110, 81, 9), const Radius.circular(5)),
        Paint()..color = Colors.white,
      );
      _text(canvas, 'PUMP ON  •  AUTO  •  GSM', const Offset(100, 124), size: 6.5, spacing: 0.4);
    }

    // ── buttons
    const btnY = 172.0;
    final btnLabels = ['MODE', 'UP/DN', 'SET'];
    for (int i = 0; i < 3; i++) {
      final o = Offset(58 + i * 42.0, btnY);
      canvas.drawCircle(o.translate(0, 2.5), 12, Paint()..color = Colors.black.withOpacity(0.15));
      canvas.drawCircle(
        o,
        12,
        Paint()
          ..shader = const RadialGradient(
            center: Alignment(-0.3, -0.4),
            colors: [Color(0xFFF8FAFC), Color(0xFFB9C4D2)],
          ).createShader(Rect.fromCircle(center: o, radius: 12)),
      );
      canvas.drawCircle(
        o,
        12,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = const Color(0xFF94A3B8),
      );
      _text(canvas, btnLabels[i], o.translate(0, 16), size: 5.8, color: const Color(0xFF64748B), spacing: 0.4);
    }

    // ── status LEDs
    if (variant >= 2) {
      const phaseCols = [Color(0xFFEF4444), Color(0xFFFFB800), Color(0xFF3B82F6)];
      const ph = ['R', 'Y', 'B'];
      for (int i = 0; i < 3; i++) {
        _led(canvas, Offset(70 + i * 30.0, 218), phaseCols[i], r: 4);
        _text(canvas, ph[i], Offset(70 + i * 30.0, 226), size: 6, color: const Color(0xFF64748B));
      }
    } else {
      _led(canvas, const Offset(76, 218), const Color(0xFF22C55E), r: 4);
      _text(canvas, 'POWER', const Offset(76, 226), size: 6, color: const Color(0xFF64748B));
      _led(canvas, const Offset(124, 218), accent, r: 4);
      _text(canvas, 'PUMP', const Offset(124, 226), size: 6, color: const Color(0xFF64748B));
    }

    // ── cable glands
    for (final x in const [48.0, 92.0, 136.0]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x, 254, 16, 18), const Radius.circular(4)),
        Paint()..color = const Color(0xFF334155),
      );
      canvas.drawRect(Rect.fromLTWH(x + 3, 254, 10, 3), Paint()..color = const Color(0xFF1E293B));
    }
  }

  @override
  bool shouldRepaint(covariant _ControllerUnitPainter old) =>
      old.accent != accent || old.variant != variant;
}