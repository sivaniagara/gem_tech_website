import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

// ─────────────────────────────────────────────────────────────
//  ASSETS  (copy to assets/images/)
//    sensors_hero.jpg
//    sensor_pressure_transmitter.png   sensor_level_transmitter.png
//    sensor_float_switch.png           sensor_soil_moisture.png
//    sensor_ec.png                     sensor_ph.png
// ─────────────────────────────────────────────────────────────
const String _kSensorsHero = 'assets/images/sensors_hero.jpg';

class SensorOrderItem {
  final String code;
  final String description;
  const SensorOrderItem(this.code, this.description);
}

class SensorModel {
  final String id;
  final String name;
  final String category; // 'Pressure & Level', 'Soil', 'Water Quality'
  final String imagePath;
  final String description;
  final List<String> highlights;
  final String specLabel;
  final String specValue;
  final String extraLabel;
  final String extraValue;
  final Color color;
  final IconData icon;
  final List<SensorOrderItem> orders;

  const SensorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imagePath,
    required this.description,
    required this.highlights,
    required this.specLabel,
    required this.specValue,
    required this.extraLabel,
    required this.extraValue,
    required this.color,
    required this.icon,
    required this.orders,
  });
}

const List<SensorModel> kSensorModels = [
  SensorModel(
    id: 'pressure',
    name: 'Pressure Transmitter',
    category: 'Pressure & Level',
    imagePath: 'assets/images/sensor_pressure_transmitter.png',
    description:
    'A highly stable and reliable pressure sensor for measuring water pressure in irrigation lines and water distribution systems.',
    highlights: [
      'Stable, reliable pressure sensing',
      'Measures water pressure in irrigation lines',
      'Suited to water distribution systems',
      'Standard 4 - 20 mA output signal',
    ],
    specLabel: 'RANGE',
    specValue: '0 - 10 bar',
    extraLabel: 'OUTPUT',
    extraValue: '4 - 20 mA',
    color: AppColors.primaryTeal,
    icon: Icons.speed_rounded,
    orders: [
      SensorOrderItem('OROPS10', 'Oro Pressure transmitter, Range 0-10 bar, Output signal 4 - 20 mA'),
    ],
  ),
  SensorModel(
    id: 'level',
    name: 'Level Transmitter',
    category: 'Pressure & Level',
    imagePath: 'assets/images/sensor_level_transmitter.png',
    description:
    'Determines the level of a tank, cistern or cavity and accurately tracks even small variations in the liquid level.',
    highlights: [
      'Monitors tank, cistern or cavity level',
      'Detects fine variations in liquid level',
      'Ranges of 15, 35 and 100 metres',
      'Standard 4 - 20 mA output signal',
    ],
    specLabel: 'RANGE',
    specValue: 'Up to 100 m',
    extraLabel: 'OUTPUT',
    extraValue: '4 - 20 mA',
    color: Color(0xFF4C6FFF),
    icon: Icons.waves_rounded,
    orders: [
      SensorOrderItem('OROLPS015', 'Oro Level transmitter, Range 0-15 mtr, Output signal 4 - 20 mA'),
      SensorOrderItem('OROLPS035', 'Oro Level transmitter, Range 0-35 mtr, Output signal 4 - 20 mA'),
      SensorOrderItem('OROLPS100', 'Oro Level transmitter, Range 0-100 mtr, Output signal 4 - 20 mA'),
    ],
  ),
  SensorModel(
    id: 'float',
    name: 'Float Switch (OroFloat)',
    category: 'Pressure & Level',
    imagePath: 'assets/images/sensor_float_switch.png',
    description:
    'A simple liquid level float switch for water, sewage and other liquids in shafts, tanks, basins and cisterns. The switching differential is set by the counterweight position on the cable.',
    highlights: [
      'Level switching of various liquids & sewage',
      'Works in shafts, tanks, basins & cisterns',
      'Adjustable differential via cable counterweight',
      'Simple to install and use',
    ],
    specLabel: 'CABLE',
    specValue: '2 / 4 / 8 m',
    extraLabel: 'VARIANTS',
    extraValue: '3 models',
    color: Color(0xFFE5484D),
    icon: Icons.toggle_on_rounded,
    orders: [
      SensorOrderItem('OROFLS102', 'Niagara float switch with 2m cable'),
      SensorOrderItem('OROFLS104', 'Niagara float switch with 4m cable'),
      SensorOrderItem('OROFLS108', 'Niagara float switch with 8m cable'),
    ],
  ),
  SensorModel(
    id: 'soil',
    name: 'Soil Moisture Sensor',
    category: 'Soil',
    imagePath: 'assets/images/sensor_soil_moisture.png',
    description:
    'A granular matrix soil moisture sensor made for agriculture. Place it in different soil types to keep an eye on soil conditions.',
    highlights: [
      'Granular matrix soil moisture sensing',
      'Suitable for various soil types',
      'Designed for agricultural monitoring',
      'Supplied with 5 metre cable',
    ],
    specLabel: 'CABLE',
    specValue: '5 metres',
    extraLabel: 'TYPE',
    extraValue: 'Granular matrix',
    color: Color(0xFFB7791F),
    icon: Icons.grass_rounded,
    orders: [
      SensorOrderItem('OROSMS105', 'Oro Soil Moisture Sensor with 5 Metre Cable'),
    ],
  ),
  SensorModel(
    id: 'ec',
    name: 'Electrical Conductivity Sensor',
    category: 'Water Quality',
    imagePath: 'assets/images/sensor_ec.png',
    description:
    'Measures the concentration of dissolved solids in water. A glass body carries two to four platinum poles, and an alternating current is applied to the measuring cell. Ships with a predetermined factory calibration constant.',
    highlights: [
      'Measures dissolved solids in water',
      'Predetermined factory calibration constant',
      'Glass body with 2 - 4 platinum poles',
      'Range 0 to 10000 µS/cm',
    ],
    specLabel: 'RANGE',
    specValue: '0 - 10000 µS/cm',
    extraLabel: 'POLES',
    extraValue: '2 - 4 platinum',
    color: Color(0xFFFF9F43),
    icon: Icons.bolt_rounded,
    orders: [
      SensorOrderItem('OROECS100', 'Oro Electrical conductivity sensor, 0 to 10000 µS/cm'),
    ],
  ),
  SensorModel(
    id: 'ph',
    name: 'PH Sensor',
    category: 'Water Quality',
    imagePath: 'assets/images/sensor_ph.png',
    description:
    'Built for industrial and agricultural use. A four-ceramic-junction reference helps it resist harsh environments and last longer in pipelines, open tanks and ponds.',
    highlights: [
      'Designed for industrial & agricultural use',
      'Four ceramic junction reference',
      'Resists harsh environments for longer sensor life',
      'Reliable in pipelines, open tanks & ponds',
    ],
    specLabel: 'RANGE',
    specValue: '0 - 14 pH',
    extraLabel: 'JUNCTION',
    extraValue: '4 ceramic',
    color: AppColors.emeraldTeal,
    icon: Icons.science_rounded,
    orders: [
      SensorOrderItem('OROPHS100', 'Oro PH Sensor, 0 to 14 PH'),
    ],
  ),
];

void _copyCode(BuildContext context, String code) {
  Clipboard.setData(ClipboardData(text: code));
  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
    SnackBar(
      content: Text('Copied $code'),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

// ─────────────────────────────────────────────────────────────
//  SECTION
// ─────────────────────────────────────────────────────────────
class SensorsShowcaseSection extends StatefulWidget {
  const SensorsShowcaseSection({super.key});

  @override
  State<SensorsShowcaseSection> createState() => _SensorsShowcaseSectionState();
}

class _SensorsShowcaseSectionState extends State<SensorsShowcaseSection> {
  String selectedCategory = 'All';
  bool isOrderingGuideExpanded = false;

  static const List<String> _categories = ['All', 'Pressure & Level', 'Soil', 'Water Quality'];

  IconData _categoryIcon(String c) {
    switch (c) {
      case 'Pressure & Level':
        return Icons.speed_rounded;
      case 'Soil':
        return Icons.grass_rounded;
      case 'Water Quality':
        return Icons.science_rounded;
      default:
        return Icons.apps_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    final isTablet = size.width >= 600 && size.width < 900;

    final filtered = selectedCategory == 'All'
        ? kSensorModels
        : kSensorModels.where((s) => s.category == selectedCategory).toList();

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
                    TextSpan(text: 'Precision '),
                    TextSpan(text: 'Sensors', style: TextStyle(color: AppColors.primaryTeal)),
                    TextSpan(text: ' for Smart Agriculture'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'Accurate sensing for reliable monitoring and intelligent system control – from soil moisture and water quality to tank level and line pressure.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 64,
                height: 4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primaryTeal, AppColors.accentCyan]),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 48),

              _buildHeroCard(isDesktop),
              const SizedBox(height: 64),

              _buildFilterBar(),
              const SizedBox(height: 16),
              Text(
                'Showing ${filtered.length} sensor${filtered.length == 1 ? '' : 's'}',
                style: AppTextStyles.cardDescription().copyWith(fontSize: 13),
              ),
              const SizedBox(height: 28),

              LayoutBuilder(
                builder: (context, constraints) {
                  int cols = 1;
                  if (constraints.maxWidth >= 1100) {
                    cols = 3;
                  } else if (constraints.maxWidth >= 700) {
                    cols = 2;
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filtered.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      mainAxisExtent: 520,
                      crossAxisSpacing: 28,
                      mainAxisSpacing: 28,
                    ),
                    itemBuilder: (context, index) {
                      final s = filtered[index];
                      return TweenAnimationBuilder<double>(
                        key: ValueKey('${selectedCategory}_${s.id}'),
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(milliseconds: 350 + (index * 70).clamp(0, 500).toInt()),
                        curve: Curves.easeOutCubic,
                        builder: (context, t, child) => Opacity(
                          opacity: t,
                          child: Transform.translate(offset: Offset(0, 24 * (1 - t)), child: child),
                        ),
                        child: _SensorCard(sensor: s, index: kSensorModels.indexOf(s) + 1),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 80),
              _buildWhyTiles(isDesktop),
              const SizedBox(height: 80),
              _buildOrderingGuide(isDesktop),
              const SizedBox(height: 80),
              _buildHelpBanner(isDesktop),
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
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primaryTeal.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(color: AppColors.primaryTeal.withOpacity(0.15), blurRadius: 18, offset: const Offset(0, 6)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.sensors_rounded, color: AppColors.primaryTeal, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'ORO SENSORS  •  MADE FOR SMART AGRICULTURE',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.badgeText(color: AppColors.primaryTeal)
                  .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1.1, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // ── Hero ───────────────────────────────────────────────────
  Widget _buildHeroCard(bool isDesktop) {
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primaryTeal.withOpacity(0.4)),
          ),
          child: Text('ACCURATE • RELIABLE • READY TO CONNECT',
              style: AppTextStyles.badgeText(color: AppColors.primaryTeal)
                  .copyWith(fontSize: 11.5, letterSpacing: 1, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 18),
        Text(
          'Know Exactly What Is Happening – In The Soil, The Pipe And The Tank',
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white)
              .copyWith(fontSize: isDesktop ? 30 : 23, height: 1.25),
        ),
        const SizedBox(height: 14),
        Text(
          'ORO sensors feed real measurements to your controllers, so irrigation and pumping decisions are based on data instead of guesswork.',
          style: AppTextStyles.cardDescription(color: Colors.white70)
              .copyWith(fontSize: isDesktop ? 15 : 14, height: 1.65),
        ),
        const SizedBox(height: 26),
        Container(height: 1, color: Colors.white12),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(child: _HeroStat(value: '6', label: 'Sensor types')),
            Expanded(child: _HeroStat(value: '100 m', label: 'Max level range')),
            Expanded(child: _HeroStat(value: '0-14', label: 'pH range')),
          ],
        ),
      ],
    );

    final image = AspectRatio(
      aspectRatio: 1024 / 672,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 30, offset: const Offset(0, 14))],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              _kSensorsHero,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(
                color: Colors.white10,
                child: const Icon(Icons.sensors_rounded, color: AppColors.primaryTeal, size: 64),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.45)],
                  stops: const [0.55, 1],
                ),
              ),
            ),
            const Positioned(
              left: 14,
              bottom: 14,
              child: _GlassChip(icon: Icons.verified_rounded, label: 'ISO 9001-2015 Certified'),
            ),
            const Positioned(
              right: 14,
              top: 14,
              child: _GlassChip(icon: Icons.eco_rounded, label: 'Made for Smart Agriculture'),
            ),
          ],
        ),
      ),
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
        borderRadius: BorderRadius.circular(32),
        boxShadow: [BoxShadow(color: AppColors.primaryTeal.withOpacity(0.25), blurRadius: 40, offset: const Offset(0, 18))],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryTeal.withOpacity(0.12)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isDesktop ? 40 : 20),
            child: isDesktop
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: text),
                const SizedBox(width: 44),
                Expanded(flex: 6, child: image),
              ],
            )
                : Column(children: [image, const SizedBox(height: 24), text]),
          ),
        ],
      ),
    );
  }

  // ── Filter ─────────────────────────────────────────────────
  Widget _buildFilterBar() {
    return LayoutBuilder(
      builder: (context, c) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: c.maxWidth),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 8))],
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: _categories.map(_buildPill).toList()),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPill(String cat) {
    final isSelected = selectedCategory == cat;
    final count = cat == 'All' ? kSensorModels.length : kSensorModels.where((s) => s.category == cat).length;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => selectedCategory = cat),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(colors: [AppColors.primaryTeal, AppColors.accentCyan])
                : null,
            borderRadius: BorderRadius.circular(30),
            boxShadow: isSelected
                ? [BoxShadow(color: AppColors.primaryTeal.withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6))]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_categoryIcon(cat), size: 17, color: isSelected ? Colors.white : AppColors.textMuted),
              const SizedBox(width: 8),
              Text(
                cat,
                style: AppTextStyles.navLink(isSelected: true).copyWith(
                  fontSize: 14,
                  color: isSelected ? Colors.white : AppColors.textMedium,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.25) : AppColors.bgLightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('$count',
                    style: AppTextStyles.badgeText(color: isSelected ? Colors.white : AppColors.textMuted)
                        .copyWith(fontSize: 11)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Why tiles ──────────────────────────────────────────────
  Widget _buildWhyTiles(bool isDesktop) {
    final items = [
      {'icon': Icons.settings_input_antenna_rounded, 'title': '4 - 20 mA Output', 'desc': 'Pressure and level transmitters use the standard industrial signal for easy controller integration.', 'color': AppColors.primaryTeal},
      {'icon': Icons.tune_rounded, 'title': 'Factory Calibrated', 'desc': 'EC sensors ship with a predetermined factory calibration constant for agricultural use.', 'color': const Color(0xFFFF9F43)},
      {'icon': Icons.shield_rounded, 'title': 'Built For Harsh Conditions', 'desc': 'The pH sensor\'s four ceramic junction reference resists harsh environments and extends sensor life.', 'color': AppColors.emeraldTeal},
      {'icon': Icons.cable_rounded, 'title': 'Cable Options', 'desc': 'Float switches come with 2, 4 or 8 m cable, and the soil moisture sensor with 5 m cable.', 'color': const Color(0xFF6C5CE7)},
    ];

    return Column(
      children: [
        _Heading(
          title: 'Why ORO Sensors',
          subtitle: 'Simple to connect, dependable in the field',
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, c) {
            final cols = isDesktop ? 4 : (c.maxWidth >= 600 ? 2 : 1);
            const spacing = 20.0;
            final width = (c.maxWidth - spacing * (cols - 1)) / cols;
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: items.map((it) {
                final color = it['color'] as Color;
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
                              gradient: hover ? LinearGradient(colors: [color, color.withOpacity(0.7)]) : null,
                              color: hover ? null : color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(it['icon'] as IconData, color: hover ? Colors.white : color, size: 28),
                          ),
                          const SizedBox(height: 18),
                          Text(it['title'] as String, style: AppTextStyles.cardTitle().copyWith(fontSize: 17)),
                          const SizedBox(height: 8),
                          Text(it['desc'] as String,
                              style: AppTextStyles.cardDescription().copyWith(height: 1.55)),
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

  // ── Ordering guide (Collapsible) ───────────────────────────
  Widget _buildOrderingGuide(bool isDesktop) {
    final rows = <List<Object>>[];
    for (final s in kSensorModels) {
      for (final o in s.orders) {
        rows.add([s, o]);
      }
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 28 : 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), AppColors.bgDarkSlate],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 28, offset: const Offset(0, 12))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryTeal.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.receipt_long_rounded, color: AppColors.primaryTeal, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ordering Information',
                        style: AppTextStyles.sectionTitle(isDesktop: false, color: Colors.white)
                            .copyWith(fontSize: isDesktop ? 20 : 17)),
                    const SizedBox(height: 2),
                    Text('Sensor SKU numbers & order codes (${rows.length} SKUs)',
                        style: AppTextStyles.cardDescription(color: Colors.white60)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() => isOrderingGuideExpanded = !isOrderingGuideExpanded);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withOpacity(0.3), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                icon: Icon(
                  isOrderingGuideExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: AppColors.primaryTeal,
                ),
                label: Text(
                  isOrderingGuideExpanded ? 'Hide SKUs' : 'View SKU Codes',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.white),
                ),
              ),
            ],
          ),

          if (isOrderingGuideExpanded) ...[
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                color: Colors.white.withOpacity(0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.white12),
                    child: DataTable(
                      headingRowHeight: 56,
                      dataRowMinHeight: 58,
                      dataRowMaxHeight: 64,
                      columnSpacing: 40,
                      headingRowColor: WidgetStateProperty.all(AppColors.primaryTeal.withOpacity(0.22)),
                      columns: ['Sensor', 'Model Number', 'Description']
                          .map((h) => DataColumn(label: Text(h, style: AppTextStyles.buttonText().copyWith(fontSize: 13.5))))
                          .toList(),
                      rows: List.generate(rows.length, (i) {
                        final s = rows[i][0] as SensorModel;
                        final o = rows[i][1] as SensorOrderItem;
                        return DataRow(
                          color: WidgetStateProperty.all(i.isOdd ? Colors.white.withOpacity(0.04) : Colors.transparent),
                          cells: [
                            DataCell(Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(color: s.color, shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 10),
                                Text(s.name, style: AppTextStyles.buttonText().copyWith(fontSize: 13.5)),
                              ],
                            )),
                            DataCell(Row(
                              children: [
                                Text(o.code,
                                    style: AppTextStyles.buttonText(color: AppColors.accentCyan).copyWith(fontSize: 13.5)),
                                const SizedBox(width: 8),
                                InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () => _copyCode(context, o.code),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.copy_rounded, size: 16, color: Colors.white54),
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Text(o.description,
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
        ],
      ),
    );
  }

  // ── Help banner ────────────────────────────────────────────
  Widget _buildHelpBanner(bool isDesktop) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0B4F8A), AppColors.primaryTeal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [BoxShadow(color: AppColors.primaryTeal.withOpacity(0.35), blurRadius: 36, offset: const Offset(0, 14))],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -100,
            bottom: -140,
            child: Container(
              width: 340,
              height: 340,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
            ),
          ),
          Column(
            children: [
              Text(
                'Not Sure Which Sensor You Need?',
                textAlign: TextAlign.center,
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white)
                    .copyWith(fontSize: isDesktop ? 32 : 22),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Text(
                  'Tell us about your crop, tank or pipeline and our team will help you pick the right sensor and model number.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cardDescription(color: Colors.white.withOpacity(0.9))
                      .copyWith(fontSize: 15, height: 1.55),
                ),
              ),
              const SizedBox(height: 26),
              const Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _ContactChip(icon: Icons.phone_rounded, label: '+91 73737 05677'),
                  _ContactChip(icon: Icons.email_rounded, label: 'info@niagaraautomation.com'),
                  _ContactChip(icon: Icons.language_rounded, label: 'www.niagaraautomation.com'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SENSOR CARD
// ─────────────────────────────────────────────────────────────
class _SensorCard extends StatefulWidget {
  final SensorModel sensor;
  final int index;

  const _SensorCard({required this.sensor, required this.index});

  @override
  State<_SensorCard> createState() => _SensorCardState();
}

class _SensorCardState extends State<_SensorCard> {
  bool _hover = false;

  void _openDetails() {
    showDialog(
      context: context,
      barrierColor: AppColors.bgDarkSlate.withOpacity(0.6),
      builder: (_) => _SensorDetailsDialog(sensor: widget.sensor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.sensor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: _openDetails,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hover ? -8 : 0, 0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: _hover ? s.color.withOpacity(0.55) : AppColors.borderLight,
              width: _hover ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: (_hover ? s.color : Colors.black).withOpacity(_hover ? 0.22 : 0.05),
                blurRadius: _hover ? 36 : 18,
                offset: Offset(0, _hover ? 18 : 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageArea(s),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardTitle().copyWith(fontSize: 18, height: 1.25)),
                      const SizedBox(height: 8),
                      Text(s.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardDescription().copyWith(fontSize: 13.5)),
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: _miniSpec(Icons.straighten_rounded, s.specLabel, s.specValue, s.color)),
                            const SizedBox(width: 10),
                            Expanded(child: _miniSpec(Icons.tune_rounded, s.extraLabel, s.extraValue, s.color)),
                          ],
                        ),
                      ),
                      const Spacer(),
                      _buildCta(s),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageArea(SensorModel s) {
    return SizedBox(
      height: 240,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, 0.1),
                radius: 0.95,
                colors: [Colors.white, s.color.withOpacity(0.12)],
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: _hover ? 210 : 175,
              height: _hover ? 210 : 175,
              decoration: BoxDecoration(shape: BoxShape.circle, color: s.color.withOpacity(_hover ? 0.16 : 0.10)),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 44, 28, 18),
              child: AnimatedScale(
                scale: _hover ? 1.08 : 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Image.asset(
                  s.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (c, e, st) => Center(child: Icon(s.icon, size: 56, color: s.color)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: s.color.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 3))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(s.icon, size: 14, color: s.color),
                  const SizedBox(width: 6),
                  Text(s.category, style: AppTextStyles.badgeText(color: s.color).copyWith(fontSize: 12)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 18,
            child: Text(
              widget.index.toString().padLeft(2, '0'),
              style: AppTextStyles.sectionTitle(isDesktop: true).copyWith(fontSize: 30, color: s.color.withOpacity(0.22)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniSpec(IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.bgOffWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label,
                    style: AppTextStyles.badgeText(color: AppColors.textMuted).copyWith(fontSize: 10, letterSpacing: 0.8)),
                const SizedBox(height: 2),
                Text(value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.badgeText(color: AppColors.textDark).copyWith(fontSize: 12.5, height: 1.25)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCta(SensorModel s) {
    final fg = _hover ? Colors.white : s.color;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: _hover ? LinearGradient(colors: [s.color, Color.lerp(s.color, AppColors.accentCyan, 0.5)!]) : null,
        color: _hover ? null : s.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        boxShadow: _hover
            ? [BoxShadow(color: s.color.withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6))]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Details & Ordering', style: AppTextStyles.buttonText(color: fg)),
          const SizedBox(width: 8),
          AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: Offset(_hover ? 0.35 : 0, 0),
            child: Icon(Icons.arrow_forward_rounded, size: 18, color: fg),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  DETAILS DIALOG
// ─────────────────────────────────────────────────────────────
class _SensorDetailsDialog extends StatelessWidget {
  final SensorModel sensor;

  const _SensorDetailsDialog({required this.sensor});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final isWide = screen.width >= 760;
    final wideHeight = screen.height * 0.88 < 640 ? screen.height * 0.88 : 640.0;

    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 880),
        child: Stack(
          children: [
            if (isWide)
              SizedBox(
                height: wideHeight,
                child: Row(
                  children: [
                    SizedBox(width: 320, child: _media()),
                    Expanded(child: SingleChildScrollView(child: _content(context))),
                  ],
                ),
              )
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: screen.height * 0.88),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [SizedBox(height: 240, child: _media()), _content(context)],
                  ),
                ),
              ),
            Positioned(
              top: 12,
              right: 12,
              child: Material(
                color: Colors.white,
                elevation: 3,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.close_rounded, size: 20, color: AppColors.textDark),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _media() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(radius: 0.9, colors: [Colors.white, sensor.color.withOpacity(0.16)]),
          ),
        ),
        Center(
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(shape: BoxShape.circle, color: sensor.color.withOpacity(0.10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Image.asset(
            sensor.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (c, e, s) => Center(child: Icon(sensor.icon, size: 64, color: sensor.color)),
          ),
        ),
      ],
    );
  }

  Widget _content(BuildContext context) {
    final s = sensor;
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: s.color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(s.icon, size: 14, color: s.color),
                const SizedBox(width: 6),
                Text(s.category.toUpperCase(),
                    style: AppTextStyles.badgeText(color: s.color).copyWith(fontSize: 11, letterSpacing: 1)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(s.name, style: AppTextStyles.sectionTitle(isDesktop: false).copyWith(fontSize: 24)),
          ),
          const SizedBox(height: 10),
          Text(s.description,
              style: AppTextStyles.cardDescription(color: AppColors.textMedium).copyWith(fontSize: 14.5, height: 1.6)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _specTile(s.specLabel, s.specValue)),
              const SizedBox(width: 12),
              Expanded(child: _specTile(s.extraLabel, s.extraValue)),
            ],
          ),
          const SizedBox(height: 24),
          Text('Key Features', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...s.highlights.map(
                (h) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(color: s.color.withOpacity(0.14), shape: BoxShape.circle),
                    child: Icon(Icons.check_rounded, size: 14, color: s.color),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(h,
                        style: AppTextStyles.cardDescription(color: AppColors.textDark).copyWith(fontSize: 13.5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text('Ordering Information', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...s.orders.map(
                (o) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
              decoration: BoxDecoration(
                color: AppColors.bgOffWhite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: s.color, borderRadius: BorderRadius.circular(8)),
                    child: Text(o.code,
                        style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 12, letterSpacing: 0.4)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(o.description,
                        style: AppTextStyles.cardDescription(color: AppColors.textMedium).copyWith(fontSize: 13, height: 1.4)),
                  ),
                  IconButton(
                    tooltip: 'Copy model number',
                    icon: const Icon(Icons.copy_rounded, size: 18, color: AppColors.textMuted),
                    onPressed: () => _copyCode(context, o.code),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _specTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: sensor.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: sensor.color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.badgeText(color: AppColors.textMuted).copyWith(fontSize: 10.5, letterSpacing: 0.8)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.cardTitle().copyWith(fontSize: 15)),
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
    border: Border.all(color: hover ? color.withOpacity(0.55) : AppColors.borderLight, width: hover ? 1.5 : 1),
    boxShadow: [
      BoxShadow(
        color: (hover ? color : Colors.black).withOpacity(hover ? 0.2 : 0.04),
        blurRadius: hover ? 30 : 16,
        offset: Offset(0, hover ? 14 : 6),
      ),
    ],
  );
}

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

  const _Heading({required this.title, required this.subtitle, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop).copyWith(fontSize: isDesktop ? 36 : 24)),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(subtitle,
              textAlign: TextAlign.center, style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop)),
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

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style: AppTextStyles.sectionTitle(isDesktop: true, color: AppColors.primaryTeal).copyWith(fontSize: 24)),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.cardDescription(color: Colors.white60).copyWith(fontSize: 12)),
      ],
    );
  }
}

class _GlassChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GlassChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgDarkSlate.withOpacity(0.65),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primaryTeal, size: 16),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.badgeText(color: Colors.white).copyWith(fontSize: 11.5)),
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
        borderRadius: BorderRadius.circular(30),
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