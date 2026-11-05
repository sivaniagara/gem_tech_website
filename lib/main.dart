import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme/app_colors.dart';
import 'widgets/about_section.dart';
import 'widgets/fertigation_showcase_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/gem_logo_painter.dart';
import 'widgets/header_nav.dart';
import 'widgets/hero_section.dart';
import 'widgets/oro_controllers_showcase_section.dart';
import 'widgets/oro_gem_ecosystem_section.dart';
import 'widgets/sensors_showcase_section.dart';
import 'widgets/smart_water_control_section.dart';
import 'widgets/valve_showcase_section.dart';

void main() {
  runApp(const GemTechApp());
}

class GemTechApp extends StatelessWidget {
  const GemTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORO GEM Tech - Smart Farm & Water Automation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryTeal,
          primary: AppColors.primaryTeal,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const GemTechHomePage(),
    );
  }
}

class GemTechHomePage extends StatefulWidget {
  const GemTechHomePage({super.key});

  @override
  State<GemTechHomePage> createState() => _GemTechHomePageState();
}

class _GemTechHomePageState extends State<GemTechHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _oroGemEcosystemKey = GlobalKey();
  final GlobalKey _smartWaterKey = GlobalKey();
  final GlobalKey _fertigationKey = GlobalKey();
  final GlobalKey _oroControllersKey = GlobalKey();
  final GlobalKey _sensorsKey = GlobalKey();
  final GlobalKey _valvesKey = GlobalKey();

  String _activeNav = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 60) {
      if (_activeNav != 'Valves') {
        setState(() => _activeNav = 'Valves');
      }
      return;
    }

    final sections = <MapEntry<String, GlobalKey>>[
      MapEntry('Home', _heroKey),
      MapEntry('About', _aboutKey),
      MapEntry('ORO GEM OS', _oroGemEcosystemKey),
      MapEntry('Smart Water', _smartWaterKey),
      MapEntry('Fertigation', _fertigationKey),
      MapEntry('Controllers', _oroControllersKey),
      MapEntry('Sensors', _sensorsKey),
      MapEntry('Valves', _valvesKey),
    ];

    String newActive = 'Home';
    const threshold = 180.0;

    for (final entry in sections) {
      final ctx = entry.value.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          final topY = box.localToGlobal(Offset.zero).dy;
          if (topY <= threshold) {
            newActive = entry.key;
          } else {
            break;
          }
        }
      }
    }

    if (newActive != _activeNav) {
      setState(() {
        _activeNav = newActive;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNavSelected(String nav) {
    switch (nav) {
      case 'Home':
        setState(() => _activeNav = 'Home');
        _scrollToSection(_heroKey);
        break;
      case 'About':
      case 'About Us':
        setState(() => _activeNav = 'About');
        _scrollToSection(_aboutKey);
        break;
      case 'ORO GEM OS':
      case 'Ecosystem':
        setState(() => _activeNav = 'ORO GEM OS');
        _scrollToSection(_oroGemEcosystemKey);
        break;
      case 'Smart Water':
        setState(() => _activeNav = 'Smart Water');
        _scrollToSection(_smartWaterKey);
        break;
      case 'Fertigation':
      case 'NutriFlow':
        setState(() => _activeNav = 'Fertigation');
        _scrollToSection(_fertigationKey);
        break;
      case 'Controllers':
      case 'ORO Controllers':
        setState(() => _activeNav = 'Controllers');
        _scrollToSection(_oroControllersKey);
        break;
      case 'Sensors':
        setState(() => _activeNav = 'Sensors');
        _scrollToSection(_sensorsKey);
        break;
      case 'Valves':
      case 'Products':
        setState(() => _activeNav = 'Valves');
        _scrollToSection(_valvesKey);
        break;
      default:
        _scrollToSection(_smartWaterKey);
        break;
    }
  }

  static const String _kPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.niagaraautomations.oroDripirrigation';

  Future<void> _openPlayStore() async {
    final Uri uri = Uri.parse(_kPlayStoreUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri);
      }
    } catch (_) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  void _showGetAppDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.shop_rounded, color: AppColors.primaryTeal, size: 28),
            SizedBox(width: 10),
            Text('Get ORO GEM App'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ORO GEM Mobile App is available on Google Play Store.\nAutomate and manage your farm and smart water systems from anywhere!',
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: AppColors.primaryTeal, size: 18),
                SizedBox(width: 8),
                Text('Real-time motor & valve monitoring', style: TextStyle(fontSize: 13)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: AppColors.primaryTeal, size: 18),
                SizedBox(width: 8),
                Text('Remote fertigation & scheduling', style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _openPlayStore();
            },
            icon: const Icon(Icons.open_in_new_rounded, size: 18),
            label: const Text('Open in Play Store'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryTeal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF38BDF8), size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              left: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GemLogoWidget(
                        height: 60,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Smart Farm & Water Automation',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMedium,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _drawerTile(
                          icon: Icons.home_rounded,
                          title: 'Home',
                          onTap: () => _handleNavSelected('Home'),
                        ),
                        _drawerTile(
                          icon: Icons.info_outline_rounded,
                          title: 'About Us',
                          onTap: () => _handleNavSelected('About'),
                        ),
                        _drawerTile(
                          icon: Icons.hub_rounded,
                          title: 'ORO GEM OS & Ecosystem',
                          onTap: () => _handleNavSelected('ORO GEM OS'),
                        ),
                        _drawerTile(
                          icon: Icons.water_drop_rounded,
                          title: 'Smart Water Control',
                          onTap: () => _handleNavSelected('Smart Water'),
                        ),
                        _drawerTile(
                          icon: Icons.science_rounded,
                          title: 'NutriFlow Fertigation',
                          onTap: () => _handleNavSelected('Fertigation'),
                        ),
                        _drawerTile(
                          icon: Icons.memory_rounded,
                          title: 'ORO Controllers',
                          onTap: () => _handleNavSelected('Controllers'),
                        ),
                        _drawerTile(
                          icon: Icons.sensors_rounded,
                          title: 'Precision Sensors',
                          onTap: () => _handleNavSelected('Sensors'),
                        ),
                        _drawerTile(
                          icon: Icons.tune_rounded,
                          title: 'Valves Showcase',
                          onTap: () => _handleNavSelected('Valves'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryTeal, AppColors.accentCyan],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryTeal.withValues(alpha: 0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showGetAppDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone_android_rounded, size: 18, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Get the App',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _heroKey,
                  onDownloadApp: _showGetAppDialog,
                  onNavSelected: _handleNavSelected,
                ),
                AboutSection(
                  key: _aboutKey,
                  onNavSelected: _handleNavSelected,
                  onBecomePartner: () => _handleNavSelected('ORO GEM OS'),
                ),
                OroGemEcosystemSection(
                  key: _oroGemEcosystemKey,
                ),
                SmartWaterControlSection(
                  key: _smartWaterKey,
                ),
                FertigationShowcaseSection(
                  key: _fertigationKey,
                ),
                OroControllersShowcaseSection(
                  key: _oroControllersKey,
                ),
                SensorsShowcaseSection(
                  key: _sensorsKey,
                ),
                ValveShowcaseSection(
                  key: _valvesKey,
                ),
                FooterSection(
                  onNavSelected: _handleNavSelected,
                  onDownloadApp: _showGetAppDialog,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderNav(
              activeItem: _activeNav,
              isTransparent: true,
              onGetAppPressed: _showGetAppDialog,
              onNavSelected: _handleNavSelected,
            ),
          ),
        ],
      ),
    );
  }
}
