import 'package:flutter/material.dart';
import 'package:pos_app/controllers/menu_app_controller.dart';
import 'package:pos_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/color.dart';
import '../components/our_data.dart';
import '../provider/splash_provider.dart';
import '../route/routes_name.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuAppController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF4F4F4),
        actions: [
          TextButton(
            onPressed: () {
              provider.changeScreen(Routes.BOTTOM_SHEET_ROUTE);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'Skip',
                style: TextStyle(
                  color: bgColor,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              onPageChanged: (value) {
                Provider.of<SplashProvider>(context, listen: false)
                    .updateIndex(value);
              },
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: const [
                OurData(
                  title: "Welcome to POS System",
                  image: "assets/images/intro1.png",
                  content:
                      "Experience a revolution in transaction management with POS System.",
                ),
                OurData(
                  title: "Manage Your Items",
                  image: "assets/images/intro2.png",
                  content: "Organize your products with ease using POS System.",
                ),
                OurData(
                  title: "Generate PDF Reports",
                  image: "assets/images/intro3.png",
                  content:
                      "Download and share these reports to enhance your business operations.",
                ),
              ],
            ),
          ),
          Consumer<SplashProvider>(
            builder: (context, value, child) {
              return value.currentIndex == 2
                  ? Positioned(
                      bottom: 80.0,
                      left: 15.0,
                      right: 15.0,
                      child: InkWell(
                        onTap: () {
                          provider.changeScreen(Routes.BOTTOM_SHEET_ROUTE);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: bgColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Let's Start",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
      bottomSheet: Consumer<SplashProvider>(
        builder: (context, value, child) {
          return value.currentIndex == 2
              ? const SizedBox() // Return an empty Container instead of null
              : Container(
                  height: 80,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF4F4F4),
                  ),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        spacing: 8.0,
                        radius: 8.0,
                        dotHeight: 12,
                        dotWidth: 12,
                        dotColor: Colors.grey.shade700,
                        activeDotColor: bgColor,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
