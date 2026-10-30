import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ProductsShowcaseSection extends StatelessWidget {
  const ProductsShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    final productsList = [
      const _ProductShowcaseData(
        title: 'Wireless Valve Automation',
        imagePath: 'assets/images/img_p1_9.png',
        tag: 'Valve Control',
      ),
      const _ProductShowcaseData(
        title: 'Niagara 4inch Valve Automation',
        imagePath: 'assets/images/img_p1_14.png',
        tag: 'Niagara Series',
      ),
      const _ProductShowcaseData(
        title: 'Niagara 2inch Valve',
        imagePath: 'assets/images/img_p1_17.png',
        tag: 'Niagara Series',
      ),
      const _ProductShowcaseData(
        title: 'Double Filter Backwash Automation',
        imagePath: 'assets/images/img_p1_18.png',
        tag: 'Filtration',
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
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
              'Products',
              style: AppTextStyles.badgeText(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'High Performance Field Automation Devices',
            textAlign: TextAlign.center,
            style: AppTextStyles.sectionTitle(isDesktop: isDesktop),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 28,
            runSpacing: 28,
            alignment: WrapAlignment.center,
            children: productsList
                .map((p) => _ProductShowcaseCard(data: p))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProductShowcaseData {
  final String title;
  final String imagePath;
  final String tag;

  const _ProductShowcaseData({
    required this.title,
    required this.imagePath,
    required this.tag,
  });
}

class _ProductShowcaseCard extends StatefulWidget {
  final _ProductShowcaseData data;

  const _ProductShowcaseCard({required this.data});

  @override
  State<_ProductShowcaseCard> createState() => _ProductShowcaseCardState();
}

class _ProductShowcaseCardState extends State<_ProductShowcaseCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (hover) => setState(() => isHovered = hover),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? AppColors.primaryTeal : AppColors.borderLight,
            width: isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? AppColors.primaryTeal.withAlpha(30)
                  : Colors.black.withAlpha(10),
              blurRadius: isHovered ? 20 : 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.data.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.settings_input_component_rounded,
                    size: 60,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tag Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryTeal.withAlpha(20),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.data.tag,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTeal,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product Title
            Text(
              widget.data.title,
              style: AppTextStyles.cardTitle(),
            ),
          ],
        ),
      ),
    );
  }
}
