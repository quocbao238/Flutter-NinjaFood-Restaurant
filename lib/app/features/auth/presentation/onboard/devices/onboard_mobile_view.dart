import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/features/auth/controllers/onboard_controller.dart';

class OnboardMobileScreen extends GetView<OnboardController> {
  const OnboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardListData = controller.onboardListData;

    final _pageController = controller.pageController;
    return Center(
      child: Text('Demo ${controller.lastCounter}'),
    );

    PageView.builder(
      itemCount: _onboardListData.length,
      controller: _pageController,
      itemBuilder: (context, index) {
        final item = _onboardListData[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(item.image),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: item.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
                children: [
                  TextSpan(
                    text: item.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 57,
              width: 157,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff53E88B),
                    Color(0xff15BE77),
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
