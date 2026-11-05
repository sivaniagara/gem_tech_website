import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_design.dart';

class ValveModel {
  final String id;
  final String name;
  final String category; // 'Mainline', 'Pressure Control', 'Pilots & Solenoids', 'Filtration'
  final String imagePath;
  final String size;
  final String connection;
  final String pressure;
  final String material;
  final String description;
  final List<String> highlights;
  final String? kvFlow;

  const ValveModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imagePath,
    required this.size,
    required this.connection,
    required this.pressure,
    required this.material,
    required this.description,
    required this.highlights,
    this.kvFlow,
  });
}

const List<ValveModel> kValveModels = [
  ValveModel(
    id: '100_series',
    name: '100 Series Control Valve',
    category: 'Mainline',
    imagePath: 'assets/images/valve_100_series.png',
    size: '2" BSP Threaded',
    connection: 'BSP Threaded',
    pressure: '0.5 - 10 Bar (7 - 150 PSI)',
    material: 'Glass Filled Nylon',
    description: 'Compact and durable diaphragm-actuated hydraulic valve engineered for reliable water control in standard 2" field zone lines.',
    highlights: [
      'Low power consumption & high dirt resistance',
      'Optimized globe-pattern low head loss',
      'Manual override provision for emergency control',
      'Full compatibility with ORO GEM controllers',
    ],
    kvFlow: '56 m³/hr @ 0.3 Bar loss',
  ),
  ValveModel(
    id: '200_series',
    name: '200 Series High-Flow Valve',
    category: 'Mainline',
    imagePath: 'assets/images/valve_200_series.png',
    size: '3" & 4" (Threaded / Flanged)',
    connection: 'BSP Threaded / Flanged',
    pressure: '0.5 - 10 Bar (7 - 150 PSI)',
    material: 'Glass Filled Nylon',
    description: 'High-capacity hydraulic diaphragm control valve built for main headers and large agricultural irrigation zones up to 190 m³/hr flow rate.',
    highlights: [
      'Maximum flow capacity up to 190 m³/hr',
      'Drip-tight closure under fluctuating line pressure',
      'Reinforced diaphragm for long operating lifespan',
      'Corrosion-resistant and UV stable construction',
    ],
    kvFlow: 'Up to 190 m³/hr',
  ),
  ValveModel(
    id: '300_series',
    name: '300 Series Precision Valve',
    category: 'Mainline',
    imagePath: 'assets/images/valve_300_series.png',
    size: '2" & 2.5" BSP Threaded',
    connection: 'BSP Threaded',
    pressure: '0.5 - 10 Bar (7 - 150 PSI)',
    material: 'Glass Filled Nylon',
    description: 'Versatile globe-pattern diaphragm valve delivering smooth modulation from near-zero to full flow for precision fertigation and drip lines.',
    highlights: [
      'Smooth flow modulation near zero to full capacity',
      'Diaphragm valve design with visible inspection body',
      'High resistance to aggressive agricultural chemicals',
      'Stable pressure control under all flow conditions',
    ],
    kvFlow: '65 m³/hr @ 0.3 Bar loss',
  ),
  ValveModel(
    id: 'psv',
    name: 'Pressure Sustaining Valve (PSV)',
    category: 'Pressure Control',
    imagePath: 'assets/images/valve_psv.png',
    size: '2.5" Threaded (NPSVDN60T)',
    connection: 'BSP Threaded',
    pressure: '0.5 - 10 Bar (Preset Upstream)',
    material: 'Glass Filled Nylon',
    description: 'Hydraulically operated valve that maintains a preset minimum upstream (back) pressure, preventing system depressurization and pump overload.',
    highlights: [
      'Prevents line collapse and pump over-demand',
      'Opens fully when line pressure exceeds set point',
      'Immediate, accurate, and repeatable response',
      'Smooth drip-tight closing without water hammer',
    ],
  ),
  ValveModel(
    id: 'qprv',
    name: 'Quick Pressure Relief Valve (QPRV)',
    category: 'Pressure Control',
    imagePath: 'assets/images/valve_qprv.png',
    size: '2.5" Threaded (NPRVDN60T)',
    connection: 'BSP Threaded',
    pressure: 'Instant relief above set point',
    material: 'Glass Filled Nylon',
    description: 'Safeguards piping networks from pressure surges by instantly opening to dump excess pressure and closing smoothly once pressure normalizes.',
    highlights: [
      'Instantaneous surge protection for main lines',
      'High repeatability and zero drip leakage',
      'Adjustable pressure setting (1 - 6 Bar)',
      'Essential protection for drip lines & pumps',
    ],
  ),
  ValveModel(
    id: 'psp_pilot',
    name: 'Pressure Sustaining Pilot (PSP)',
    category: 'Pilots & Solenoids',
    imagePath: 'assets/images/valve_psp_pilot.png',
    size: 'Direct Acting 2-Way Pilot',
    connection: 'Hydraulic Micro-tubing',
    pressure: '1 - 6 Bar Adjustable',
    material: 'Heavy-Duty Brass & Polymers',
    description: '2-way direct acting pilot valve actuated by a responsive diaphragm to maintain equilibrium between hydraulic and spring set forces.',
    highlights: [
      'Ultra-precise spring adjustment (1-6 bar)',
      'High sensitivity to pressure variations',
      'Works with all standard hydraulic control valves',
      'Long-life stainless steel springs and diaphragm',
    ],
  ),
  ValveModel(
    id: 'solenoid_3way',
    name: '3-Way Solenoid with Base',
    category: 'Pilots & Solenoids',
    imagePath: 'assets/images/valve_solenoid_3way.png',
    size: 'Standard Hydraulic Base',
    connection: 'Quick Fit Hydraulic Connectors',
    pressure: 'Up to 10 Bar',
    material: 'UV Stabilized Polymer',
    description: 'Low-power latching electrical solenoid unit with integrated hydraulic base and manual override handle for automated valve switching.',
    highlights: [
      'Ultra-low power consumption (Latching option)',
      'Manual override handle for local operation',
      'High resistance to dirt and debris in water',
      'Seamless wiring to battery or solar controllers',
    ],
  ),
  ValveModel(
    id: 'backflush',
    name: 'Back Flush Valve (BFV)',
    category: 'Filtration',
    imagePath: 'assets/images/valve_backflush.png',
    size: '2" & 3" Multi-Port',
    connection: 'Victaulic / Threaded',
    pressure: 'Up to 10 Bar',
    material: 'Glass Filled Nylon / Metal Option',
    description: 'High-performance 3-way direction-reversing valve specifically engineered for automated backflushing of disc and sand media filter batteries.',
    highlights: [
      'Rapid direction switching for automatic cleaning',
      'Low backwash pressure requirements',
      'Fits both disc and sand media filter systems',
      'Durable construction for heavy continuous cycling',
    ],
  ),
  ValveModel(
    id: 'niagara_wlc_1p',
    name: 'NIAGARA AWLC Water Level Controller',
    category: 'Smart Water Control',
    imagePath: 'assets/images/smart_water_controller_unit.png',
    size: '1∅ Single Phase',
    connection: 'Direct Pump Control',
    pressure: '180V - 260V AC',
    material: 'Microcontroller Enclosure',
    description: 'Automatic water level controller monitoring overhead tank and sump levels to prevent dry run and water overflow.',
    highlights: [
      'Automatic pump ON/OFF based on water levels',
      'Prevents water overflow & dry run pump damage',
      '7-Segment digital display & voltage protection',
      'Ideal for residential homes, villas, & apartments',
    ],
  ),
  ValveModel(
    id: 'niagara_wlc_3p_gsm',
    name: 'NIAGARA AWPC 3-Phase LCD GSM Controller',
    category: 'Smart Water Control',
    imagePath: 'assets/images/smart_water_control_models.png',
    size: '3∅ Three Phase (Up to 15 HP)',
    connection: 'Indirect Load / Starter',
    pressure: '300V - 470V AC',
    material: 'Industrial Grade Enclosure',
    description: 'Flagship 3-phase smart pump controller with LCD display, single-phasing preventer, and GSM mobile automation.',
    highlights: [
      'Built-in digital single phasing preventer',
      'Current sensing dry run & overload protection',
      'GSM SMS / mobile app remote monitoring',
      'Time scheduling & automatic pump control',
    ],
  ),
];

// ─────────────────────────────────────────────────────────────
//  Category styling – each category gets its own accent colour
//  (the orange matches the dial on the real valves)
// ─────────────────────────────────────────────────────────────
class _CategoryStyle {
  final Color color;
  final IconData icon;
  const _CategoryStyle(this.color, this.icon);
}

_CategoryStyle _styleFor(String category) {
  switch (category) {
    case 'Mainline':
      return const _CategoryStyle(AppColors.primaryTeal, Icons.water_rounded);
    case 'Smart Water Control':
      return const _CategoryStyle(Color(0xFF00ADFF), Icons.water_drop_rounded);
    case 'Pressure Control':
      return const _CategoryStyle(Color(0xFF6C5CE7), Icons.speed_rounded);
    case 'Pilots & Solenoids':
      return const _CategoryStyle(Color(0xFFFF7A45), Icons.bolt_rounded);
    case 'Filtration':
      return const _CategoryStyle(AppColors.emeraldTeal, Icons.filter_alt_rounded);
    default:
      return const _CategoryStyle(AppColors.primaryTeal, Icons.apps_rounded);
  }
}

/// '2.5" Threaded (NPSVDN60T)' -> '2.5" Threaded'
String _shortValue(String v) => v.split('(').first.trim();

// ─────────────────────────────────────────────────────────────
//  SECTION
// ─────────────────────────────────────────────────────────────
class ValveShowcaseSection extends StatefulWidget {
  const ValveShowcaseSection({super.key});

  @override
  State<ValveShowcaseSection> createState() => _ValveShowcaseSectionState();
}

class _ValveShowcaseSectionState extends State<ValveShowcaseSection> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Mainline',
    'Smart Water Control',
    'Pressure Control',
    'Pilots & Solenoids',
    'Filtration',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    final isTablet = size.width >= 600 && size.width < 900;

    final filteredValves = selectedCategory == 'All'
        ? kValveModels
        : kValveModels.where((v) => v.category == selectedCategory).toList();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.heroBgLight, AppColors.bgOffWhite],
          stops: [0.0, 0.3],
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

              // Heading with a highlighted second line
              Text.rich(
                TextSpan(
                  style: AppTextStyles.sectionTitle(isDesktop: isDesktop)
                      .copyWith(fontSize: isDesktop ? 44 : 28),
                  children: const [
                    TextSpan(text: 'Advanced Irrigation '),
                    TextSpan(
                      text: 'Control Valves',
                      style: TextStyle(color: AppColors.primaryTeal),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'Engineered with glass-filled nylon bodies, diaphragm-actuated hydraulic technology, and 10 Bar working pressure for precision water flow management.',
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

              const SizedBox(height: 40),
              _buildKeyStatsBar(isDesktop),
              const SizedBox(height: 48),

              _buildFilterBar(),
              const SizedBox(height: 16),
              Text(
                'Showing ${filteredValves.length} product${filteredValves.length == 1 ? '' : 's'}',
                style: AppTextStyles.cardDescription().copyWith(fontSize: 13),
              ),
              const SizedBox(height: 28),

              // Valves Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 1100) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 700) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredValves.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      // fixed height => no more empty gaps inside cards
                      mainAxisExtent: 520,
                      crossAxisSpacing: 28,
                      mainAxisSpacing: 28,
                    ),
                    itemBuilder: (context, index) {
                      final v = filteredValves[index];
                      // Cards fade & slide in (staggered) whenever the filter changes
                      return TweenAnimationBuilder<double>(
                        key: ValueKey('${selectedCategory}_${v.id}'),
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(
                          milliseconds: 350 + (index * 70).clamp(0, 500).toInt(),
                        ),
                        curve: Curves.easeOutCubic,
                        builder: (context, t, child) => Opacity(
                          opacity: t,
                          child: Transform.translate(
                            offset: Offset(0, 24 * (1 - t)),
                            child: child,
                          ),
                        ),
                        child: _ValveCard(
                          valve: v,
                          index: kValveModels.indexOf(v) + 1,
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 72),
              _buildComparisonSection(isDesktop),
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
          const Icon(Icons.verified_rounded, color: AppColors.primaryTeal, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'ISO 9001-2015 certified manufacturing',
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

  // ── Key stats (dark feature strip) ─────────────────────────
  Widget _buildKeyStatsBar(bool isDesktop) {
    final stats = [
      {'icon': Icons.security_rounded, 'title': '10 Bar Pressure', 'subtitle': 'Tested 7-150 PSI working range'},
      {'icon': Icons.shield_rounded, 'title': 'Glass-Filled Nylon', 'subtitle': 'Corrosion resistant & UV stable'},
      {'icon': Icons.opacity_rounded, 'title': 'Low Head Loss', 'subtitle': 'Optimized globe flow path'},
      {'icon': Icons.power_settings_new_rounded, 'title': 'Manual Override', 'subtitle': 'Zero downtime emergency operation'},
    ];

    Widget item(Map<String, Object> s) {
      return Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryTeal.withOpacity(0.35),
                  AppColors.accentCyan.withOpacity(0.15),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(s['icon'] as IconData, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s['title'] as String,
                  style: AppTextStyles.cardTitle(color: Colors.white).copyWith(fontSize: 14.5),
                ),
                const SizedBox(height: 3),
                Text(
                  s['subtitle'] as String,
                  style: AppTextStyles.cardDescription(color: Colors.white60).copyWith(fontSize: 12, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 14 : 16,
          vertical: isDesktop ? 22 : 18,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.bgDarkSlate, Color(0xFF0F172A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: AppShadows.md,
        ),
        child: LayoutBuilder(
          builder: (context, c) {
            if (isDesktop) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < stats.length; i++) ...[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: item(stats[i]),
                        ),
                      ),
                      if (i < stats.length - 1)
                        Container(width: 1, color: Colors.white12),
                    ],
                  ],
                ),
              );
            }
            final isSmallMobile = c.maxWidth < 550;
            final w = isSmallMobile ? c.maxWidth : (c.maxWidth - 16) / 2;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: stats.map((s) => SizedBox(width: w, child: item(s))).toList(),
            );
          },
        ),
      ),
    );
  }

  // ── Filter pills ───────────────────────────────────────────
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
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: AppShadows.md,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: categories.map(_buildFilterPill).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterPill(String cat) {
    final isSelected = selectedCategory == cat;
    final count = cat == 'All'
        ? kValveModels.length
        : kValveModels.where((v) => v.category == cat).length;
    final icon = cat == 'All' ? Icons.apps_rounded : _styleFor(cat).icon;

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
                ? const LinearGradient(
              colors: [AppColors.primaryTeal, AppColors.accentCyan],
            )
                : null,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            boxShadow: isSelected
                ? AppShadows.md
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 17,
                color: isSelected ? Colors.white : AppColors.textMuted,
              ),
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
                  color: isSelected
                      ? Colors.white.withOpacity(0.25)
                      : AppColors.bgLightGrey,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Text(
                  '$count',
                  style: AppTextStyles.badgeText(
                    color: isSelected ? Colors.white : AppColors.textMuted,
                  ).copyWith(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Comparison matrix ──────────────────────────────────────
  Widget _buildComparisonSection(bool isDesktop) {
    const headers = [
      'Series',
      'Valve Sizes',
      'Dimensions (L×W×H)',
      'Working Pressure',
      'Max Flow Rate',
      'Kv Factor',
    ];
    const rows = [
      ['100 Series', '2" (50mm)', '6" × 5" × 9"', '0.5 - 10 Bar', '26 m³/hr', '56 metric'],
      ['300 Series (DN50/60)', '2" & 2.5" (60mm)', '6" × 5" × 9"', '0.5 - 10 Bar', '32 - 60 m³/hr', '65 metric'],
      ['200 Series', '3" HF & 4" (80/100mm)', '12" × 7" × 10" / 14" × 9" × 12"', '0.5 - 10 Bar', '120 - 190 m³/hr', '190 metric'],
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
                child: const Icon(Icons.table_chart_rounded, color: AppColors.primaryTeal, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Technical Specifications Matrix',
                      style: AppTextStyles.sectionTitle(isDesktop: false, color: Colors.white)
                          .copyWith(fontSize: isDesktop ? 22 : 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Comparative analysis of Niagara / ORO GEM Series 100, 200, and 300 control valves',
                      style: AppTextStyles.cardDescription(color: Colors.white60),
                    ),
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
                    dataRowMaxHeight: 64,
                    columnSpacing: 36,
                    headingRowColor: WidgetStateProperty.all(
                      AppColors.primaryTeal.withOpacity(0.22),
                    ),
                    columns: headers
                        .map(
                          (h) => DataColumn(
                        label: Text(
                          h,
                          style: AppTextStyles.buttonText().copyWith(fontSize: 13.5),
                        ),
                      ),
                    )
                        .toList(),
                    rows: List.generate(rows.length, (i) {
                      final r = rows[i];
                      return DataRow(
                        color: WidgetStateProperty.all(
                          i.isOdd ? Colors.white.withOpacity(0.04) : Colors.transparent,
                        ),
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentCyan,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  r[0],
                                  style: AppTextStyles.buttonText().copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          for (int j = 1; j < r.length; j++)
                            DataCell(
                              Text(
                                r[j],
                                style: AppTextStyles.cardDescription(color: Colors.white70)
                                    .copyWith(fontSize: 13.5),
                              ),
                            ),
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
}

// ─────────────────────────────────────────────────────────────
//  PRODUCT CARD
// ─────────────────────────────────────────────────────────────
class _ValveCard extends StatefulWidget {
  final ValveModel valve;
  final int index;

  const _ValveCard({required this.valve, required this.index});

  @override
  State<_ValveCard> createState() => _ValveCardState();
}

class _ValveCardState extends State<_ValveCard> {
  bool _hover = false;

  void _openDetails() {
    showDialog(
      context: context,
      barrierColor: AppColors.bgDarkSlate.withOpacity(0.6),
      builder: (_) => _ValveDetailsDialog(valve: widget.valve),
    );
  }

  @override
  Widget build(BuildContext context) {
    final valve = widget.valve;
    final style = _styleFor(valve.category);

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
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: _hover ? style.color.withOpacity(0.55) : AppColors.borderLight,
              width: _hover ? 1.5 : 1,
            ),
            boxShadow: AppShadows.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageArea(valve, style),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valve.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardTitle().copyWith(fontSize: 18, height: 1.25),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        valve.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardDescription().copyWith(fontSize: 13.5),
                      ),
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _miniSpec(Icons.straighten_rounded, 'SIZE',
                                  _shortValue(valve.size), style.color),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _miniSpec(Icons.speed_rounded, 'PRESSURE',
                                  _shortValue(valve.pressure), style.color),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      _buildCta(style),
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

  Widget _buildImageArea(ValveModel valve, _CategoryStyle style) {
    return SizedBox(
      height: 230,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // soft tinted background
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, 0.1),
                radius: 0.95,
                colors: [Colors.white, style.color.withOpacity(0.12)],
              ),
            ),
          ),
          // glowing disc behind the valve (grows on hover)
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: _hover ? 210 : 175,
              height: _hover ? 210 : 175,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.color.withOpacity(_hover ? 0.16 : 0.10),
              ),
            ),
          ),
          // product image
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 18),
              child: AnimatedScale(
                scale: _hover ? 1.08 : 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Image.asset(
                  valve.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Icon(Icons.water_rounded, size: 56, color: style.color),
                  ),
                ),
              ),
            ),
          ),
          // category pill
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.sm,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(style.icon, size: 14, color: style.color),
                  const SizedBox(width: 6),
                  Text(
                    valve.category,
                    style: AppTextStyles.badgeText(color: style.color).copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          // big faded index number
          Positioned(
            top: 10,
            right: 18,
            child: Text(
              widget.index.toString().padLeft(2, '0'),
              style: AppTextStyles.sectionTitle(isDesktop: true)
                  .copyWith(fontSize: 30, color: style.color.withOpacity(0.22)),
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
        borderRadius: BorderRadius.circular(AppRadius.md),
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
                Text(
                  label,
                  style: AppTextStyles.badgeText(color: AppColors.textMuted)
                      .copyWith(fontSize: 10, ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.badgeText(color: AppColors.textDark)
                      .copyWith(fontSize: 12.5, height: 1.25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCta(_CategoryStyle style) {
    final fg = _hover ? Colors.white : style.color;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: _hover
            ? LinearGradient(
          colors: [style.color, Color.lerp(style.color, AppColors.accentCyan, 0.5)!],
        )
            : null,
        color: _hover ? null : style.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: _hover
            ? AppShadows.md
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Specs & Details', style: AppTextStyles.buttonText(color: fg)),
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
class _ValveDetailsDialog extends StatelessWidget {
  final ValveModel valve;

  const _ValveDetailsDialog({required this.valve});

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(valve.category);
    final screen = MediaQuery.of(context).size;
    final isWide = screen.width >= 760;
    final wideHeight = screen.height * 0.88 < 620 ? screen.height * 0.88 : 620.0;

    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 880),
        child: Stack(
          children: [
            if (isWide)
              SizedBox(
                height: wideHeight,
                child: Row(
                  children: [
                    SizedBox(width: 320, child: _media(style)),
                    Expanded(
                      child: SingleChildScrollView(child: _content(context, style)),
                    ),
                  ],
                ),
              )
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: screen.height * 0.88),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 230, child: _media(style)),
                      _content(context, style),
                    ],
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

  Widget _media(_CategoryStyle style) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, 0),
              radius: 0.9,
              colors: [Colors.white, style.color.withOpacity(0.16)],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: style.color.withOpacity(0.10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28),
          child: Image.asset(
            valve.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(Icons.water_rounded, size: 64, color: style.color)),
          ),
        ),
      ],
    );
  }

  Widget _content(BuildContext context, _CategoryStyle style) {
    final specs = <List<Object>>[
      [Icons.straighten_rounded, 'Valve Size', valve.size],
      [Icons.settings_input_component_rounded, 'Connection', valve.connection],
      [Icons.speed_rounded, 'Pressure Rating', valve.pressure],
      [Icons.layers_rounded, 'Body Construction', valve.material],
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: style.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(style.icon, size: 14, color: style.color),
                const SizedBox(width: 6),
                Text(
                  valve.category,
                  style: AppTextStyles.badgeText(color: style.color)
                      .copyWith(fontSize: 11, ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              valve.name,
              style: AppTextStyles.sectionTitle(isDesktop: false).copyWith(fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            valve.description,
            style: AppTextStyles.cardDescription(color: AppColors.textMedium)
                .copyWith(fontSize: 14.5, height: 1.6),
          ),

          if (valve.kvFlow != null) ...[
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [style.color.withOpacity(0.14), style.color.withOpacity(0.04)],
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: style.color.withOpacity(0.25)),
              ),
              child: Row(
                children: [
                  Icon(Icons.waves_rounded, color: style.color, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FLOW CAPACITY (Kv)',
                          style: AppTextStyles.badgeText(color: AppColors.textMuted)
                              .copyWith(fontSize: 10.5, ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          valve.kvFlow!,
                          style: AppTextStyles.cardTitle().copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 24),
          Text('Technical Specifications', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth >= 400 ? (c.maxWidth - 12) / 2 : c.maxWidth;
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: specs.map((s) {
                  return SizedBox(
                    width: w,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.bgOffWhite,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: style.color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                            child: Icon(s[0] as IconData, size: 18, color: style.color),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (s[1] as String),
                                  style: AppTextStyles.badgeText(color: AppColors.textMuted)
                                      .copyWith(fontSize: 10, ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  s[2] as String,
                                  style: AppTextStyles.badgeText(color: AppColors.textDark)
                                      .copyWith(fontSize: 13, height: 1.3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 24),
          Text('Key Engineering Highlights', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...valve.highlights.map(
                (h) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: style.color.withOpacity(0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check_rounded, size: 14, color: style.color),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      h,
                      style: AppTextStyles.cardDescription(color: AppColors.textDark)
                          .copyWith(fontSize: 13.5),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              onTap: () => Navigator.pop(context),
              child: Ink(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [style.color, Color.lerp(style.color, AppColors.accentCyan, 0.5)!],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: AppShadows.sm,
                ),
                child: Center(
                  child: Text('Close Details', style: AppTextStyles.buttonText()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}