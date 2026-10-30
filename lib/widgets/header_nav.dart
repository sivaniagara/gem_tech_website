import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class HeaderNav extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onGetAppPressed;
  final Function(String)? onNavSelected;
  final bool isTransparent;

  const HeaderNav({
    super.key,
    this.onGetAppPressed,
    this.onNavSelected,
    this.isTransparent = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Island: Premium Brand Logo
          _HeaderIsland(
            isTransparent: isTransparent,
            child: InkWell(
              onTap: () => onNavSelected?.call('Home'),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Glowing Gradient Icon Box
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00C6FF).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.eco_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Gradient ORO + GEM
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Mini Tech Accent Dot
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00C6FF),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00C6FF).withOpacity(0.6),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Island: Desktop Nav Links
          if (isDesktop)
            _HeaderIsland(
              isTransparent: isTransparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NavLink(
                    title: 'Home',
                    isSelected: true,
                    onTap: () => onNavSelected?.call('Home'),
                  ),
                  _NavLink(
                    title: 'Features',
                    onTap: () => onNavSelected?.call('Features'),
                  ),
                  _NavLink(
                    title: 'Products',
                    onTap: () => onNavSelected?.call('Products'),
                  ),
                  _NavLink(
                    title: 'How it Works',
                    onTap: () => onNavSelected?.call('How it Works'),
                  ),
                  _NavLink(
                    title: 'AI System',
                    isAi: true,
                    onTap: () => onNavSelected?.call('AI System'),
                  ),
                ],
              ),
            )
          else
            // Mobile Menu Button Island
            _HeaderIsland(
              isTransparent: isTransparent,
              child: IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  size: 26,
                  color: AppColors.textDark,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
        ],
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
    Widget island = Container(
      decoration: BoxDecoration(
        color: isTransparent
            ? Colors.white.withOpacity(0.92)
            : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white,
          width: 1.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFF00C6FF).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
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
  final VoidCallback? onTap;

  const _NavLink({
    required this.title,
    this.isSelected = false,
    this.isAi = false,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (hover) => setState(() => isHovered = hover),
        borderRadius: BorderRadius.circular(25),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: active
                ? const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: !active && isHovered
                ? const Color(0xFF00C6FF).withOpacity(0.08)
                : (active ? null : Colors.transparent),
            borderRadius: BorderRadius.circular(25),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: const Color(0xFF00C6FF).withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isAi) ...[
                Icon(
                  Icons.auto_awesome_rounded,
                  size: 15,
                  color: active
                      ? Colors.white
                      : (isHovered ? const Color(0xFF0072FF) : const Color(0xFF00C6FF)),
                ),
                const SizedBox(width: 6),
              ],
              Text(
                widget.title,
                style: AppTextStyles.navLink(
                  isSelected: active || isHovered,
                ).copyWith(
                  color: active
                      ? Colors.white
                      : (isHovered ? const Color(0xFF0072FF) : AppColors.textDark),
                  fontWeight: active ? FontWeight.w700 : (isHovered ? FontWeight.w600 : FontWeight.w500),
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
