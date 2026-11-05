import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_design.dart';
import '../theme/app_text_styles.dart';
import 'motion.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onDownloadApp;
  final Function(String)? onNavSelected;

  const HeroSection({
    super.key,
    this.onDownloadApp,
    this.onNavSelected,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  // One controller drives the whole load sequence:
  // badge -> headline (word by word) -> subtitle -> buttons -> stats.
  late final AnimationController _intro = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2600),
  );
  bool _started = false;

  static const _headline =
      'Automate Your Farm & Water Systems with Precision Intelligence';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (Motion.reduced(context)) {
      _intro.value = 1;
    } else {
      _intro.forward();
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;
    return isDesktop ? _buildDesktop(size) : _buildMobile();
  }

  // ───────────────────────── Mobile ─────────────────────────
  Widget _buildMobile() {
    return Container(
      color: const Color(0xFF0F172A),
      child: Column(
        children: [
          // Photo: fades in while easing from a slight zoom; bottom edge
          // blends into the dark action banner.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60),
            color: const Color(0xFF0F172A),
            child: AspectRatio(
              aspectRatio: 1813 / 868,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedBuilder(
                    animation: _intro,
                    builder: (context, child) {
                      final t = Curves.easeOutCubic
                          .transform((_intro.value / 0.5).clamp(0.0, 1.0));
                      return Opacity(
                        opacity: t,
                        child: Transform.scale(scale: 1.06 - 0.06 * t, child: child),
                      );
                    },
                    child: Image.asset(
                      'assets/images/hero_background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x000F172A), Color(0xFF0F172A)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                _Stage(
                  parent: _intro,
                  begin: 0.10,
                  end: 0.35,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C6FF).withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF00C6FF).withValues(alpha: 0.4),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.hub_rounded,
                            color: Color(0xFF00C6FF), size: 14),
                        SizedBox(width: 6),
                        Text(
                          'Smart farm & water automation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _Stage(
                  parent: _intro,
                  begin: 0.22,
                  end: 0.50,
                  child: const Text(
                    'Automate Your Farm & Water Systems',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _Stage(
                  parent: _intro,
                  begin: 0.34,
                  end: 0.62,
                  child: const Text(
                    '2 km wireless LoRa valves, precision fertigation dosing & smart pump controllers — unified under ORO GEM OS.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                      height: 1.45,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                _Stage(
                  parent: _intro,
                  begin: 0.48,
                  end: 0.78,
                  child: Row(
                    children: [
                      Expanded(
                        child: PressableScale(
                          hoverScale: 1.02,
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                widget.onNavSelected?.call('ORO GEM OS'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryDeep,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                              elevation: 0,
                            ),
                            icon: const Icon(Icons.rocket_launch_rounded,
                                size: 16),
                            label: const Text(
                              'Explore solutions',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PressableScale(
                          hoverScale: 1.02,
                          child: OutlinedButton.icon(
                            onPressed: widget.onDownloadApp,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.white70, width: 1.5),
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                            ),
                            icon: const Icon(Icons.phone_android_rounded,
                                size: 16),
                            label: const Text(
                              'Get app',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
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

  // ───────────────────────── Desktop ─────────────────────────
  Widget _buildDesktop(Size size) {
    final words = _headline.split(' ');

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Color(0xFF0F172A)),
      child: Stack(
        children: [
          // 1. Photo with a very slow zoom
          Positioned.fill(
            child: SlowZoom(
              child: Image.asset(
                'assets/images/hero_background.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

          // 2. Darkening gradient (unchanged from original)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.65),
                    Colors.black.withValues(alpha: 0.35),
                    Colors.black.withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // 3. Slow drifting colour glow
          const Positioned.fill(child: AuroraBackground(intensity: 0.22)),

          // 4. Content
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 130, 60, 110),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Stage(
                        parent: _intro,
                        begin: 0.04,
                        end: 0.22,
                        child: _glassBadge(),
                      ),
                      const SizedBox(height: 24),

                      // Headline, one word at a time
                      Semantics(
                        header: true,
                        label: _headline,
                        child: ExcludeSemantics(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 14,
                            runSpacing: 0,
                            children: [
                              for (var i = 0; i < words.length; i++)
                                _Stage(
                                  parent: _intro,
                                  begin: 0.12 + i * 0.045,
                                  end: 0.12 + i * 0.045 + 0.26,
                                  dy: 26,
                                  child: Text(
                                    words[i],
                                    style: AppTextStyles.heroHeading(
                                        isDesktop: true)
                                        .copyWith(
                                      color: Colors.white,
                                      fontSize: 52,
                                      height: 1.18,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.5),
                                          blurRadius: 20,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      _Stage(
                        parent: _intro,
                        begin: 0.46,
                        end: 0.70,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 820),
                          child: Text(
                            'From 2 km wireless LoRa field valves and EC/pH fertigation dosing to smart single & 3-phase pump controllers — fully unified under ORO GEM OS.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.heroSubheading(isDesktop: true)
                                .copyWith(
                              color: Colors.white.withValues(alpha: 0.92),
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),

                      _Stage(
                        parent: _intro,
                        begin: 0.58,
                        end: 0.84,
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 14,
                          alignment: WrapAlignment.center,
                          children: [
                            PressableScale(
                              child: AppButton(
                                'Explore solutions',
                                trailingIcon: Icons.arrow_forward_rounded,
                                onPressed: () =>
                                    widget.onNavSelected?.call('ORO GEM OS'),
                              ),
                            ),
                            PressableScale(
                              child: AppButton(
                                'Smart Water',
                                style: AppButtonStyle.secondary,
                                onDark: true,
                                onPressed: () =>
                                    widget.onNavSelected?.call('Smart Water'),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: widget.onDownloadApp,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                minimumSize: const Size(0, 48),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              icon: const Icon(Icons.phone_android_rounded, size: 18),
                              label: Text(
                                'Get the mobile app',
                                style: AppTextStyles.buttonText(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 44),

                      _Stage(
                        parent: _intro,
                        begin: 0.72,
                        end: 1.0,
                        child: _statStrip(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 5. Scroll cue
          Positioned(
            bottom: 26,
            left: 0,
            right: 0,
            child: _Stage(
              parent: _intro,
              begin: 0.85,
              end: 1.0,
              dy: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () => widget.onNavSelected?.call('ORO GEM OS'),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Floating(
                      amplitude: 7,
                      duration: const Duration(milliseconds: 1500),
                      child: Icon(
                        Icons.keyboard_double_arrow_down_rounded,
                        color: Colors.white.withValues(alpha: 0.75),
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glassBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.hub_rounded, color: Color(0xFF00C6FF), size: 18),
          SizedBox(width: 8),
          Text(
            'Smart farm & water automation, built on 10+ years of experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Four facts taken from the page's own copy. Numbers count up.
  Widget _statStrip() {
    const valueStyle = TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      height: 1.1,
    );
    const labelStyle = TextStyle(
      color: Colors.white70,
      fontSize: 12.5,
      height: 1.3,
    );

    Widget item(IconData icon, Widget value, String label) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF00C6FF), size: 26),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [value, const SizedBox(height: 3), Text(label, style: labelStyle)],
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 48,
        runSpacing: 18,
        children: [
          item(
            Icons.workspace_premium_rounded,
            const CountUp(
              end: 10,
              suffix: '+',
              style: valueStyle,
              delay: Duration(milliseconds: 1700),
            ),
            'Years of field experience',
          ),
          item(
            Icons.cell_tower_rounded,
            const CountUp(
              end: 2,
              suffix: ' km',
              style: valueStyle,
              delay: Duration(milliseconds: 1900),
            ),
            'Wireless LoRa valve range',
          ),
          item(
            Icons.science_rounded,
            const Text('EC / pH', style: valueStyle),
            'Precision fertigation dosing',
          ),
          item(
            Icons.electric_bolt_rounded,
            const Text('1-ph & 3-ph', style: valueStyle),
            'Smart pump controllers',
          ),
        ],
      ),
    );
  }
}

/// Fades + slides its child in during [begin]..[end] of the parent animation.
class _Stage extends StatelessWidget {
  final Animation<double> parent;
  final double begin;
  final double end;
  final double dy;
  final Widget child;

  const _Stage({
    required this.parent,
    required this.begin,
    required this.end,
    required this.child,
    this.dy = 18,
  });

  @override
  Widget build(BuildContext context) {
    final interval = Interval(begin, end.clamp(0.0, 1.0), curve: Curves.easeOutCubic);
    return AnimatedBuilder(
      animation: parent,
      child: child,
      builder: (context, child) {
        final t = interval.transform(parent.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(offset: Offset(0, dy * (1 - t)), child: child),
        );
      },
    );
  }
}