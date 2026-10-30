import 'package:flutter/material.dart';
import 'header_nav.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onDownloadApp;
  final Function(String)? onNavSelected;

  const HeroSection({
    super.key,
    this.onDownloadApp,
    this.onNavSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isDesktop ? 680 : 550,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hero_background.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withAlpha(40),
              Colors.transparent,
              Colors.black.withAlpha(100),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Floating Frosted Glass Header Navigation Bar
            HeaderNav(
              isTransparent: true,
              onGetAppPressed: onDownloadApp,
              onNavSelected: onNavSelected,
            ),
          ],
        ),
      ),
    );
  }
}