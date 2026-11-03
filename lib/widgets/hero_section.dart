import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onDownloadApp;
  final Function(String)? onNavSelected;

  const HeroSection({
    super.key,
    this.onDownloadApp,
    this.onNavSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    if (!isDesktop) {
      // Mobile View: 100% full uncropped hero background photo + action card below it
      return Container(
        color: const Color(0xFF0F172A),
        child: Column(
          children: [
            // Top Hero Image Container (100% full, uncropped photo)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60), // Space for top logo bar
              color: const Color(0xFF0F172A),
              child: AspectRatio(
                aspectRatio: 1813 / 868, // Exact native aspect ratio of hero_background.png
                child: Image.asset(
                  'assets/images/hero_background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Hero Action Banner (Sits directly below the hero photo)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF1E293B),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // Pill badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C6FF).withOpacity(0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF00C6FF).withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.hub_rounded, color: Color(0xFF00C6FF), size: 14),
                        SizedBox(width: 6),
                        Text(
                          'SMART FARM & WATER AUTOMATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  const Text(
                    'Automate Your Farm & Water Systems',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  const Text(
                    '2 km wireless LoRa valves, precision fertigation dosing & smart pump controllers — unified under ORO GEM OS.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => onNavSelected?.call('ORO GEM OS'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00ADFF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 4,
                          ),
                          icon: const Icon(Icons.rocket_launch_rounded, size: 16),
                          label: const Text(
                            'Explore Solutions',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: onDownloadApp,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white70, width: 1.5),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: const Icon(Icons.phone_android_rounded, size: 16),
                          label: const Text(
                            'Get App',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Desktop View
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hero_background.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.65),
              Colors.black.withOpacity(0.35),
              Colors.black.withOpacity(0.85),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60, 130, 60, 80),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Glass Pill Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00C6FF).withOpacity(0.25),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.hub_rounded, color: Color(0xFF00C6FF), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'NEXT-GEN SMART FARM & WATER AUTOMATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Headline
                  Text(
                    'Automate Your Farm & Water Systems with Precision Intelligence',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heroHeading(isDesktop: true).copyWith(
                      color: Colors.white,
                      fontSize: 52,
                      height: 1.18,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Subtitle
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 820),
                    child: Text(
                      'From 2 km wireless LoRa field valves and EC/pH fertigation dosing to smart single & 3-phase pump controllers — fully unified under ORO GEM OS.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heroSubheading(isDesktop: true).copyWith(
                        color: Colors.white.withOpacity(0.92),
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // CTA Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 14,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => onNavSelected?.call('ORO GEM OS'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00ADFF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                          shadowColor: const Color(0xFF00ADFF).withOpacity(0.5),
                        ),
                        icon: const Icon(Icons.rocket_launch_rounded, size: 20),
                        label: const Text(
                          'Explore Solutions',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),

                      OutlinedButton.icon(
                        onPressed: () => onNavSelected?.call('Selector'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white70, width: 1.5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.auto_awesome_rounded, size: 20),
                        label: const Text(
                          'Product Finder Quiz',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),

                      ElevatedButton.icon(
                        onPressed: onDownloadApp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.phone_android_rounded, size: 20),
                        label: const Text(
                          'Get Mobile App',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
