import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ScaleSolutionsSection extends StatelessWidget {
  const ScaleSolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 60,
      ),
      child: Column(
        children: [
          // Section Main Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryTeal.withAlpha(20),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Featured Products',
              style: AppTextStyles.badgeText(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Smart Features That Power Your Farm (Scale Solutions)',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
          ),
          const SizedBox(height: 50),

          // 1. Small Scale Farms
          _FarmScaleBlock(
            categoryTitle: 'Small Scale Farms',
            subtitle: 'Plug-and-Play Wired & Wireless Automation',
            description:
                'Ideal for small farms and gardens. Automate preset schedules, reduce manual labor, and improve crop health with minimal infrastructure complexity.',
            bgColor: Colors.white,
            textColor: AppColors.textDark,
            isDesktop: isDesktop,
            products: const [
              _ProductCardData(title: 'Oro Elite', imagePath: 'assets/images/img_p1_10.png'),
              _ProductCardData(title: 'Oro Nova', imagePath: 'assets/images/img_p1_13.png'),
              _ProductCardData(title: 'Oro Shine', imagePath: 'assets/images/img_p1_16.png'),
            ],
          ),
          const SizedBox(height: 60),

          // 2. Medium Scale Farms
          _FarmScaleBlock(
            categoryTitle: 'Medium Scale Farms',
            subtitle: 'Flexible Master Controllers for Growing Fields',
            description:
                'High-performance automation that doesn\'t compromise on flexibility. Manages local pumps and remote field devices using RS485 and LoRa RF.',
            bgColor: const Color(0xFF006670),
            textColor: Colors.white,
            isDesktop: isDesktop,
            products: const [
              _ProductCardData(title: 'Oro GEM (R)', imagePath: 'assets/images/img_p1_2.png'),
              _ProductCardData(title: 'Oro GEM (RL)', imagePath: 'assets/images/img_p1_10.png'),
              _ProductCardData(title: 'Oro Nova', imagePath: 'assets/images/img_p1_13.png'),
            ],
          ),
          const SizedBox(height: 60),

          // 3. Large Scale Farms
          _FarmScaleBlock(
            categoryTitle: 'Large Scale Farms',
            subtitle: 'Enterprise-Grade Multi-Zone Master Controllers',
            description:
                'Advanced central master controller supporting dual LoRa RF, GSM/GPRS, and cloud connectivity to control vast agricultural setups seamlessly.',
            bgColor: const Color(0xFF232832),
            textColor: Colors.white,
            isDesktop: isDesktop,
            products: const [
              _ProductCardData(title: 'oro GEM+ (RL)', imagePath: 'assets/images/img_p1_20.png'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FarmScaleBlock extends StatelessWidget {
  final String categoryTitle;
  final String subtitle;
  final String description;
  final Color bgColor;
  final Color textColor;
  final bool isDesktop;
  final List<_ProductCardData> products;

  const _FarmScaleBlock({
    required this.categoryTitle,
    required this.subtitle,
    required this.description,
    required this.bgColor,
    required this.textColor,
    required this.isDesktop,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: textColor == Colors.white
              ? Colors.white.withAlpha(30)
              : AppColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      child: Column(
        children: [
          // Category Badge Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryTeal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              categoryTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop, color: textColor),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.cardDescription(
                color: textColor.withAlpha(200),
              ),
            ),
          ),
          const SizedBox(height: 36),

          // Product Cards Grid
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: products
                .map((p) => _ProductCardItem(
                      data: p,
                      textColor: textColor,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProductCardData {
  final String title;
  final String imagePath;

  const _ProductCardData({required this.title, required this.imagePath});
}

class _ProductCardItem extends StatelessWidget {
  final _ProductCardData data;
  final Color textColor;

  const _ProductCardItem({required this.data, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: textColor == Colors.white ? const Color(0xFF1E2830) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: textColor == Colors.white
              ? Colors.white.withAlpha(25)
              : AppColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(15),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.memory_rounded, size: 60, color: AppColors.primaryTeal),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.cardTitle(
              color: textColor == Colors.white ? Colors.white : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
