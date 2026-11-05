import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'motion.dart';
import '../theme/app_design.dart';

class HeaderNav extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onGetAppPressed;
  final Function(String)? onNavSelected;
  final bool isTransparent;

  /// Which nav item is highlighted. Pass the section currently in view
  /// (e.g. from your scroll listener) so the highlight follows the page.
  final String activeItem;

  const HeaderNav({
    super.key,
    this.onGetAppPressed,
    this.onNavSelected,
    this.isTransparent = false,
    this.activeItem = 'Home',
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  static const _links = <String>[
    'Home',
    'About',
    'ORO GEM OS',
    'Smart Water',
    'Fertigation',
    'Controllers',
    'Sensors',
    'Valves',
    'AI System',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;

    // One entrance for the whole bar: slides down and fades in on load.
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Motion.reduced(context)
          ? Duration.zero
          : const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, v, child) => Opacity(
        opacity: v,
        child: Transform.translate(offset: Offset(0, -18 * (1 - v)), child: child),
      ),
      child: isDesktop
          ? _buildDesktop(context, screenWidth)
          : _buildMobile(context),
    );
  }

  // ───────────────────────── Mobile ─────────────────────────
  Widget _buildMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PressableScale(
            hoverScale: 1.03,
            child: InkWell(
              onTap: () => onNavSelected?.call('Home'),
              borderRadius: BorderRadius.circular(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _LogoMark(size: 36, radius: 10, iconSize: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'ORO GEM',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 0.8,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const _PulseDot(size: 5),
                ],
              ),
            ),
          ),
          PressableScale(
            hoverScale: 1.08,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                borderRadius: BorderRadius.circular(25),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.menu_rounded,
                        size: 22,
                        color: Colors.white,
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

  // ───────────────────────── Desktop ─────────────────────────
  Widget _buildDesktop(BuildContext context, double width) {
    // Tighter spacing on narrow desktops so 8 links never overflow.
    final compact = width < 1320;
    // Below this width only the logo mark is shown so 9 links still fit.
    final tight = width < 1100;
    final showCta = width >= 1440 && onGetAppPressed != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tight ? 16 : (compact ? 24 : 60), vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand island
          _HeaderIsland(
            isTransparent: isTransparent,
            child: PressableScale(
              hoverScale: 1.03,
              child: InkWell(
                onTap: () => onNavSelected?.call('Home'),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _LogoMark(size: 40, radius: 12, iconSize: 24),
                      if (!tight) ...[
                        const SizedBox(width: 12),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Text(
                            'ORO',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'GEM',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const _PulseDot(size: 6),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Nav island
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: _HeaderIsland(
                  isTransparent: isTransparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final title in _links)
                        _NavLink(
                          title: title,
                          compact: compact,
                          tight: tight,
                          isSelected: title == activeItem,
                          isAi: title == 'AI System',
                          onTap: () => onNavSelected?.call(title),
                        ),
                      if (showCta) ...[
                        const SizedBox(width: 6),
                        _GetAppButton(onTap: onGetAppPressed!),
                      ],
                    ],
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

// ───────────────────────── Pieces ─────────────────────────

class _LogoMark extends StatelessWidget {
  final double size;
  final double radius;
  final double iconSize;

  const _LogoMark({
    required this.size,
    required this.radius,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00C6FF).withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(Icons.eco_rounded, color: Colors.white, size: iconSize),
    );
  }
}

/// The small cyan dot after the logo; softly pulses like a "live" indicator.
class _PulseDot extends StatefulWidget {
  final double size;
  const _PulseDot({required this.size});

  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context)) {
      _c.stop();
    } else if (!_c.isAnimating) {
      _c.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) => Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: const Color(0xFF00C6FF),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00C6FF).withValues(alpha: 0.35 + 0.35 * _c.value),
              blurRadius: 4 + 6 * _c.value,
              spreadRadius: 1.5 * _c.value,
            ),
          ],
        ),
      ),
    );
  }
}

class _GetAppButton extends StatelessWidget {
  final VoidCallback onTap;
  const _GetAppButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.accentBlueDeep,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone_android_rounded, size: 16, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  'Get App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
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

class _HeaderIsland extends StatelessWidget {
  final Widget child;
  final bool isTransparent;

  const _HeaderIsland({
    required this.child,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    // Animates between solid and frosted when the parent flips isTransparent.
    final island = AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: isTransparent ? 0.88 : 1.0),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppShadows.md,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: child,
    );

    if (isTransparent) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: island,
        ),
      );
    }
    return island;
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final bool isSelected;
  final bool isAi;
  final bool compact;
  final bool tight;
  final VoidCallback? onTap;

  const _NavLink({
    required this.title,
    this.isSelected = false,
    this.isAi = false,
    this.compact = false,
    this.tight = false,
    this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isSelected;
    final hPad = widget.tight ? 9.0 : (widget.compact ? 12.0 : 18.0);
    final textColor = active
        ? Colors.white
        : (isHovered ? const Color(0xFF0072FF) : AppColors.textDark);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (hover) => setState(() => isHovered = hover),
        borderRadius: BorderRadius.circular(25),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 10),
          decoration: BoxDecoration(
            color: active
                ? AppColors.accentBlueDeep
                : (isHovered ? AppColors.primarySoft : null),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.isAi) ...[
                    AnimatedRotation(
                      turns: isHovered ? 0.25 : 0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutBack,
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        size: 15,
                        color: active
                            ? Colors.white
                            : (isHovered
                            ? const Color(0xFF0072FF)
                            : const Color(0xFF00C6FF)),
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: AppTextStyles.navLink(isSelected: active || isHovered)
                        .copyWith(
                      color: textColor,
                      fontWeight: active
                          ? FontWeight.w700
                          : (isHovered ? FontWeight.w600 : FontWeight.w500),
                      fontSize: widget.tight ? 13.0 : (widget.compact ? 13.5 : 14.5),
                    ),
                    child: Text(widget.title),
                  ),
                ],
              ),
              // Underline that grows from the centre on hover
              Positioned(
                bottom: -6,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  height: 2,
                  width: (!active && isHovered) ? 18 : 0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C6FF),
                    borderRadius: BorderRadius.circular(2),
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