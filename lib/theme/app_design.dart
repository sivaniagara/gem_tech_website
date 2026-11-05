import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// Spacing scale (8-pt grid).
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Vertical padding for a full-width page section.
  static double sectionY(bool isDesktop) => isDesktop ? 96 : 56;
  static double sectionX(double width) => width >= 900 ? 60 : (width >= 600 ? 32 : 20);
}

/// Corner radii. Four steps only, so every surface feels related.
///  sm  – tags, small tiles      md – inputs, chips, buttons
///  lg  – cards                  xl – large panels, dialogs
class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;
}

/// Neutral, navy-tinted elevation. No colored glows.
class AppShadows {
  static const List<BoxShadow> sm = [
    BoxShadow(color: Color(0x0A0F172A), blurRadius: 8, offset: Offset(0, 2)),
  ];
  static const List<BoxShadow> md = [
    BoxShadow(color: Color(0x0D0F172A), blurRadius: 4, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x120F172A), blurRadius: 24, offset: Offset(0, 8)),
  ];
  static const List<BoxShadow> lg = [
    BoxShadow(color: Color(0x0F0F172A), blurRadius: 8, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x1A0F172A), blurRadius: 40, offset: Offset(0, 20)),
  ];
}

class AppLayout {
  static const double maxContentWidth = 1200;
  static bool isDesktop(BuildContext c) => MediaQuery.of(c).size.width >= 900;
}

/// Full-width section with consistent padding and a centered content column.
class AppSection extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Gradient? gradient;
  final double maxWidth;

  const AppSection({
    super.key,
    required this.child,
    this.color,
    this.gradient,
    this.maxWidth = AppLayout.maxContentWidth,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: gradient == null ? (color ?? AppColors.bgWhite) : null, gradient: gradient),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sectionX(width),
        vertical: AppSpacing.sectionY(isDesktop),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}

/// Small tinted label above a heading. Sentence case, hairline border, no glow.
class SectionEyebrow extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool onDark;

  const SectionEyebrow(this.text, {super.key, this.icon, this.onDark = false});

  @override
  Widget build(BuildContext context) {
    final fg = onDark ? AppColors.primaryTeal : AppColors.primaryDeep;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: onDark ? AppColors.primaryTeal.withOpacity(0.12) : AppColors.primarySoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(
          color: onDark ? AppColors.primaryTeal.withOpacity(0.28) : AppColors.primaryTeal.withOpacity(0.22),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: fg),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.eyebrow(color: fg),
            ),
          ),
        ],
      ),
    );
  }
}

/// Eyebrow + title + subtitle block used at the top of every section.
class SectionHeader extends StatelessWidget {
  final String? eyebrow;
  final IconData? eyebrowIcon;
  final String title;
  final String? subtitle;
  final bool onDark;
  final bool centered;
  final double maxTextWidth;

  const SectionHeader({
    super.key,
    this.eyebrow,
    this.eyebrowIcon,
    required this.title,
    this.subtitle,
    this.onDark = false,
    this.centered = true,
    this.maxTextWidth = 720,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppLayout.isDesktop(context);
    final align = centered ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          SectionEyebrow(eyebrow!, icon: eyebrowIcon, onDark: onDark),
          const SizedBox(height: 20),
        ],
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxTextWidth),
          child: Text(
            title,
            textAlign: align,
            style: AppTextStyles.sectionTitle(
              isDesktop: isDesktop,
              color: onDark ? AppColors.textWhite : AppColors.textDark,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxTextWidth),
            child: Text(
              subtitle!,
              textAlign: align,
              style: AppTextStyles.sectionSubtitle(
                isDesktop: isDesktop,
                color: onDark ? AppColors.textOnDarkMuted : AppColors.textMuted,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Standard card surface: hairline border + neutral shadow. If [onTap] is set
/// the card responds to hover/focus by deepening its shadow and darkening its
/// border (no movement).
class SurfaceCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool onDark;
  final double radius;
  final Color? accent; // optional 3px top accent line

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.onTap,
    this.onDark = false,
    this.radius = AppRadius.lg,
    this.accent,
  });

  @override
  State<SurfaceCard> createState() => _SurfaceCardState();
}

class _SurfaceCardState extends State<SurfaceCard> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    final interactive = widget.onTap != null;
    final baseBorder = widget.onDark ? AppColors.hairlineOnDark : AppColors.borderLight;
    final activeBorder = widget.onDark
        ? AppColors.primaryTeal.withOpacity(0.5)
        : AppColors.primaryTeal.withOpacity(0.45);

    return FocusableActionDetector(
      enabled: interactive,
      onShowHoverHighlight: (v) => setState(() => _active = v),
      onShowFocusHighlight: (v) => setState(() => _active = v),
      mouseCursor: interactive ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.onDark ? AppColors.surfaceDarkRaised : AppColors.bgCardLight,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: _active ? activeBorder : baseBorder),
            boxShadow: widget.onDark ? const [] : (_active ? AppShadows.md : AppShadows.sm),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Square icon container used in feature rows and stat tiles.
class IconTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final bool onDark;

  const IconTile(
      this.icon, {
        super.key,
        this.color = AppColors.primaryDeep,
        this.size = 44,
        this.onDark = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: onDark ? color.withOpacity(0.16) : color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Icon(icon, size: size * 0.5, color: onDark ? Colors.white : color),
    );
  }
}

enum AppButtonStyle { primary, secondary }

/// One button style for the whole site. Solid fill for primary, hairline
/// outline for secondary. 48px tall, 12px radius, visible focus ring.
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? trailingIcon;
  final AppButtonStyle style;
  final Color color;
  final bool onDark;
  final bool expand;

  const AppButton(
      this.label, {
        super.key,
        this.onPressed,
        this.trailingIcon,
        this.style = AppButtonStyle.primary,
        this.color = AppColors.primaryDeep,
        this.onDark = false,
        this.expand = false,
      });

  @override
  Widget build(BuildContext context) {
    final isPrimary = style == AppButtonStyle.primary;
    final fg = isPrimary ? Colors.white : (onDark ? Colors.white : color);
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(label, overflow: TextOverflow.ellipsis, style: AppTextStyles.buttonText(color: fg)),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: 8),
          Icon(trailingIcon, size: 18, color: fg),
        ],
      ],
    );

    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md));
    const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    final minSize = Size(expand ? double.infinity : 0, 48);

    final button = isPrimary
        ? ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: minSize,
        padding: padding,
        shape: shape,
      ),
      child: child,
    )
        : OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: fg,
        minimumSize: minSize,
        padding: padding,
        shape: shape,
        side: BorderSide(color: onDark ? AppColors.hairlineOnDark : AppColors.borderLight, width: 1.2),
      ),
      child: child,
    );

    return button;
  }
}