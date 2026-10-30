import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback? onDownloadApp;

  const FooterSection({super.key, this.onDownloadApp});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 60,
      ),
      child: Column(
        children: [
          // Main Footer Grid
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment:
                isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column 1: Brand Info
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isDesktop ? 360 : 300),
                child: Column(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.primaryTeal,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.eco_rounded,
                              color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'ORO GEM',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Automate and regulate your pumps, valves, and fertigation systems remotely from anywhere with ORO GEM OS.',
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              if (!isDesktop) const SizedBox(height: 30),

              // Column 2: Quick Links
              Column(
                crossAxisAlignment: isDesktop
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Quick Links',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  _FooterLink(text: 'Home'),
                  SizedBox(height: 8),
                  _FooterLink(text: 'Features'),
                  SizedBox(height: 8),
                  _FooterLink(text: 'Products'),
                  SizedBox(height: 8),
                  _FooterLink(text: 'How it Works'),
                  SizedBox(height: 8),
                  _FooterLink(text: 'AI System'),
                ],
              ),

              if (!isDesktop) const SizedBox(height: 30),

              // Column 3: App Download
              Column(
                crossAxisAlignment: isDesktop
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Get Started Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Control your farm anytime, anywhere.',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: onDownloadApp,
                    icon: const Icon(Icons.download_rounded, color: Colors.white),
                    label: const Text(
                      'Download App',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryTeal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 50),
          const Divider(color: Colors.white24),
          const SizedBox(height: 24),

          // Copyright
          const Text(
            '© 2026 ORO GEM Tech. All Rights Reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white70,
        ),
      ),
    );
  }
}
