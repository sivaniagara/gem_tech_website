// motion.dart
// Shared animation toolkit for the ORO GEM site.
// Put this file next to header_nav.dart / hero_section.dart (same folder).
//
// Every widget here respects the OS "reduce motion" setting
// (MediaQuery.disableAnimations) and uses no third-party packages.

import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_design.dart';

/// Timing + curves used everywhere, so the whole site moves the same way.
class Motion {
  Motion._();

  static const Curve enter = Curves.easeOutCubic;
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration base = Duration(milliseconds: 650);

  /// Delay for the i-th item in a staggered group.
  static Duration stagger(int index, {int stepMs = 90, int maxSteps = 6}) =>
      Duration(milliseconds: stepMs * math.min(index, maxSteps));

  static bool reduced(BuildContext context) =>
      MediaQuery.maybeOf(context)?.disableAnimations ?? false;
}

// ─────────────────────────────────────────────────────────────
//  Reveal — plays when the widget SCROLLS into view (not on build)
// ─────────────────────────────────────────────────────────────
enum RevealFrom { bottom, left, right, none }

class Reveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double distance;
  final RevealFrom from;

  /// Fires when the widget's top edge passes this fraction of the viewport
  /// height (0.88 = just before it is fully on screen).
  final double triggerFraction;

  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = Motion.base,
    this.distance = 28,
    this.from = RevealFrom.bottom,
    this.triggerFraction = 0.88,
  });

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: widget.duration);
  late final Animation<double> _curve =
  CurvedAnimation(parent: _c, curve: Motion.enter);
  ScrollPosition? _position;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position?.removeListener(_check);
    _position = Scrollable.maybeOf(context)?.position;
    _position?.addListener(_check);

    if (Motion.reduced(context)) {
      _started = true;
      _c.value = 1;
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_started || !mounted) return;
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) return;
    final top = box.localToGlobal(Offset.zero).dy;
    final viewport = MediaQuery.sizeOf(context).height;
    if (top < viewport * widget.triggerFraction) {
      _started = true;
      _position?.removeListener(_check);
      Future.delayed(widget.delay, () {
        if (mounted) _c.forward();
      });
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_check);
    _c.dispose();
    super.dispose();
  }

  Offset _offset(double v) {
    final d = widget.distance * (1 - v);
    switch (widget.from) {
      case RevealFrom.bottom:
        return Offset(0, d);
      case RevealFrom.left:
        return Offset(-d, 0);
      case RevealFrom.right:
        return Offset(d, 0);
      case RevealFrom.none:
        return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    // The tree shape never changes after first build, so child state
    // (selected tabs, form fields, etc.) is never lost.
    return FadeTransition(
      opacity: _curve,
      child: AnimatedBuilder(
        animation: _curve,
        child: widget.child,
        builder: (context, child) =>
            Transform.translate(offset: _offset(_curve.value), child: child),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  HoverLift — card rises + shadow deepens on hover (desktop/web)
// ─────────────────────────────────────────────────────────────
class HoverLift extends StatefulWidget {
  final Widget child;
  final double lift;
  final double radius;
  /// Kept for backwards compatibility; the hover shadow is now neutral.
  final Color glow;

  const HoverLift({
    super.key,
    required this.child,
    this.lift = 4,
    this.radius = 16,
    this.glow = const Color(0xFF00ADFF),
  });

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final on = _hover && !Motion.reduced(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, on ? -widget.lift : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: on ? AppShadows.lg : AppShadows.sm,
        ),
        child: widget.child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  PressableScale — buttons grow slightly on hover, dip on press
//  (uses a Listener, so it never steals taps from the child)
// ─────────────────────────────────────────────────────────────
class PressableScale extends StatefulWidget {
  final Widget child;
  final double hoverScale;
  final double pressScale;

  const PressableScale({
    super.key,
    required this.child,
    this.hoverScale = 1.02,
    this.pressScale = 0.97,
  });

  @override
  State<PressableScale> createState() => _PressableScaleState();
}

class _PressableScaleState extends State<PressableScale> {
  bool _hover = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final scale = Motion.reduced(context)
        ? 1.0
        : (_down ? widget.pressScale : (_hover ? widget.hoverScale : 1.0));
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) => setState(() => _down = true),
        onPointerUp: (_) => setState(() => _down = false),
        onPointerCancel: (_) => setState(() => _down = false),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Floating — gentle endless bob for badges / phone mockups
// ─────────────────────────────────────────────────────────────
class Floating extends StatefulWidget {
  final Widget child;
  final double amplitude;
  final Duration duration;

  const Floating({
    super.key,
    required this.child,
    this.amplitude = 8,
    this.duration = const Duration(milliseconds: 3200),
  });

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: widget.duration);
  late final Animation<double> _curve =
  CurvedAnimation(parent: _c, curve: Curves.easeInOut);

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
      animation: _curve,
      child: widget.child,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -widget.amplitude * _curve.value),
        child: child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  CountUp — number that counts from 0 to [end]
// ─────────────────────────────────────────────────────────────
class CountUp extends StatelessWidget {
  final double end;
  final int decimals;
  final String prefix;
  final String suffix;
  final TextStyle? style;
  final Duration duration;
  final Duration delay;

  const CountUp({
    super.key,
    required this.end,
    this.decimals = 0,
    this.prefix = '',
    this.suffix = '',
    this.style,
    this.duration = const Duration(milliseconds: 1600),
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    final reduced = Motion.reduced(context);
    return FutureBuilder<void>(
      future: Future<void>.delayed(reduced ? Duration.zero : delay),
      builder: (context, snap) {
        final ready = snap.connectionState == ConnectionState.done;
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: ready ? end : 0),
          duration: reduced ? Duration.zero : duration,
          curve: Curves.easeOutCubic,
          builder: (context, v, _) =>
              Text('$prefix${v.toStringAsFixed(decimals)}$suffix', style: style),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SlowZoom — "Ken Burns" drift for hero photography
// ─────────────────────────────────────────────────────────────
class SlowZoom extends StatefulWidget {
  final Widget child;
  final double maxScale;
  final Duration duration;

  const SlowZoom({
    super.key,
    required this.child,
    this.maxScale = 1.08,
    this.duration = const Duration(seconds: 26),
  });

  @override
  State<SlowZoom> createState() => _SlowZoomState();
}

class _SlowZoomState extends State<SlowZoom>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: widget.duration);
  late final Animation<double> _curve =
  CurvedAnimation(parent: _c, curve: Curves.easeInOut);

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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _curve,
        child: widget.child,
        builder: (context, child) => Transform.scale(
          scale: 1 + (widget.maxScale - 1) * _curve.value,
          child: child,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  AuroraBackground — slow drifting colour glows (loops seamlessly)
// ─────────────────────────────────────────────────────────────
class AuroraBackground extends StatefulWidget {
  final List<Color> colors;
  final double intensity;
  final Duration period;

  const AuroraBackground({
    super.key,
    this.colors = const [
      Color(0xFF00C6FF),
      Color(0xFF0072FF),
      Color(0xFF36C5BC),
    ],
    this.intensity = 0.28,
    this.period = const Duration(seconds: 20),
  });

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: widget.period);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Motion.reduced(context)) {
      _c.stop();
      _c.value = 0.2;
    } else if (!_c.isAnimating) {
      _c.repeat();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _AuroraPainter(_c, widget.colors, widget.intensity),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _AuroraPainter extends CustomPainter {
  final Animation<double> t;
  final List<Color> colors;
  final double intensity;

  _AuroraPainter(this.t, this.colors, this.intensity) : super(repaint: t);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < colors.length; i++) {
      final phase = t.value * 2 * math.pi + i * 2.1;
      final center = Offset(
        size.width * (0.5 + 0.38 * math.sin(phase + i)),
        size.height * (0.5 + 0.30 * math.cos(phase)),
      );
      final radius = size.width * 0.32;
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            colors[i].withValues(alpha: intensity),
            colors[i].withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: center, radius: radius));
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _AuroraPainter old) =>
      old.colors != colors || old.intensity != intensity;
}

// ─────────────────────────────────────────────────────────────
//  ScrollProgressBar — thin page-progress line (add to your page Stack)
//    Positioned(top: 0, left: 0, right: 0,
//      child: ScrollProgressBar(controller: _scrollController))
// ─────────────────────────────────────────────────────────────
class ScrollProgressBar extends StatelessWidget {
  final ScrollController controller;
  final double height;

  const ScrollProgressBar({
    super.key,
    required this.controller,
    this.height = 3,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        height: height,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            double p = 0;
            if (controller.hasClients &&
                controller.positions.length == 1 &&
                controller.position.hasContentDimensions) {
              final max = controller.position.maxScrollExtent;
              if (max > 0) p = (controller.offset / max).clamp(0.0, 1.0);
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: p,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                    ),
                  ),
                  child: SizedBox.expand(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}