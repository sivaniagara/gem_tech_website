import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

// ─────────────────────────────────────────────────────────────
//  NUTRIFLOW™ 400 - ASSETS (rename your images to these names in assets/images/)
//
//  1. nutriflow_hero.png       -> Main product photo of NutriFlow 400 system
//  2. nutriflow_3ch_model.png   -> 3 Channel model photo (2 Fert + 1 Acid)
//  3. nutriflow_6ch_model.png   -> 6 Channel model photo (5 Fert + 1 Acid)
//  4. nutriflow_controller.png  -> Controller display unit photo
//  5. fertigation_concept.png   -> Fertigation concept / root zone diagram
// ─────────────────────────────────────────────────────────────
const String _kHeroImage = 'assets/images/nutriflow_hero.png';
const String _k3ChImage = 'assets/images/nutriflow_3ch_model.png';
const String _k6ChImage = 'assets/images/nutriflow_6ch_model.png';
const String _kControllerImage = 'assets/images/nutriflow_controller.png';
const String _kConceptImage = 'assets/images/fertigation_concept.png';

class FertigationOrderItem {
  final String code;
  final String description;
  final String channels;
  final String dosing;
  final String pressure;

  const FertigationOrderItem({
    required this.code,
    required this.description,
    required this.channels,
    required this.dosing,
    required this.pressure,
  });
}

const List<FertigationOrderItem> kFertigationOrders = [
  // 3 Channel Models
  FertigationOrderItem(
    code: '450200067',
    description: 'Fertigation 3Channel - 1 Dosing - 4 bar',
    channels: '3 Channel',
    dosing: '1 Dosing',
    pressure: '4 bar',
  ),
  FertigationOrderItem(
    code: '450200068',
    description: 'Fertigation 3Channel - 2 Dosing - 4 bar',
    channels: '3 Channel',
    dosing: '2 Dosing',
    pressure: '4 bar',
  ),
  FertigationOrderItem(
    code: '450200073',
    description: 'Fertigation 3Channel - 1 Dosing - 6.5 bar',
    channels: '3 Channel',
    dosing: '1 Dosing',
    pressure: '6.5 bar',
  ),
  FertigationOrderItem(
    code: '450200074',
    description: 'Fertigation 3Channel - 2 Dosing - 6.5 bar',
    channels: '3 Channel',
    dosing: '2 Dosing',
    pressure: '6.5 bar',
  ),

  // 6 Channel Models
  FertigationOrderItem(
    code: '450200070',
    description: 'Fertigation 6Channel - 4 Dosing - 4 bar',
    channels: '6 Channel',
    dosing: '4 Dosing',
    pressure: '4 bar',
  ),
  FertigationOrderItem(
    code: '450200071',
    description: 'Fertigation 6Channel - 5 Dosing - 4 bar',
    channels: '6 Channel',
    dosing: '5 Dosing',
    pressure: '4 bar',
  ),
  FertigationOrderItem(
    code: '450200072',
    description: 'Fertigation 6Channel - 6 Dosing - 4 bar',
    channels: '6 Channel',
    dosing: '6 Dosing',
    pressure: '4 bar',
  ),
  FertigationOrderItem(
    code: '450200077',
    description: 'Fertigation 6Channel - 4 Dosing - 6.5 bar',
    channels: '6 Channel',
    dosing: '4 Dosing',
    pressure: '6.5 bar',
  ),
  FertigationOrderItem(
    code: '450200078',
    description: 'Fertigation 6Channel - 5 Dosing - 6.5 bar',
    channels: '6 Channel',
    dosing: '5 Dosing',
    pressure: '6.5 bar',
  ),
  FertigationOrderItem(
    code: '450200079',
    description: 'Fertigation 6Channel - 6 Dosing - 6.5 bar',
    channels: '6 Channel',
    dosing: '6 Dosing',
    pressure: '6.5 bar',
  ),
];

class FertigationModelDetail {
  final String name;
  final String subtitle;
  final String ratio;
  final String imagePath;
  final Color themeColor;
  final List<String> specs;

  const FertigationModelDetail({
    required this.name,
    required this.subtitle,
    required this.ratio,
    required this.imagePath,
    required this.themeColor,
    required this.specs,
  });
}

const List<FertigationModelDetail> kNutriFlowModels = [
  FertigationModelDetail(
    name: '3 Channel Model',
    subtitle: 'Ideal for medium-scale precision dosing',
    ratio: '2 Fert + 1 Acid',
    imagePath: _k3ChImage,
    themeColor: Color(0xFF00ADFF),
    specs: [
      '2 Fertilizer channels + 1 Acid channel',
      'Available in 4 bar & 6.5 bar pressure ratings',
      'Venturi-based precision suction mechanism',
      'Expandable modular design for future upgrades',
      'Supports EC & pH automation feedback',
    ],
  ),
  FertigationModelDetail(
    name: '6 Channel Model',
    subtitle: 'High-capacity commercial fertigation skid',
    ratio: '5 Fert + 1 Acid',
    imagePath: _k6ChImage,
    themeColor: Color(0xFF10B981),
    specs: [
      '5 Fertilizer channels + 1 Acid channel',
      'Available in 4 bar & 6.5 bar pressure ratings',
      'Multi-recipe simultaneous nutrient injection',
      'Strong aluminum frame (SS & steel construction)',
      'Full sensor-based EC & pH closed-loop control',
    ],
  ),
];

class FertigationShowcaseSection extends StatefulWidget {
  const FertigationShowcaseSection({super.key});

  @override
  State<FertigationShowcaseSection> createState() =>
      _FertigationShowcaseSectionState();
}

class _FertigationShowcaseSectionState
    extends State<FertigationShowcaseSection> {
  int _selectedModelIndex = 0;
  String _orderFilter = 'All'; // 'All', '3 Channel', '6 Channel'
  bool _isOrderingTableExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      color: AppColors.bgOffWhite,
      child: Column(
        children: [
          // 1. Top Hero Showcase Banner
          _buildHeroHeader(isDesktop),

          const SizedBox(height: 60),

          // Main Content Container
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60 : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Key Pillars Grid
                _buildPillarsGrid(isDesktop),

                const SizedBox(height: 60),

                // 3. Understanding Fertigation Section
                _buildUnderstandingFertigation(isDesktop),

                const SizedBox(height: 60),

                // 4. Model Selector (3CH vs 6CH)
                _buildModelSelector(isDesktop),

                const SizedBox(height: 60),

                // 5. Controller Key Features
                _buildControllerFeatures(isDesktop),

                const SizedBox(height: 60),

                // 6. Ordering Information Table
                _buildOrderingTable(isDesktop),

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
            Color(0xFF062826),
            Color(0xFF0F5257),
            Color(0xFF0A3C40),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Background Tech Grid Lines Accent
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
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
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 12,
                        child: _buildHeroLeftText(isDesktop),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 10,
                        child: _buildHeroRightImage(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildHeroLeftText(isDesktop),
                      const SizedBox(height: 30),
                      _buildHeroRightImage(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroLeftText(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF00ADFF).withOpacity(0.18),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF00ADFF).withOpacity(0.4),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.science_rounded, size: 16, color: Color(0xFF00ADFF)),
              SizedBox(width: 8),
              Text(
                'SMART FERTIGATION SYSTEM',
                style: TextStyle(
                  color: Color(0xFF00ADFF),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Title
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'NutriFlow™ 400\n',
                style: AppTextStyles.heroHeading(isDesktop: isDesktop).copyWith(
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              TextSpan(
                text: 'Smart Dosing Skid – 400 LPH Capacity',
                style: TextStyle(
                  fontSize: isDesktop ? 22 : 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Automated, venturi-based precise fertilizer dosing system engineered for high-yield agriculture. Supports multi-recipe injection, EC/pH automated feedback, and seamless integration with existing irrigation setups.',
          style: TextStyle(
            fontSize: isDesktop ? 16 : 14,
            height: 1.6,
            color: const Color(0xFFCBD5E1),
          ),
        ),
        const SizedBox(height: 28),
        // Highlights Pills
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: const [
            _HeroPill(icon: Icons.tune_rounded, label: '3 & 6 Channel Models'),
            _HeroPill(icon: Icons.speed_rounded, label: '4 Bar & 6.5 Bar Ratings'),
            _HeroPill(icon: Icons.bolt_rounded, label: 'EC & pH Closed-Loop'),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroRightImage() {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              _kHeroImage,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(
                icon: Icons.water_drop_rounded,
                title: 'NutriFlow™ 400 System',
                subtitle: 'Place nutriflow_hero.png in assets/images/',
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white24),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 14),
                  SizedBox(width: 6),
                  Text(
                    'Venturi Technology',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 2. KEY PILLARS GRID (4 CARDS)
  // ─────────────────────────────────────────────────────────────
  Widget _buildPillarsGrid(bool isDesktop) {
    final pillars = [
      _PillarData(
        icon: Icons.my_location_rounded,
        title: 'Precise Irrigation',
        desc: 'Delivers exact nutrient ratios with Venturi suction accuracy across every irrigation cycle.',
        color: const Color(0xFF00ADFF),
      ),
      _PillarData(
        icon: Icons.eco_rounded,
        title: 'Optimized Nutrition',
        desc: 'Enables targeted fertilizer application matching exact crop physiological growth stages.',
        color: const Color(0xFF10B981),
      ),
      _PillarData(
        icon: Icons.memory_rounded,
        title: 'Advanced Automation',
        desc: 'Automates dosing by time, volume, or real-time EC & pH sensor feedback loops.',
        color: const Color(0xFF8B5CF6),
      ),
      _PillarData(
        icon: Icons.trending_up_rounded,
        title: 'Increased Productivity',
        desc: 'Boosts overall crop yield while preventing fertilizer leaching and protecting groundwater.',
        color: const Color(0xFFF59E0B),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'CORE ADVANTAGES',
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
              ),
              const SizedBox(height: 6),
              Text(
                'Why Choose NutriFlow™ 400?',
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Engineered for maximum nutrient efficiency and root-zone absorption.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop
                ? (constraints.maxWidth - 3 * 20) / 4
                : (constraints.maxWidth > 600 ? (constraints.maxWidth - 20) / 2 : constraints.maxWidth);
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: pillars
                  .map(
                    (p) => SizedBox(
                      width: cardWidth,
                      child: _buildPillarCard(p),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPillarCard(_PillarData p) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: p.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(p.icon, color: p.color, size: 28),
          ),
          const SizedBox(height: 18),
          Text(
            p.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            p.desc,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 3. UNDERSTANDING FERTIGATION & ITS IMPORTANCE
  // ─────────────────────────────────────────────────────────────
  Widget _buildUnderstandingFertigation(bool isDesktop) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0F172A),
            const Color(0xFF1E293B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
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
                  color: const Color(0xFF10B981).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb_rounded,
                  color: Color(0xFF10B981),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AGRONOMIC INSIGHTS',
                      style: TextStyle(
                        color: Color(0xFF10B981),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'Understanding Fertigation & Its Importance',
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
          // Concept Image Banner / Illustration
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    _kConceptImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(
                      icon: Icons.schema_rounded,
                      title: 'Root Zone Fertigation Concept',
                      subtitle: 'Place fertigation_concept.png in assets/images/',
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF10B981).withOpacity(0.4)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.grass_rounded, size: 14, color: Color(0xFF10B981)),
                        SizedBox(width: 6),
                        Text(
                          'Direct Root Absorption',
                          style: TextStyle(color: Color(0xFF10B981), fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildConceptCard(
                    title: 'What is Fertigation?',
                    icon: Icons.water_drop_outlined,
                    accentColor: const Color(0xFF00ADFF),
                    points: const [
                      'Technique of supplying dissolved fertilizers directly through an irrigation system.',
                      'Delivers water and essential nutrients simultaneously to plant root zones.',
                      'Maximizes nutrient absorption while minimizing operational manual labor.',
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildConceptCard(
                    title: 'Why Small & Frequent Dosing?',
                    icon: Icons.repeat_rounded,
                    accentColor: const Color(0xFF10B981),
                    points: const [
                      'Matches real-time crop nutrient demand curve.',
                      'Significantly improves overall nutrient uptake efficiency.',
                      'Reduces fertilizer runoff loss and protects groundwater quality.',
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildConceptCard(
                    title: 'Need for Root Zone Precision',
                    icon: Icons.center_focus_strong_rounded,
                    accentColor: const Color(0xFFF59E0B),
                    points: const [
                      'Minimizes excess chemical wastage and soil salinity spikes.',
                      'Ensures optimal nutrient positioning directly where roots absorb.',
                      'Enables immediate plant uptake for faster crop growth cycles.',
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildConceptCard(
                  title: 'What is Fertigation?',
                  icon: Icons.water_drop_outlined,
                  accentColor: const Color(0xFF00ADFF),
                  points: const [
                    'Technique of supplying dissolved fertilizers directly through an irrigation system.',
                    'Delivers water and essential nutrients simultaneously to plant root zones.',
                    'Maximizes nutrient absorption while minimizing operational manual labor.',
                  ],
                ),
                const SizedBox(height: 16),
                _buildConceptCard(
                  title: 'Why Small & Frequent Dosing?',
                  icon: Icons.repeat_rounded,
                  accentColor: const Color(0xFF10B981),
                  points: const [
                    'Matches real-time crop nutrient demand curve.',
                    'Significantly improves overall nutrient uptake efficiency.',
                    'Reduces fertilizer runoff loss and protects groundwater quality.',
                  ],
                ),
                const SizedBox(height: 16),
                _buildConceptCard(
                  title: 'Need for Root Zone Precision',
                  icon: Icons.center_focus_strong_rounded,
                  accentColor: const Color(0xFFF59E0B),
                  points: const [
                    'Minimizes excess chemical wastage and soil salinity spikes.',
                    'Ensures optimal nutrient positioning directly where roots absorb.',
                    'Enables immediate plant uptake for faster crop growth cycles.',
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildConceptCard({
    required String title,
    required IconData icon,
    required Color accentColor,
    required List<String> points,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...points.map(
            (pt) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Expanded(
                    child: Text(
                      pt,
                      style: const TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 13,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 4. MODEL SELECTOR (3 CHANNEL VS 6 CHANNEL)
  // ─────────────────────────────────────────────────────────────
  Widget _buildModelSelector(bool isDesktop) {
    final currentModel = kNutriFlowModels[_selectedModelIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'SYSTEM VARIANTS',
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
              ),
              const SizedBox(height: 6),
              Text(
                'Explore NutriFlow™ 400 Models',
                style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Choose the channel configuration suited for your field dosing requirements.',
                style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        // Segmented Model Tabs Switcher
        Center(
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(kNutriFlowModels.length, (index) {
                final model = kNutriFlowModels[index];
                final isSelected = index == _selectedModelIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedModelIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? model.themeColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: model.themeColor.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          index == 0 ? Icons.looks_3_rounded : Icons.looks_6_rounded,
                          color: isSelected ? Colors.white : AppColors.textMedium,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          model.name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.textDark,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 36),

        // Model Detail Showcase Card
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(_selectedModelIndex),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: currentModel.themeColor.withOpacity(0.3), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: currentModel.themeColor.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: EdgeInsets.all(isDesktop ? 36 : 24),
            child: isDesktop
                ? Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: _buildModelInfoLeft(currentModel),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 10,
                        child: _buildModelImageRight(currentModel),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _buildModelInfoLeft(currentModel),
                      const SizedBox(height: 24),
                      _buildModelImageRight(currentModel),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildModelInfoLeft(FertigationModelDetail model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: model.themeColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                model.ratio,
                style: TextStyle(
                  color: model.themeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Capacity: 400 LPH',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        Text(
          model.subtitle,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Technical Highlights:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 10),
        ...model.specs.map(
          (spec) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_rounded, color: model.themeColor, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    spec,
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

  Widget _buildModelImageRight(FertigationModelDetail model) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.bgLightGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Image.asset(
          model.imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(
            icon: Icons.alt_route_rounded,
            title: model.name,
            subtitle: 'Place ${model.imagePath.split('/').last} in assets/images/',
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // 5. CONTROLLER KEY FEATURES
  // ─────────────────────────────────────────────────────────────
  Widget _buildControllerFeatures(bool isDesktop) {
    final controllerFeatures = [
      _FeatureItem(
        icon: Icons.timer_rounded,
        title: 'Time-Based Control',
        desc: 'Schedule dosing duration per channel with precise time triggers.',
      ),
      _FeatureItem(
        icon: Icons.water_drop_rounded,
        title: 'Volume-Based Control',
        desc: 'Inject exact liters/gallons of fertilizer based on real-time flow meters.',
      ),
      _FeatureItem(
        icon: Icons.sensors_rounded,
        title: 'Sensor-Based Control',
        desc: 'Automates dosing adjustments via closed-loop EC & pH sensor feedback.',
      ),
      _FeatureItem(
        icon: Icons.history_rounded,
        title: 'Data Logging',
        desc: 'Logs up to 100 historical irrigation & fertigation events for audits.',
      ),
      _FeatureItem(
        icon: Icons.wifi_rounded,
        title: 'Wireless Compatibility',
        desc: 'Remote monitoring and configuration via cloud & mobile app integration.',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.all(isDesktop ? 36 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INTELLIGENT CONTROLLER',
                        style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Controller Key Features',
                        style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Powered by an advanced microcontroller unit engineered for accurate pulse dosing, multi-strategy scheduling, and robust event recording.',
                        style: AppTextStyles.cardDescription(),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: AppColors.bgLightGrey,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Center(
                          child: Image.asset(
                            _kControllerImage,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImagePlaceholder(
                              icon: Icons.developer_board_rounded,
                              title: 'Fertigation Controller',
                              subtitle: 'Place nutriflow_controller.png in assets/images/',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 12,
                  child: Column(
                    children: controllerFeatures
                        .map((feat) => _buildControllerFeatureRow(feat))
                        .toList(),
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'INTELLIGENT CONTROLLER',
                  style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
                ),
                const SizedBox(height: 6),
                Text(
                  'Controller Key Features',
                  style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                ),
                const SizedBox(height: 12),
                Text(
                  'Powered by an advanced microcontroller unit engineered for accurate pulse dosing, multi-strategy scheduling, and robust event recording.',
                  style: AppTextStyles.cardDescription(),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.bgLightGrey,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                    child: Image.asset(
                      _kControllerImage,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildImagePlaceholder(
                        icon: Icons.developer_board_rounded,
                        title: 'Fertigation Controller',
                        subtitle: 'Place nutriflow_controller.png in assets/images/',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ...controllerFeatures
                    .map((feat) => _buildControllerFeatureRow(feat))
                    .toList(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildControllerFeatureRow(_FeatureItem feat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00ADFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(feat.icon, color: const Color(0xFF00ADFF), size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feat.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  feat.desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    height: 1.4,
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
  // 6. COMPLETE ORDERING INFORMATION TABLE
  // ─────────────────────────────────────────────────────────────
  // 6. COMPLETE ORDERING INFORMATION TABLE (COLLAPSIBLE)
  // ─────────────────────────────────────────────────────────────
  Widget _buildOrderingTable(bool isDesktop) {
    final filteredOrders = kFertigationOrders.where((item) {
      if (_orderFilter == '3 Channel') return item.channels == '3 Channel';
      if (_orderFilter == '6 Channel') return item.channels == '6 Channel';
      return true;
    }).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryTeal.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.receipt_long_rounded, color: AppColors.primaryTeal, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SPECIFICATION & CATALOGUE',
                            style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'NutriFlow SKU Ordering Codes (${kFertigationOrders.length} Models)',
                            style: AppTextStyles.sectionTitle(isDesktop: isDesktop).copyWith(fontSize: isDesktop ? 20 : 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() => _isOrderingTableExpanded = !_isOrderingTableExpanded);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryTeal,
                  side: const BorderSide(color: AppColors.primaryTeal, width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                icon: Icon(
                  _isOrderingTableExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  size: 20,
                ),
                label: Text(
                  _isOrderingTableExpanded ? 'Hide Catalog' : 'View SKU Codes',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ),
            ],
          ),

          if (_isOrderingTableExpanded) ...[
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: ['All', '3 Channel', '6 Channel'].map((filter) {
                final isSelected = _orderFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text(filter),
                    selectedColor: const Color(0xFF00ADFF),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textDark,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 13,
                    ),
                    onSelected: (selected) {
                      setState(() => _orderFilter = filter);
                    },
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? const Color(0xFF00ADFF) : AppColors.borderLight,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Table Container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderLight),
              ),
              clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
              dataRowMinHeight: 56,
              dataRowMaxHeight: 64,
              columnSpacing: isDesktop ? 40 : 20,
              columns: const [
                DataColumn(
                  label: Text(
                    'ITEM CODE',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'DESCRIPTION',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'CHANNELS',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'DOSING',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'PRESSURE RATING',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ACTION',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
              rows: filteredOrders.map((item) {
                return DataRow(
                  cells: [
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00ADFF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item.code,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF00ADFF),
                            fontSize: 13,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        item.description,
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        item.channels,
                        style: const TextStyle(
                          color: AppColors.textMedium,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        item.dosing,
                        style: const TextStyle(
                          color: AppColors.textMedium,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: item.pressure == '4 bar'
                              ? const Color(0xFF10B981).withOpacity(0.12)
                              : const Color(0xFFF59E0B).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.pressure,
                          style: TextStyle(
                            color: item.pressure == '4 bar'
                                ? const Color(0xFF10B981)
                                : const Color(0xFFD97706),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.copy_rounded, size: 18, color: AppColors.primaryTeal),
                        tooltip: 'Copy Item Code',
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: item.code));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Item Code ${item.code} copied to clipboard!'),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ],
  ),
);
  }

  // ─────────────────────────────────────────────────────────────
  // PLACEHOLDER BUILDER FOR MISSING ASSETS
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
// HELPER CLASSES & PAINTERS
// ─────────────────────────────────────────────────────────────
class _HeroPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF00ADFF)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PillarData {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const _PillarData({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureItem({
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