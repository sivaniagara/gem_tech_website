import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    final reviews = [
      const _TestimonialData(
        quote:
            'Using Gem Tech, I can manage all major farm activities such as drone operations, soil monitoring, irrigation automation, and livestock tracking. The system keeps everything connected and easy to control from anywhere.',
        author: 'Kevin M.',
        role: 'Field Operations Lead',
        rating: 4.0,
      ),
      const _TestimonialData(
        quote:
            'Using Gem Tech, I can manage all major farm activities such as drone operations, soil monitoring, irrigation automation, and livestock tracking. The system keeps everything connected and easy to control from anywhere.',
        author: 'Kevin M.',
        role: 'Field Operations Lead',
        rating: 4.0,
      ),
      const _TestimonialData(
        quote:
            'Using Gem Tech, I can manage all major farm activities such as drone operations, soil monitoring, irrigation automation, and livestock tracking. The system keeps everything connected and easy to control from anywhere.',
        author: 'Kevin M.',
        role: 'Field Operations Lead',
        rating: 4.0,
      ),
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 70,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryTeal.withAlpha(20),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Real Results From Real Farms',
              style: AppTextStyles.badgeText(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'What Farmers Say About Gem Tech Automatons',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              'Gem Tech helps farmers simplify daily operations through automation, real-time monitoring, and intelligent insights.',
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionSubtitle(isDesktop: isDesktop),
            ),
          ),
          const SizedBox(height: 50),

          // Reviews Wrap
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: reviews
                .map((r) => _TestimonialCard(data: r))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TestimonialData {
  final String quote;
  final String author;
  final String role;
  final double rating;

  const _TestimonialData({
    required this.quote,
    required this.author,
    required this.role,
    required this.rating,
  });
}

class _TestimonialCard extends StatelessWidget {
  final _TestimonialData data;

  const _TestimonialCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quote Mark
          const Icon(
            Icons.format_quote_rounded,
            color: AppColors.primaryTeal,
            size: 36,
          ),
          const SizedBox(height: 12),

          // Review Text
          Text(
            data.quote,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textMedium,
            ),
          ),
          const SizedBox(height: 24),

          // Author Row
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primaryTeal.withAlpha(30),
                child: const Text(
                  'KM',
                  style: TextStyle(
                    color: AppColors.primaryTeal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.author,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data.role,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.starGold,
                          size: 16,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          data.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
