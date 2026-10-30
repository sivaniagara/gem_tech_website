import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'widgets/hero_section.dart';
import 'widgets/scale_solutions_section.dart';
import 'widgets/knowledge_hub_section.dart';
import 'widgets/products_showcase_section.dart';
import 'widgets/farm_architecture_section.dart';
import 'widgets/testimonials_section.dart';
import 'widgets/footer_section.dart';

void main() {
  runApp(const GemTechApp());
}

class GemTechApp extends StatelessWidget {
  const GemTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORO GEM Tech - Smart Farm & Irrigation Automation',
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
  final GlobalKey _scaleSolutionsKey = GlobalKey();
  final GlobalKey _knowledgeHubKey = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _architectureKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();

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
      case 'Features':
        _scrollToSection(_scaleSolutionsKey);
        break;
      case 'Products':
        _scrollToSection(_productsKey);
        break;
      case 'How it Works':
        _scrollToSection(_architectureKey);
        break;
      case 'AI System':
        _scrollToSection(_knowledgeHubKey);
        break;
    }
  }

  void _showGetAppDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.download_rounded, color: AppColors.primaryTeal, size: 28),
            SizedBox(width: 10),
            Text('Get ORO GEM App'),
          ],
        ),
        content: const Text(
          'ORO GEM Mobile App is available for Android and iOS.\nDownload to automate and manage your farm from anywhere!',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
                      'Smart Farm Automation',
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
                leading: const Icon(Icons.star_rounded, color: AppColors.primaryTeal),
                title: const Text('Features'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Features');
                },
              ),
              ListTile(
                leading: const Icon(Icons.grid_view_rounded, color: AppColors.primaryTeal),
                title: const Text('Products'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('Products');
                },
              ),
              ListTile(
                leading: const Icon(Icons.hub_rounded, color: AppColors.primaryTeal),
                title: const Text('How it Works'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('How it Works');
                },
              ),
              ListTile(
                leading: const Icon(Icons.psychology_rounded, color: AppColors.primaryTeal),
                title: const Text('AI System'),
                onTap: () {
                  Navigator.pop(context);
                  _handleNavSelected('AI System');
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              key: _heroKey,
              onDownloadApp: _showGetAppDialog,
              onNavSelected: _handleNavSelected,
            ),
            ScaleSolutionsSection(
              key: _scaleSolutionsKey,
            ),
            KnowledgeHubSection(
              key: _knowledgeHubKey,
            ),
            ProductsShowcaseSection(
              key: _productsKey,
            ),
            FarmArchitectureSection(
              key: _architectureKey,
            ),
            TestimonialsSection(
              key: _testimonialsKey,
            ),
            FooterSection(
              onDownloadApp: _showGetAppDialog,
            ),
          ],
        ),
      ),
    );
  }
}
