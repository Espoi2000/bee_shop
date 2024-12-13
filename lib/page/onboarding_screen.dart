import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> onboarding_data = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/image1.jpg"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/image2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/image3.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: size.height * 0.4,
              child: PageView.builder(
                  itemCount: onboarding_data.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.4,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      onboarding_data[index]["image"]!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              height: size.height * 0.4,
                              width: size.width - 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Spacer(
                                    flex: 5,
                                  ),
                                  Text(
                                    onboarding_data[index]["text"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: onboarding_data.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
              ),
            ),
            const Spacer(flex: 1),

            // text description

            const Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ",
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                context.router.replace(const LoginRoute());
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child: const Text("Connexion"),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign In Screen or any other screen
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                side: BorderSide(color: Theme.of(context).primaryColor),
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child: Text(
                "Inscription",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
