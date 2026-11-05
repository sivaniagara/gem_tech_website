import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_design.dart';

// ─────────────────────────────────────────────────────────────
//  ORO GEM OS & ECOSYSTEM - REQUIRED ASSETS
//  All images are transparent PNGs in assets/images/
// ─────────────────────────────────────────────────────────────
const String _kHeroHandsImage = 'assets/images/orogem_hero_hands.png';
const String _kOsDiagramImage = 'assets/images/orogem_os_diagram.png';
const String _kMasterSmallImage = 'assets/images/orogem_master_small.png';
const String _kMasterMediumImage = 'assets/images/orogem_master_medium.png';
const String _kMasterLargeImage = 'assets/images/orogem_master_large.png';
const String _kSmartSlaveImage = 'assets/images/oro_smart_slave.png';
const String _kRtuSlaveImage = 'assets/images/oro_rtu_slave.png';
const String _kSenseSlaveImage = 'assets/images/oro_sense_slave.png';
const String _kLevelSlaveImage = 'assets/images/oro_level_slave.png';
const String _kWeatherStationImage = 'assets/images/oro_weather_station.png';
const String _kPumpAutomationImage = 'assets/images/oro_pump_automation.png';

// ─────────────────────────────────────────────────────────────
//  DESIGN TOKENS (local to this section)
// ─────────────────────────────────────────────────────────────
const Color _kDeepTeal = Color(0xFF033F3A);
const Color _kTeal = Color(0xFF0F766E);
const Color _kMint = Color(0xFF2DD4BF);
const Color _kSky = Color(0xFF0284C7);
const Color _kViolet = Color(0xFF7C3AED);
const Color _kRose = Color(0xFFE11D48);
const Color _kBrandYellow = Color(0xFFFFC72C);
const Color _kPageBg = Color(0xFFF8FAFC);

// ─────────────────────────────────────────────────────────────
//  DATA MODELS
// ─────────────────────────────────────────────────────────────
class EcosystemModel {
  final String id;
  final String name;
  final String category; // 'Master Controllers', 'Wired Expansion', 'Wireless Valves', 'Soil & Microclimate', 'Water Level', 'Weather & Boosters', 'Pump Automation'
  final String imagePath;
  final String target;
  final String communication;
  final String type;
  final String description;
  final List<String> highlights;
  final Map<String, String> specs;
  final List<String> catalogModels;

  const EcosystemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imagePath,
    required this.target,
    required this.communication,
    required this.type,
    required this.description,
    required this.highlights,
    required this.specs,
    required this.catalogModels,
  });
}

const List<EcosystemModel> kEcosystemModels = [
  EcosystemModel(
    id: 'master_small',
    name: 'ORO GEM (R) Master',
    category: 'Master Controllers',
    imagePath: _kMasterSmallImage,
    target: 'Small Farms & Greenhouses',
    communication: 'RS485 Bus',
    type: 'Master Device',
    description: 'High performance automation that doesn\'t compromise on flexibility. Acts as a Master Device for Small Scale Farms.',
    highlights: [
      'RS485 Bus communication with wired expansion slaves',
      'Supports up to 8 Relays & 4-20mA Sensor ADC inputs',
      'Bluetooth software upgrades & remote mobile app control',
      'Full integration with OROGEM OS visual workflow',
    ],
    specs: {
      'COMMUNICATION': 'RS485 Bus',
      'TARGET SCALE': 'Small Farms & Greenhouses',
      'EXPANSION': 'Wired RS485 Slaves',
      'SOFTWARE': 'Orogem OS & Mobile App',
    },
    catalogModels: ['OROGEM-R (RS485 Master)'],
  ),
  EcosystemModel(
    id: 'master_medium',
    name: 'ORO GEM (RL) Master',
    category: 'Master Controllers',
    imagePath: _kMasterMediumImage,
    target: 'Medium Scale Commercial Orchards',
    communication: 'RS485 & LoRa RF (2 km)',
    type: 'Hybrid Master',
    description: 'High performance automation featuring hybrid RS485 wired bus and LoRa wireless RF connectivity up to 2 km line-of-sight.',
    highlights: [
      'Hybrid RS485 wired bus and LoRa RF wireless master',
      'Long range up to 2 km line-of-sight to wireless field RTUs',
      'Supports wired Smart slaves & wireless RTU/Sense nodes',
      'Real-time GSM & Bluetooth cloud connectivity',
    ],
    specs: {
      'COMMUNICATION': 'RS485 + LoRa RF',
      'LORA RANGE': 'Up to 2 km Line-of-Sight',
      'TARGET SCALE': 'Medium Commercial Orchards',
      'CONNECTIVITY': 'LoRa, RS485 & GSM',
    },
    catalogModels: ['OROGEM-RL (Hybrid RS485 + LoRa)'],
  ),
  EcosystemModel(
    id: 'master_large',
    name: 'ORO GEM+ (RL) Master',
    category: 'Master Controllers',
    imagePath: _kMasterLargeImage,
    target: 'Large Scale Agri-Estates',
    communication: '2x LoRa RF + GSM / Cloud',
    type: 'Enterprise Master',
    description: 'Enterprise multi-node master controller handling hundreds of wireless field valves, weather stations, fertigation skids, and pump networks.',
    highlights: [
      'Dual LoRa RF transceivers for extensive estate coverage',
      'Cellular GSM/GPRS cloud integration for mobile control',
      'Handles 100s of programs, valves, & weather stations',
      'Automated rain shutdown & multi-channel fertigation',
    ],
    specs: {
      'COMMUNICATION': '2x LoRa RF + GSM / Cloud',
      'CAPACITY': 'Hundreds of Wireless Field Nodes',
      'TARGET SCALE': 'Large Scale Agri-Projects',
      'INTERFACES': 'Dual LoRa, GSM, RS485',
    },
    catalogModels: ['OROGEM+-RL (Enterprise Dual-LoRa)'],
  ),
  EcosystemModel(
    id: 'slave_smart',
    name: 'ORO Smart & Smart+',
    category: 'Wired Expansion',
    imagePath: _kSmartSlaveImage,
    target: 'Wired IO Slave Expansion Unit',
    communication: 'RS485 / WiFi / GPRS',
    type: 'Wired IO Slave',
    description: 'Wired IO expansion slave modules for adding extra pump controls, solenoid valves, pressure sensors, and EC/pH sensors.',
    highlights: [
      'Output: 8 or 16 Relay Valves/Pumps',
      'Input ADC: 4 Pressure/Level Sensors (4-20mA)',
      'Digital Input: 2 Pulse Flow Meters / Pressure Switches',
      'Input ADC: 2 pH / EC Sensors',
    ],
    specs: {
      'COMMUNICATION': 'RS485 / WiFi / GPRS',
      'RELAY OUTPUTS': '8 or 16 Relay Outputs',
      'ANALOG ADC': '4-20mA Pressure & Level',
      'CHEMISTRY': 'EC & pH Sensor Inputs',
    },
    catalogModels: [
      'OS4R / OS8R (4 or 8 Relay)',
      'OS4RADC / OS8RADC (4/8 Relay + 4-20mA)',
      'OSP8R / OSP16R (8/16 Relay + Digital Input)',
      'OSP16RADC (16 Relay + 4-20mA + EC Sensor)',
    ],
  ),
  EcosystemModel(
    id: 'slave_rtu',
    name: 'ORO RTU & RTU+',
    category: 'Wireless Valves',
    imagePath: _kRtuSlaveImage,
    target: 'LoRa RF Wireless Latch Valve Slave',
    communication: 'LoRa RF (Up to 2 km)',
    type: 'Wireless Field Node',
    description: 'Solar and battery operated wireless field nodes for controlling pulse latching solenoid valves and pressure sensors without wires.',
    highlights: [
      'Output: 4 or 8 Latching Solenoid Valves',
      'Input ADC: 4 Pressure/Level 4-20mA Transmitters',
      'Input ADC: 4 Soil Moisture & Temp Sensors (RTU+)',
      'Ultra-low power consumption for multi-year battery life',
    ],
    specs: {
      'COMMUNICATION': 'LoRa RF (Up to 2 km)',
      'VALVE CONTROL': '4 or 8 Latching Solenoids',
      'ANALOG ADC': '4 Pressure / Level (4-20mA)',
      'SOIL SENSORS': 'Soil Moisture & Temperature',
    },
    catalogModels: [
      'ORTU4L / ORTU8L (4 or 8 Latch)',
      'ORTU4LADC / ORTU8LADC (4/8 Latch + 4-20mA)',
      'ORTUP4LSMST (4 Latch + 4 Soil Moisture + Soil Temp)',
      'ORTUP4LSMSTADC (4 Latch + 4 Moisture + Temp + 4-20mA)',
    ],
  ),
  EcosystemModel(
    id: 'slave_sense',
    name: 'ORO Sense & Sense+',
    category: 'Soil & Microclimate',
    imagePath: _kSenseSlaveImage,
    target: 'Wireless Soil & Environmental Sensing',
    communication: 'LoRa RF',
    type: 'Telemetry Node',
    description: 'Wireless telemetry node reading multi-depth soil moisture, soil temperature, ambient humidity, air temperature, and CO2 levels.',
    highlights: [
      'Input ADC: 4 Soil Moisture Sensors',
      'Soil Temperature Sensing',
      'Input ADC: Humidity, Air Temp & CO2 Sensor (Sense+)',
      'Long-range wireless transmission to ORO GEM Master',
    ],
    specs: {
      'COMMUNICATION': 'LoRa RF Wireless',
      'SOIL SENSING': '4 Soil Moisture + 1 Soil Temp',
      'ATMOSPHERE': 'Humidity, Air Temp & CO2',
      'POWER': 'Solar Panel + Battery Backup',
    },
    catalogModels: [
      'OSMST (4 Soil Moisture + 1 Soil Temp)',
      'OSMST OHT-CO2 (4 Moisture + Temp + Humidity + CO2)',
    ],
  ),
  EcosystemModel(
    id: 'slave_level',
    name: 'ORO Level & Level+',
    category: 'Water Level',
    imagePath: _kLevelSlaveImage,
    target: 'Tank, Cistern & Sump Level Monitoring',
    communication: 'LoRa RF',
    type: 'Level Automation',
    description: 'Continuous water level monitoring unit for storage tanks, sumps, and reservoirs with automatic pump interlocks and latch control.',
    highlights: [
      'Digital Input: 6 Float Switches',
      'ADC Input: 4 Level 4-20mA Transmitters',
      'Output: 4 Latch Valves (Level+)',
      'Prevents tank overflow and pump dry running',
    ],
    specs: {
      'COMMUNICATION': 'LoRa RF Wireless',
      'FLOAT INPUTS': '6 Digital Float Switches',
      'LEVEL ADC': '4 Level Transmitters (4-20mA)',
      'VALVE OUTPUT': '4 Latching Solenoids (Level+)',
    },
    catalogModels: [
      'OLEVELDADC (Level Float)',
      'OLEVEL4LDADC (4 Latch + Level/Pressure + Float)',
    ],
  ),
  EcosystemModel(
    id: 'slave_weather',
    name: 'ORO Weather & Extend+',
    category: 'Weather & Boosters',
    imagePath: _kWeatherStationImage,
    target: 'Agri Weather Station & LoRa Repeater',
    communication: 'GSM / LoRa RF / RS485',
    type: 'Weather Mast & Booster',
    description: 'All-in-one agricultural weather station and wireless LoRa signal repeater mast for real-time microclimate tracking and auto rain shutdown.',
    highlights: [
      'Wind Direction & Speed Sensors',
      'Rainfall & Leaf Wetness Sensors',
      'CO2, Lux, Air Temp, Humidity & Atmospheric Pressure',
      'Signal Boosting: Long range LoRa RF Repeater',
    ],
    specs: {
      'COMMUNICATION': 'GSM / LoRa RF / RS485',
      'CLIMATE SENSORS': 'Wind, Rain, Lux, Temp, RH',
      'SIGNAL BOOSTER': 'LoRa RF Long Range Repeater',
      'AUTO FUNCTION': 'Auto Shutdown during Rain',
    },
    catalogModels: [
      'OEXTEND / OEXTEND+ (LoRa & GSM Signal Repeater)',
      'OWSGSM (GSM Weather Station)',
      'OWSLORA (LoRa Weather Station)',
    ],
  ),
  EcosystemModel(
    id: 'slave_pump',
    name: 'ORO Pump & Pump+',
    category: 'Pump Automation',
    imagePath: _kPumpAutomationImage,
    target: 'Standalone or Slave Pump Controller',
    communication: 'GPRS / LoRa RF / GSM',
    type: 'Motor Pump Control',
    description: 'Heavy-duty pump automation unit controlling up to 3 motors with integrated 3-phase voltage/current protection, pressure ADC, and flow meter inputs.',
    highlights: [
      'Output: 5 Relays (Control up to 3 Pumps)',
      'Voltage Protection & 3-Current Sensing',
      'Digital Input: 6 Float Switches / Flow Meters (Pump+)',
      'ADC Input: 1 Pressure / 1 Level 4-20mA Transmitter',
    ],
    specs: {
      'COMMUNICATION': 'GPRS / LoRa RF / GSM',
      'PUMP CONTROL': 'Up to 3 Motors (5 Relays)',
      'PROTECTION': '3-Phase Voltage & Current',
      'INPUTS': '6 Floats / Meters + 2 ADC',
    },
    catalogModels: [
      'OPUMPGSM / OPUMPLORA (GSM/LoRa Pump Controller)',
      'OPUMPGSMADC / OPUMPLORAADC (Pump Controller + ADC)',
    ],
  ),
];

// ─────────────────────────────────────────────────────────────
//  CATEGORY STYLING HELPER
// ─────────────────────────────────────────────────────────────
class _CategoryStyle {
  final Color color;
  final IconData icon;
  const _CategoryStyle(this.color, this.icon);
}

_CategoryStyle _styleFor(String category) {
  switch (category) {
    case 'Master Controllers':
      return const _CategoryStyle(_kTeal, Icons.hub_rounded);
    case 'Wired Expansion':
      return const _CategoryStyle(_kSky, Icons.developer_board_rounded);
    case 'Wireless Valves':
      return const _CategoryStyle(_kViolet, Icons.wifi_tethering_rounded);
    case 'Soil & Microclimate':
      return const _CategoryStyle(Color(0xFF16A34A), Icons.grass_rounded);
    case 'Water Level':
      return const _CategoryStyle(Color(0xFF0891B2), Icons.waves_rounded);
    case 'Weather & Boosters':
      return const _CategoryStyle(Color(0xFFEA580C), Icons.wb_sunny_rounded);
    case 'Pump Automation':
      return const _CategoryStyle(_kRose, Icons.water_drop_rounded);
    default:
      return const _CategoryStyle(_kTeal, Icons.memory_rounded);
  }
}

String _shortValue(String v) => v.split('(').first.trim();

// ─────────────────────────────────────────────────────────────
//  STATIC COPY (OS & Subsystems)
// ─────────────────────────────────────────────────────────────
const List<String> _kControllerFeatures = [
  'Wide range of flexible & modular controllers for backflushing & fertigation',
  'Expandable modular hardware architecture',
  'Controller software upgrades through a Bluetooth device',
  'LoRa based RTU – Up to 2 km line-of-sight range',
  'Weather station integration for auto shutdown during rain',
  'Local & Remote Analog inputs (LoRa RF & RS485)',
];

const List<String> _kProgramFeatures = [
  'Hundreds of programs for head units & valve lines',
  'Dosing by Time, Volume (Liters) & Moisture',
  'Schedules: Manual, Day count RTC, Run lists & Skip days',
  'Single cycle or pulse irrigation options',
  'Start by time, sensor condition, or manual triggers',
  'Main valve delayed, advanced, or simultaneous operation',
];

class _OsPillar {
  final IconData icon;
  final String label;
  final Color color;
  const _OsPillar(this.icon, this.label, this.color);
}

const List<_OsPillar> _kOsPillars = [
  _OsPillar(Icons.settings_remote_rounded, 'Controller Remote Access', _kTeal),
  _OsPillar(Icons.monitor_heart_rounded, 'Monitor', _kSky),
  _OsPillar(Icons.assessment_rounded, 'Reporting', _kViolet),
  _OsPillar(Icons.notifications_active_rounded, 'Alarm Notification', _kRose),
];

class _SubsystemData {
  final String title;
  final String tag;
  final IconData icon;
  final Color color;
  final List<String> features;
  const _SubsystemData({
    required this.title,
    required this.tag,
    required this.icon,
    required this.color,
    required this.features,
  });
}

const List<_SubsystemData> _kSubsystems = [
  _SubsystemData(
    title: 'Fertigation System',
    tag: 'Up to 8 channels / site',
    icon: Icons.science_rounded,
    color: _kTeal,
    features: [
      'Local & Central fertilization sites (Up to 8 channels per site)',
      'Continuous Dosing: Time (hh:mm:ss)',
      'Volume Dosing: Liters Concentration (L/m³)',
      'Proportional Dosing: Water & fertilizer ratio',
      '3-Step Procedure: Pre-watering → Injection → Post-watering',
    ],
  ),
  _SubsystemData(
    title: 'Filter Backflush Control',
    tag: 'Time · Differential pressure',
    icon: Icons.cleaning_services_rounded,
    color: _kSky,
    features: [
      'Local & Central filter sites',
      'Flushing by Time, Differential Pressure (PD), or both',
      'Definable parameters: Interval, Pre-dwell, Dwell & PD delay',
      'Endless looping detection & auto prevention',
      'Accumulation of flushing cycles by time and PD',
    ],
  ),
  _SubsystemData(
    title: 'Comprehensive Alarms',
    tag: 'Instant notifications',
    icon: Icons.warning_amber_rounded,
    color: _kRose,
    features: [
      'High flow, Low flow, Water leakage & Low pressure',
      'Fertilizer leakage & No pulse injector warnings',
      'PD sensor failure detection',
      'Low battery & No Power Supply auto alerts',
      'Cloud push notifications to ORO Mobile App',
    ],
  ),
];

// ─────────────────────────────────────────────────────────────
//  MAIN SECTION
// ─────────────────────────────────────────────────────────────
class OroGemEcosystemSection extends StatefulWidget {
  final VoidCallback? onGetQuote;
  final VoidCallback? onViewCatalog;

  const OroGemEcosystemSection({
    super.key,
    this.onGetQuote,
    this.onViewCatalog,
  });

  @override
  State<OroGemEcosystemSection> createState() => _OroGemEcosystemSectionState();
}

class _OroGemEcosystemSectionState extends State<OroGemEcosystemSection> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Master Controllers',
    'Wired Expansion',
    'Wireless Valves',
    'Soil & Microclimate',
    'Water Level',
    'Weather & Boosters',
    'Pump Automation',
  ];

  bool get _hasCtas => widget.onGetQuote != null || widget.onViewCatalog != null;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    final gap = isDesktop ? 80.0 : 52.0;

    final filteredProducts = selectedCategory == 'All'
        ? kEcosystemModels
        : kEcosystemModels.where((p) => p.category == selectedCategory).toList();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.heroBgLight, _kPageBg],
          stops: [0.0, 0.25],
        ),
      ),
      child: Column(
        children: [
          _buildHeroHeader(isDesktop),
          SizedBox(height: gap),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1360),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOsCapabilities(isDesktop),
                    SizedBox(height: gap),
                    _buildSystemsGrid(isDesktop),
                    SizedBox(height: gap),
                    _buildBadge(),
                    const SizedBox(height: 20),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          style: AppTextStyles.sectionTitle(isDesktop: isDesktop)
                              .copyWith(fontSize: isDesktop ? 44 : 28),
                          children: const [
                            TextSpan(text: 'Automated Farm Controllers & '),
                            TextSpan(
                              text: 'ORO GEM Ecosystem',
                              style: TextStyle(color: AppColors.primaryTeal),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 780),
                        child: Text(
                          'Explore master devices, wired expansion modules, wireless LoRa RTUs, weather stations, and pump automation units.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 64,
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryTeal, AppColors.accentCyan],
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildKeyStatsBar(isDesktop),
                    const SizedBox(height: 48),
                    _buildFilterBar(),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryTeal,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Showing ${filteredProducts.length} ${selectedCategory == 'All' ? 'ORO GEM' : selectedCategory} product${filteredProducts.length == 1 ? '' : 's'}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF475569),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Product Showcase Grid
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
                          itemCount: filteredProducts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisExtent: 535,
                            crossAxisSpacing: 28,
                            mainAxisSpacing: 28,
                          ),
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return TweenAnimationBuilder<double>(
                              key: ValueKey('${selectedCategory}_${product.id}'),
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
                              child: _EcosystemCard(
                                item: product,
                                index: kEcosystemModels.indexOf(product) + 1,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 72),
                    _buildComparisonSection(isDesktop),
                    if (_hasCtas) ...[
                      SizedBox(height: gap),
                      _buildClosingBanner(isDesktop),
                    ],
                    SizedBox(height: gap),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  // 1. HERO HEADER
  // ───────────────────────────────────────────────────────────
  Widget _buildHeroHeader(bool isDesktop) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_kDeepTeal, _kTeal, Color(0xFF0B5E63)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: CustomPaint(painter: _GridBackgroundPainter()),
              ),
            ),
            const Positioned(
              top: -140,
              right: -90,
              child: _GlowBlob(size: 460, color: _kMint, alpha: 0.24),
            ),
            const Positioned(
              bottom: -170,
              left: -110,
              child: _GlowBlob(size: 400, color: _kBrandYellow, alpha: 0.10),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1360),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 60 : 20,
                    vertical: isDesktop ? 80 : 44,
                  ),
                  child: isDesktop
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 11, child: _buildHeroLeftText(isDesktop)),
                      const SizedBox(width: 48),
                      Expanded(flex: 10, child: _buildHeroRightImage(isDesktop)),
                    ],
                  )
                      : Column(
                    children: [
                      _buildHeroLeftText(isDesktop),
                      const SizedBox(height: 32),
                      _buildHeroRightImage(isDesktop),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroLeftText(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FadeSlideIn(
          ms: 500,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: _kMint.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: _kMint.withValues(alpha: 0.5)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.hub_rounded, size: 16, color: _kMint),
                SizedBox(width: 8),
                Text(
                  'Niagara OROGEM ecosystem',
                  style: TextStyle(
                    color: _kMint,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        _FadeSlideIn(
          ms: 650,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'The Easy Way to Automate Your\n',
                  style: AppTextStyles.heroHeading(isDesktop: isDesktop)
                      .copyWith(color: Colors.white, height: 1.15),
                ),
                TextSpan(
                  text: 'Irrigation & Fertigation',
                  style: TextStyle(
                    fontSize: isDesktop ? 40 : 26,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    color: _kBrandYellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _FadeSlideIn(
          ms: 800,
          child: Text(
            'ORO GEM range of controllers allow you to automate the control and regulation of your pumps, valves, and hydraulic components in drip or sprinkler systems remotely from anywhere. Suitable for open fields, orchards, and greenhouses.',
            style: TextStyle(
              fontSize: isDesktop ? 16.5 : 14.5,
              height: 1.65,
              color: const Color(0xFFE2E8F0),
            ),
          ),
        ),
        if (_hasCtas) ...[
          const SizedBox(height: 26),
          _FadeSlideIn(
            ms: 900,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (widget.onGetQuote != null)
                  ElevatedButton.icon(
                    onPressed: widget.onGetQuote,
                    icon: const Icon(Icons.request_quote_rounded, size: 18),
                    label: const Text('Get a Quote'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kBrandYellow,
                      foregroundColor: _kDeepTeal,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 16),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.md)),
                    ),
                  ),
                if (widget.onViewCatalog != null)
                  OutlinedButton.icon(
                    onPressed: widget.onViewCatalog,
                    icon: const Icon(Icons.menu_book_rounded, size: 18),
                    label: const Text('View Catalog'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.4)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 16),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.md)),
                    ),
                  ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 26),
        _FadeSlideIn(
          ms: 1000,
          child: const Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              _HeroPill(
                  icon: Icons.tune_rounded, label: 'Small, Medium & Large Scale'),
              _HeroPill(
                  icon: Icons.cell_tower_rounded, label: 'LoRa RF & GSM Network'),
              _HeroPill(
                  icon: Icons.cloud_done_rounded, label: 'Orogem OS & Mobile App'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroRightImage(bool isDesktop) {
    final h = isDesktop ? 420.0 : 290.0;
    return SizedBox(
      height: h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: _GlowBlob(size: h * 1.0, color: _kMint, alpha: 0.30)),
          _Floating(
            amplitude: 8,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                _kHeroHandsImage,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) =>
                const _ImagePlaceholder(
                  dark: true,
                  icon: Icons.eco_rounded,
                  title: 'ORO GEM Irrigation & Fertigation',
                  subtitle: 'Place orogem_hero_hands.png in assets/images/',
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            bottom: 18,
            child: _HeroFloatingChip(
              icon: Icons.check_circle_rounded,
              label: 'Precision Crop Performance',
            ),
          ),
          const Positioned(
            right: 0,
            top: 22,
            child: _HeroFloatingChip(
              icon: Icons.cell_tower_rounded,
              label: 'LoRa RF · up to 2 km',
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  // 2. OROGEM OS
  // ───────────────────────────────────────────────────────────
  Widget _buildOsCapabilities(bool isDesktop) {
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [_kTeal, _kMint],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.sm,
              ),
              child: const Icon(Icons.dvr_rounded, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OROGEM operating system',
                    style: TextStyle(
                      color: _kTeal,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Much More than a Controller. It\'s a Whole OS.',
                    style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'All controllers connect to Orogem OS — an intuitive visual tool to plan, monitor and execute irrigation with high transparency and reliability while minimizing operating costs.',
          style: AppTextStyles.cardDescription(),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _kOsPillars
              .map((p) => _OsPillarChip(pillar: p))
              .toList(),
        ),
        const SizedBox(height: 24),
        _buildOsFeatureBox(
          title: 'Irrigation Controller Features',
          icon: Icons.tune_rounded,
          items: _kControllerFeatures,
        ),
        const SizedBox(height: 16),
        _buildOsFeatureBox(
          title: 'Irrigation Programming',
          icon: Icons.calendar_month_rounded,
          items: _kProgramFeatures,
        ),
      ],
    );

    final diagram = _buildOsDiagramCard(isDesktop);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      padding: EdgeInsets.all(isDesktop ? 40 : 22),
      child: isDesktop
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 11, child: text),
          const SizedBox(width: 40),
          Expanded(flex: 9, child: diagram),
        ],
      )
          : Column(
        children: [
          text,
          const SizedBox(height: 26),
          diagram,
        ],
      ),
    );
  }

  Widget _buildOsDiagramCard(bool isDesktop) {
    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      child: GestureDetector(
        onTap: _openDiagram,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFFF1F8F7), Color(0xFFE8F3F3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: _kTeal.withValues(alpha: 0.16)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _DotGridPainter(_kTeal.withValues(alpha: 0.10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(
                    _kOsDiagramImage,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) =>
                    const _ImagePlaceholder(
                      icon: Icons.account_tree_rounded,
                      title: 'Orogem OS Architecture',
                      subtitle: 'Place orogem_os_diagram.png in assets/images/',
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: _kDeepTeal.withValues(alpha: 0.88),
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.zoom_out_map_rounded,
                          size: 14, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        'Tap to enlarge',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  void _openDiagram() {
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  _kOsDiagramImage,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) =>
                  const _ImagePlaceholder(
                    icon: Icons.account_tree_rounded,
                    title: 'Orogem OS Architecture',
                    subtitle: 'Place orogem_os_diagram.png in assets/images/',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                tooltip: 'Close',
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOsFeatureBox({
    required String title,
    required IconData icon,
    required List<String> items,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F8F8),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: _kTeal, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...items.map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6, right: 10),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: _kTeal,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: AppColors.textMedium,
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

  // ───────────────────────────────────────────────────────────
  // 3. FERTIGATION / BACKFLUSH / ALARMS
  // ───────────────────────────────────────────────────────────
  Widget _buildSystemsGrid(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          eyebrow: 'Intelligent subsystems',
          title: 'Fertigation, Backflush & Alarm Control',
          subtitle:
          'Built-in intelligence that protects your system and your crop.',
          isDesktop: isDesktop,
          centered: true,
        ),
        const SizedBox(height: 30),
        if (isDesktop)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < _kSubsystems.length; i++) ...[
                  Expanded(
                    child: _buildSubsystemCard(_kSubsystems[i], i + 1),
                  ),
                  if (i != _kSubsystems.length - 1) const SizedBox(width: 22),
                ],
              ],
            ),
          )
        else
          Column(
            children: [
              for (int i = 0; i < _kSubsystems.length; i++) ...[
                _buildSubsystemCard(_kSubsystems[i], i + 1),
                if (i != _kSubsystems.length - 1) const SizedBox(height: 18),
              ],
            ],
          ),
      ],
    );
  }

  Widget _buildSubsystemCard(_SubsystemData data, int number) {
    final color = data.color;
    return _HoverLift(
      radius: 24,
      glow: color,
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withValues(alpha: 0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: AppShadows.sm,
                  ),
                  child: Icon(data.icon, color: Colors.white, size: 24),
                ),
                const Spacer(),
                Text(
                  '0$number',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: color.withValues(alpha: 0.14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data.tag,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
            const SizedBox(height: 18),
            ...data.features.map(
                  (f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(Icons.check_circle_rounded,
                          color: color, size: 16),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: AppColors.textMedium,
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
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  // 4. SHOWCASE HEADER COMPONENTS (Matches Valve Showcase)
  // ───────────────────────────────────────────────────────────
  Widget _buildBadge() {
    return Center(
      child: Container(
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
                'Modular & expandable automation',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.badgeText(color: AppColors.primaryTeal).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyStatsBar(bool isDesktop) {
    final stats = [
      {'icon': Icons.cell_tower_rounded, 'title': '2 km LoRa Range', 'subtitle': 'Line-of-sight wireless RTU range'},
      {'icon': Icons.science_rounded, 'title': '8 Dosing Channels', 'subtitle': 'Proportional & volume fertigation'},
      {'icon': Icons.schedule_rounded, 'title': '100s Programs', 'subtitle': 'RTC schedules, run lists & skip days'},
      {'icon': Icons.hub_rounded, 'title': 'Modular Slaves', 'subtitle': 'RS485 bus & LoRa RF expansion'},
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
            final w = (c.maxWidth - 16) / 2;
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

  Widget _buildFilterBar() {
    return LayoutBuilder(
      builder: (context, c) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: c.maxWidth),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
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
        ? kEcosystemModels.length
        : kEcosystemModels.where((p) => p.category == cat).length;
    final icon = cat == 'All' ? Icons.apps_rounded : _styleFor(cat).icon;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => selectedCategory = cat),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [AppColors.primaryTeal, Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primaryTeal.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 17,
                color: isSelected ? Colors.white : const Color(0xFF64748B),
              ),
              const SizedBox(width: 8),
              Text(
                cat,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF334155),
                  letterSpacing: -0.1,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.24)
                      : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : const Color(0xFF475569),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  // 5. TECHNICAL SPECIFICATIONS MATRIX
  // ───────────────────────────────────────────────────────────
  Widget _buildComparisonSection(bool isDesktop) {
    const headers = [
      'Model Name',
      'Category',
      'Communication',
      'Target Application',
      'Hardware Expansion',
      'System Role',
    ];
    const rows = [
      ['ORO GEM (R)', 'Master Controllers', 'RS485 Bus', 'Small Farms & Greenhouses', 'Wired RS485 Slaves', 'Master Device'],
      ['ORO GEM (RL)', 'Master Controllers', 'RS485 & LoRa RF', 'Medium Scale Orchards', 'Wired & LoRa Field Nodes', 'Hybrid Master'],
      ['ORO GEM+ (RL)', 'Master Controllers', '2x LoRa RF + GSM', 'Large Scale Estates', 'Hundreds of Wireless Nodes', 'Enterprise Master'],
      ['ORO Smart / Smart+', 'Wired Expansion', 'RS485 / WiFi / GPRS', 'Pump & Solenoid Control', '8/16 Relays + 4-20mA ADC', 'Wired IO Slave'],
      ['ORO RTU / RTU+', 'Wireless Valves', 'LoRa RF (Up to 2 km)', 'Remote Valve Manifolds', '4/8 Latch + Soil Sensors', 'Wireless Field Node'],
      ['ORO Sense / Sense+', 'Soil & Microclimate', 'LoRa RF Wireless', 'Rootzone & Climate Tracking', '4 Soil Moisture + RH/CO2', 'Telemetry Node'],
      ['ORO Level / Level+', 'Water Level', 'LoRa RF Wireless', 'Tanks, Sumps & Cisterns', '6 Floats + 4 Level ADC', 'Level Automation'],
      ['ORO Weather / Extend+', 'Weather & Boosters', 'GSM / LoRa / RS485', 'Microclimate & Booster', 'Wind, Rain, Lux + Repeater', 'Weather & Repeater'],
      ['ORO Pump / Pump+', 'Pump Automation', 'GPRS / LoRa / GSM', 'Motor Pump Protection', '3 Pumps + 3-Phase Protection', 'Motor Controller'],
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
                      'Comparative analysis of Niagara ORO GEM Master Controllers & Slave Modules',
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
                    columnSpacing: 32,
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

  // ───────────────────────────────────────────────────────────
  // 6. CLOSING BANNER
  // ───────────────────────────────────────────────────────────
  Widget _buildClosingBanner(bool isDesktop) {
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Not sure which controller fits your farm?',
          style: TextStyle(
            color: Colors.white,
            fontSize: isDesktop ? 28 : 21,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Tell us about your acreage, crops and water source — we will recommend the right Oro Gem master and slave modules.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.82),
            fontSize: 14.5,
            height: 1.55,
          ),
        ),
      ],
    );

    final buttons = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (widget.onGetQuote != null)
          ElevatedButton.icon(
            onPressed: widget.onGetQuote,
            icon: const Icon(Icons.request_quote_rounded, size: 18),
            label: const Text('Get a Quote'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _kBrandYellow,
              foregroundColor: _kDeepTeal,
              elevation: 0,
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
              textStyle:
              const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md)),
            ),
          ),
        if (widget.onViewCatalog != null)
          OutlinedButton.icon(
            onPressed: widget.onViewCatalog,
            icon: const Icon(Icons.menu_book_rounded, size: 18),
            label: const Text('View Catalog'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
              textStyle:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md)),
            ),
          ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 44 : 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        gradient: const LinearGradient(
          colors: [_kDeepTeal, _kTeal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: AppShadows.md,
      ),
      child: isDesktop
          ? Row(
        children: [
          Expanded(child: copy),
          const SizedBox(width: 40),
          buttons,
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy,
          const SizedBox(height: 22),
          buttons,
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  PRODUCT CARD (Matches Valve Showcase Card Design)
// ─────────────────────────────────────────────────────────────
class _EcosystemCard extends StatefulWidget {
  final EcosystemModel item;
  final int index;

  const _EcosystemCard({required this.item, required this.index});

  @override
  State<_EcosystemCard> createState() => _EcosystemCardState();
}

class _EcosystemCardState extends State<_EcosystemCard> {
  bool _hover = false;

  void _openDetails() {
    showDialog(
      context: context,
      barrierColor: AppColors.bgDarkSlate.withOpacity(0.65),
      builder: (_) => _EcosystemDetailsDialog(item: widget.item),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final style = _styleFor(item.category);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: _openDetails,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _hover ? -8 : 0, 0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _hover ? style.color.withOpacity(0.65) : const Color(0xFFE2E8F0),
              width: _hover ? 1.8 : 1.2,
            ),
            boxShadow: [
              if (_hover) ...[
                BoxShadow(
                  color: style.color.withOpacity(0.20),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ] else ...[
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageArea(item, style),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          height: 1.25,
                          color: _hover ? style.color : const Color(0xFF0F172A),
                          letterSpacing: -0.2,
                        ),
                        child: Text(
                          item.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          height: 1.45,
                          color: Color(0xFF475569),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _miniSpec(
                                Icons.settings_input_antenna_rounded,
                                'COMMUNICATION',
                                _shortValue(item.communication),
                                style.color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _miniSpec(
                                Icons.layers_rounded,
                                'TYPE / TARGET',
                                _shortValue(item.target),
                                style.color,
                              ),
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

  Widget _buildImageArea(EcosystemModel item, _CategoryStyle style) {
    return SizedBox(
      height: 235,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Studio background spotlight
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.2),
                radius: 0.9,
                colors: [
                  style.color.withOpacity(0.14),
                  const Color(0xFFF8FAFC),
                ],
              ),
            ),
          ),
          // Backplate glowing aura
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: _hover ? 215 : 180,
              height: _hover ? 215 : 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.color.withOpacity(_hover ? 0.20 : 0.10),
                boxShadow: [
                  BoxShadow(
                    color: style.color.withOpacity(_hover ? 0.25 : 0.08),
                    blurRadius: _hover ? 30 : 15,
                    spreadRadius: _hover ? 5 : 0,
                  ),
                ],
              ),
            ),
          ),
          // Product Image with 3D Float
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 18),
              child: AnimatedScale(
                scale: _hover ? 1.08 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Icon(style.icon, size: 56, color: style.color),
                  ),
                ),
              ),
            ),
          ),
          // Category Tag (Top-Left)
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: style.color.withOpacity(0.20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: style.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      color: style.color,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tech Index Badge (Top-Right)
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: style.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: style.color.withOpacity(0.25)),
              ),
              child: Text(
                '#${widget.index.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: style.color,
                  letterSpacing: 0.5,
                ),
              ),
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
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 15, color: color),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF64748B),
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                    height: 1.25,
                  ),
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
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: _hover
            ? LinearGradient(
                colors: [style.color, Color.lerp(style.color, AppColors.accentCyan, 0.6)!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: _hover ? null : style.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _hover ? Colors.transparent : style.color.withOpacity(0.28),
          width: 1.2,
        ),
        boxShadow: _hover
            ? [
                BoxShadow(
                  color: style.color.withOpacity(0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Specs & Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: fg,
              letterSpacing: 0.2,
            ),
          ),
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
class _EcosystemDetailsDialog extends StatelessWidget {
  final EcosystemModel item;

  const _EcosystemDetailsDialog({required this.item});

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(item.category);
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
            item.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(style.icon, size: 64, color: style.color)),
          ),
        ),
      ],
    );
  }

  Widget _content(BuildContext context, _CategoryStyle style) {
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
                  item.category,
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
              item.name,
              style: AppTextStyles.sectionTitle(isDesktop: false).copyWith(fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            style: AppTextStyles.cardDescription(color: AppColors.textMedium)
                .copyWith(fontSize: 14.5, height: 1.6),
          ),
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
                Icon(Icons.settings_input_antenna_rounded, color: style.color, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COMMUNICATION INTERFACE',
                        style: AppTextStyles.badgeText(color: AppColors.textMuted)
                            .copyWith(fontSize: 10.5, ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.communication,
                        style: AppTextStyles.cardTitle().copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Technical Specifications', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth >= 400 ? (c.maxWidth - 12) / 2 : c.maxWidth;
              final entries = item.specs.entries.toList();
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: entries.map((entry) {
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
                            child: Icon(Icons.tune_rounded, size: 18, color: style.color),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key,
                                  style: AppTextStyles.badgeText(color: AppColors.textMuted)
                                      .copyWith(fontSize: 10, ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  entry.value,
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
          Text('Key Features & Architecture', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...item.highlights.map(
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
          if (item.catalogModels.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text('Ordering Model Codes (Tap to copy)', style: AppTextStyles.cardTitle().copyWith(fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: item.catalogModels
                  .map((m) => _ModelChip(
                model: m,
                accent: style.color,
                onTap: () async {
                  final code = m.split(' (').first.trim();
                  await Clipboard.setData(ClipboardData(text: code));
                  if (!context.mounted) return;
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    SnackBar(
                      content: Text('Copied $code to clipboard'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ))
                  .toList(),
            ),
          ],
          const SizedBox(height: 24),
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

// ─────────────────────────────────────────────────────────────
//  REUSABLE WIDGETS
// ─────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;
  final bool isDesktop;
  final bool centered;

  const _SectionHeader({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.isDesktop,
    required this.centered,
  });

  @override
  Widget build(BuildContext context) {
    final align = centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            eyebrow,
            style: AppTextStyles.badgeText(color: AppColors.primaryTeal),
            textAlign: textAlign,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
            textAlign: textAlign,
          ),
          const SizedBox(height: 12),
          Container(
            width: 54,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_kTeal, _kMint]),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              subtitle,
              style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool dark;

  const _ImagePlaceholder({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = dark ? Colors.white : AppColors.textDark;
    final subColor = dark ? Colors.white70 : AppColors.textMuted;
    final iconColor = dark ? Colors.white54 : const Color(0xFF94A3B8);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: iconColor),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: titleColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: subColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _OsPillarChip extends StatelessWidget {
  final _OsPillar pillar;
  const _OsPillarChip({required this.pillar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: pillar.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: pillar.color.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(pillar.icon, size: 17, color: pillar.color),
          const SizedBox(width: 8),
          Text(
            pillar.label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: pillar.color,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModelChip extends StatelessWidget {
  final String model;
  final Color accent;
  final VoidCallback onTap;

  const _ModelChip({
    required this.model,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final idx = model.indexOf(' (');
    final code = idx == -1 ? model : model.substring(0, idx);
    final desc = idx == -1
        ? ''
        : model.substring(idx + 2).replaceAll(RegExp(r'\)$'), '');

    return Tooltip(
      message: 'Tap to copy',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.bgLightGrey,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        code,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w800,
                          color: accent,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.copy_rounded,
                        size: 11, color: AppColors.textMuted),
                  ],
                ),
                if (desc.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                      height: 1.3,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: _kMint),
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

class _HeroFloatingChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroFloatingChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return _Floating(
      amplitude: 5,
      duration: const Duration(milliseconds: 3600),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: _kDeepTeal.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: Colors.white24),
          boxShadow: AppShadows.md,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: _kMint, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final double size;
  final Color color;
  final double alpha;

  const _GlowBlob({
    required this.size,
    required this.color,
    required this.alpha,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: alpha),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverLift extends StatefulWidget {
  final Widget child;
  final double radius;
  final Color glow;

  const _HoverLift({
    required this.child,
    required this.radius,
    required this.glow,
  });

  @override
  State<_HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<_HoverLift> {
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: AppShadows.sm,
        ),
        child: widget.child,
      ),
    );
  }
}

class _Floating extends StatefulWidget {
  final Widget child;
  final double amplitude;
  final Duration duration;

  const _Floating({
    required this.child,
    this.amplitude = 8,
    this.duration = const Duration(milliseconds: 3200),
  });

  @override
  State<_Floating> createState() => _FloatingState();
}

class _FloatingState extends State<_Floating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -widget.amplitude * _curve.value),
        child: child,
      ),
    );
  }
}

class _FadeSlideIn extends StatelessWidget {
  final Widget child;
  final int ms;

  const _FadeSlideIn({required this.child, this.ms = 600});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: ms),
      curve: Curves.easeOutCubic,
      builder: (context, v, child) => Opacity(
        opacity: v,
        child: Transform.translate(
          offset: Offset(0, 22 * (1 - v)),
          child: child,
        ),
      ),
      child: child,
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  PAINTERS
// ─────────────────────────────────────────────────────────────
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

class _DotGridPainter extends CustomPainter {
  final Color color;
  const _DotGridPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    const step = 22.0;
    for (double x = step / 2; x < size.width; x += step) {
      for (double y = step / 2; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) =>
      oldDelegate.color != color;
}