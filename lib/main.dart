import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'widgets/about_section.dart';
import 'widgets/fertigation_showcase_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/header_nav.dart';
import 'widgets/hero_section.dart';
import 'widgets/oro_controllers_showcase_section.dart';
import 'widgets/oro_gem_ecosystem_section.dart';
import 'widgets/product_selector_section.dart';
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
  final GlobalKey _selectorKey = GlobalKey();

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
        _scrollToSection(_heroKey);
        break;
      case 'About':
      case 'About Us':
        _scrollToSection(_aboutKey);
        break;
      case 'ORO GEM OS':
      case 'Ecosystem':
        _scrollToSection(_oroGemEcosystemKey);
        break;
      case 'Smart Water':
        _scrollToSection(_smartWaterKey);
        break;
      case 'Fertigation':
      case 'NutriFlow':
        _scrollToSection(_fertigationKey);
        break;
      case 'Controllers':
      case 'ORO Controllers':
        _scrollToSection(_oroControllersKey);
        break;
      case 'Sensors':
        _scrollToSection(_sensorsKey);
        break;
      case 'Valves':
      case 'Products':
        _scrollToSection(_valvesKey);
        break;
      case 'Selector':
      case 'Quiz':
        _scrollToSection(_selectorKey);
        break;
      default:
        _scrollToSection(_smartWaterKey);
        break;
    }
  }

  void _showGetAppDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.download_rounded, color: AppColors.primaryTeal, size: 28),
            SizedBox(width: 10),
            Text('Get ORO GEM App'),
          ],
        ),
        content: const Text(
          'ORO GEM Mobile App is available for Android and iOS.\nDownload to automate and manage your farm and smart water systems from anywhere!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryTeal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Download Now'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                color: AppColors.primaryTeal,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORO GEM',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Smart Farm & Water Automation',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_rounded, color: AppColors.primaryTeal),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded, color: AppColors.primaryTeal),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('About');
                },
              ),
              ListTile(
                leading: const Icon(Icons.hub_rounded, color: AppColors.primaryTeal),
                title: const Text('ORO GEM OS & Ecosystem'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('ORO GEM OS');
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome_rounded, color: AppColors.primaryTeal),
                title: const Text('System Finder & ROI Calculator'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Selector');
                },
              ),
              ListTile(
                leading: const Icon(Icons.water_drop_rounded, color: AppColors.primaryTeal),
                title: const Text('Smart Water Control'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Smart Water');
                },
              ),
              ListTile(
                leading: const Icon(Icons.science_rounded, color: AppColors.primaryTeal),
                title: const Text('NutriFlow Fertigation'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Fertigation');
                },
              ),
              ListTile(
                leading: const Icon(Icons.memory_rounded, color: AppColors.primaryTeal),
                title: const Text('ORO Controllers'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Controllers');
                },
              ),
              ListTile(
                leading: const Icon(Icons.sensors_rounded, color: AppColors.primaryTeal),
                title: const Text('Precision Sensors'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Sensors');
                },
              ),
              ListTile(
                leading: const Icon(Icons.tune_rounded, color: AppColors.primaryTeal),
                title: const Text('Valves Showcase'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Valves');
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showGetAppDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Get the App'),
                  ),
                ),
              ),
            ],
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
                  onBecomePartner: () => _handleNavSelected('Selector'),
                ),
                ProductSelectorSection(
                  key: _selectorKey,
                  onSelectProductCategory: _handleNavSelected,
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
