import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_design.dart';
import '../theme/app_text_styles.dart';
import 'motion.dart';

/// About Us — company story, what we build, and how we work.
///
/// Wiring (in your page's onNavSelected handler) add a case for 'About'
/// that scrolls to this section. Tap targets inside call [onNavSelected] with
/// the same keys the header uses: 'ORO GEM OS', 'Controllers', 'Smart Water',
/// 'Fertigation', 'Valves', 'Sensors', 'Selector'.
class AboutSection extends StatelessWidget {
  final Function(String)? onNavSelected;
  final VoidCallback? onBecomePartner;

  const AboutSection({
    super.key,
    this.onNavSelected,
    this.onBecomePartner,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppLayout.isDesktop(context);
    return Column(
      children: [
        AppSection(
          color: AppColors.bgWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntro(context, isDesktop),
              SizedBox(height: isDesktop ? 96 : 64),
              _buildCapabilities(context, isDesktop),
              SizedBox(height: isDesktop ? 96 : 64),
              _buildPrinciples(context, isDesktop),
            ],
          ),
        ),
        _buildPartnerBand(context, isDesktop),
      ],
    );
  }

  // ── Intro: story (left) + experience panel (right) ─────────
  Widget _buildIntro(BuildContext context, bool isDesktop) {
    final story = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'About ORO GEM Tech',
          eyebrowIcon: Icons.apartment_rounded,
          title: 'A decade of building automation that farmers can rely on',
          centered: false,
          maxTextWidth: 640,
        ),
        const SizedBox(height: 24),
        _body(
          'ORO GEM Tech, also known as Niagara Automation, designs and manufactures smart '
              'irrigation controllers, fertigation systems, control valves and field sensors in '
              'Coimbatore, Tamil Nadu.',
          lead: true,
          context: context,
        ),
        const SizedBox(height: 16),
        _body(
          'For more than ten years we have worked alongside growers, irrigation dealers and '
              'water-supply operators. That time in the field shaped how we build: controllers that '
              'protect pumps and motors, valves made for real-world water, and an app simple enough '
              'to use while standing in the field.',
          context: context,
        ),
        const SizedBox(height: 16),
        _body(
          'Today these products work together under ORO GEM OS. A farm can start with a single '
              'controller and grow into wireless valves, fertigation and sensor-driven scheduling on '
              'the same platform.',
          context: context,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppButton(
              'Explore solutions',
              trailingIcon: Icons.arrow_forward_rounded,
              onPressed: () => onNavSelected?.call('ORO GEM OS'),
            ),
            AppButton(
              'Find your system',
              style: AppButtonStyle.secondary,
              onPressed: () => onNavSelected?.call('Selector'),
            ),
          ],
        ),
      ],
    );

    final panel = _buildExperiencePanel(isDesktop);

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Reveal(child: story),
          const SizedBox(height: 40),
          Reveal(child: panel),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: Reveal(from: RevealFrom.left, child: story)),
        const SizedBox(width: 72),
        Expanded(
          flex: 5,
          child: Reveal(
            from: RevealFrom.right,
            delay: const Duration(milliseconds: 120),
            child: panel,
          ),
        ),
      ],
    );
  }

  Widget _body(String text, {bool lead = false, required BuildContext context}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 620),
      child: Text(
        text,
        style: lead
            ? AppTextStyles.heroSubheading(isDesktop: AppLayout.isDesktop(context))
            .copyWith(color: AppColors.textDark, fontWeight: FontWeight.w500, fontSize: 18)
            : AppTextStyles.sectionSubtitle(isDesktop: AppLayout.isDesktop(context))
            .copyWith(color: AppColors.textMedium),
      ),
    );
  }

  Widget _buildExperiencePanel(bool isDesktop) {
    Widget fact(IconData icon, String text) => Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconTile(icon, color: AppColors.primaryTeal, size: 40, onDark: true),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.cardDescription(color: AppColors.textLight)
                  .copyWith(fontSize: 14.5, height: 1.4),
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 28),
      decoration: BoxDecoration(
        color: AppColors.bgDarkSlate,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CountUp(
                end: 10,
                suffix: '+',
                duration: const Duration(milliseconds: 1400),
                style: AppTextStyles.statValue(color: Colors.white).copyWith(
                  fontSize: isDesktop ? 88 : 64,
                  height: 1,
                  letterSpacing: -2,
                ),
              ),
              const SizedBox(width: 14),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'years',
                  style: AppTextStyles.cardTitle(color: AppColors.primaryTeal).copyWith(fontSize: 22),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'of hands-on experience in agricultural and water automation',
            style: AppTextStyles.cardDescription(color: AppColors.textOnDarkMuted).copyWith(fontSize: 15),
          ),
          const SizedBox(height: 28),
          const Divider(height: 1, thickness: 1, color: AppColors.hairlineOnDark),
          fact(Icons.verified_rounded, 'ISO 9001:2015 certified manufacturing'),
          fact(Icons.location_on_rounded, 'Designed and made in Coimbatore, India'),
          fact(Icons.hub_rounded, 'Controllers, valves, fertigation and sensors on one platform'),
          fact(Icons.cell_tower_rounded, 'Wireless LoRa field automation up to 2 km'),
        ],
      ),
    );
  }

  // ── What we build ──────────────────────────────────────────
  Widget _buildCapabilities(BuildContext context, bool isDesktop) {
    const items = <_Capability>[
      _Capability(
        Icons.hub_rounded,
        'ORO GEM OS',
        'One platform that links controllers, valves, sensors and fertigation, with wireless range up to 2 km.',
        'ORO GEM OS',
      ),
      _Capability(
        Icons.memory_rounded,
        'Irrigation controllers',
        'ORO SHINE, ELITE and NOVA controllers sized from small greenhouses to large estates.',
        'Controllers',
      ),
      _Capability(
        Icons.water_drop_rounded,
        'Smart water control',
        'NIAGARA pump and water level controllers with dry-run and voltage protection.',
        'Smart Water',
      ),
      _Capability(
        Icons.science_rounded,
        'Fertigation',
        'NutriFlow™ 400 EC/pH-guided dosing for up to six fertilizer channels.',
        'Fertigation',
      ),
      _Capability(
        Icons.tune_rounded,
        'Control valves',
        'Hydraulic mainline, pressure control, pilot and solenoid valves, and filtration.',
        'Valves',
      ),
      _Capability(
        Icons.sensors_rounded,
        'Field sensors',
        'Soil moisture, pressure, level, pH and EC sensors that feed accurate field data.',
        'Sensors',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Reveal(
          child: SectionHeader(
            title: 'What we build',
            subtitle: 'Five product families and one operating system, designed to work together.',
            centered: false,
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 900 ? 3 : (c.maxWidth >= 560 ? 2 : 1);
            const gap = 20.0;
            final w = (c.maxWidth - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (var i = 0; i < items.length; i++)
                  SizedBox(
                    width: w,
                    child: Reveal(
                      delay: Motion.stagger(i % cols, stepMs: 80),
                      child: _capabilityCard(items[i]),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _capabilityCard(_Capability item) {
    return SurfaceCard(
      onTap: () => onNavSelected?.call(item.navKey),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTile(item.icon, size: 44),
          const SizedBox(height: 18),
          Text(item.title, style: AppTextStyles.cardTitle().copyWith(fontSize: 17)),
          const SizedBox(height: 8),
          Text(item.description, style: AppTextStyles.cardDescription()),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Learn more', style: AppTextStyles.badgeText(color: AppColors.primaryDeep)),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primaryDeep),
            ],
          ),
        ],
      ),
    );
  }

  // ── How we work ────────────────────────────────────────────
  // Not a sequence, so no numbering: a top rule marks each principle.
  Widget _buildPrinciples(BuildContext context, bool isDesktop) {
    const principles = <_Principle>[
      _Principle(
        'Built for field conditions',
        'IP67-rated enclosures, corrosion-resistant materials and protection logic designed around pumps, power and water as they are on a real farm.',
      ),
      _Principle(
        'Quality you can verify',
        'Manufactured under ISO 9001:2015 quality management, with CE-compliant products.',
      ),
      _Principle(
        'Simple to run',
        'Schedules, monitoring and alerts from the mobile app or the controller display, so teams spend their time farming rather than configuring.',
      ),
      _Principle(
        'Support that stays',
        'Technical help and a dealer network that keep installations running well after commissioning.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Reveal(
          child: SectionHeader(
            title: 'How we work',
            subtitle: 'The principles behind every controller, valve and sensor we ship.',
            centered: false,
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, c) {
            final cols = c.maxWidth >= 1000 ? 4 : (c.maxWidth >= 600 ? 2 : 1);
            const gap = 32.0;
            final w = (c.maxWidth - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: 36,
              children: [
                for (var i = 0; i < principles.length; i++)
                  SizedBox(
                    width: w,
                    child: Reveal(
                      delay: Motion.stagger(i % cols, stepMs: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 3,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primaryTeal,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(principles[i].title, style: AppTextStyles.cardTitle().copyWith(fontSize: 17)),
                          const SizedBox(height: 10),
                          Text(
                            principles[i].text,
                            style: AppTextStyles.cardDescription(color: AppColors.textMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  // ── Closing band: partner call to action ───────────────────
  Widget _buildPartnerBand(BuildContext context, bool isDesktop) {
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grow with a partner that has been in the field for over ten years',
          style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: Colors.white).copyWith(
            fontSize: isDesktop ? 32 : 24,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            'Whether you farm, install irrigation systems or distribute agricultural technology, '
                'our team can help you choose the right system and support it long after the sale.',
            style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop, color: AppColors.textOnDarkMuted),
          ),
        ),
      ],
    );

    final actions = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        AppButton(
          'Become a dealer / partner',
          trailingIcon: Icons.handshake_rounded,
          onPressed: onBecomePartner,
        ),
        AppButton(
          'Find your system',
          style: AppButtonStyle.secondary,
          onDark: true,
          onPressed: () => onNavSelected?.call('Selector'),
        ),
      ],
    );

    return AppSection(
      color: AppColors.surfaceDark,
      child: Reveal(
        child: isDesktop
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 6, child: text),
            const SizedBox(width: 48),
            Expanded(
              flex: 4,
              child: Align(alignment: Alignment.centerRight, child: actions),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [text, const SizedBox(height: 28), actions],
        ),
      ),
    );
  }
}

class _Capability {
  final IconData icon;
  final String title;
  final String description;
  final String navKey;
  const _Capability(this.icon, this.title, this.description, this.navKey);
}

class _Principle {
  final String title;
  final String text;
  const _Principle(this.title, this.text);
}