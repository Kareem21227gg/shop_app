import 'package:Shop/app/setup.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:Shop/app/view/onboarding/controller.dart';
import 'package:page_view_indicator/page_view_indicator.dart';


class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  OnboardingController onboardingController = OnboardingController();

  ValueNotifier<int> valueNotifier = ValueNotifier<int>(null);

  @override
    void dispose() {
      valueNotifier.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              clipBehavior: Clip.antiAlias,
              itemCount: onboardingController.modelList.length,
              onPageChanged: (index) {
                valueNotifier.value = index;
              },
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(onboardingController
                                  .modelList[index].imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              onboardingController.modelList[index].title,
                              style: TextStyle(
                                  color: MyColors.primaryColor, fontSize: 26),
                            ),
                          )),
                      Flexible(
                        flex: 1,
                        child: Text(
                          onboardingController.modelList[index].subTitle,
                          style: TextStyle(
                            color: MyColors.hashText,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
                heightFactor: 27,
                alignment: Alignment.bottomCenter,
                child: indecator()),
            Align(
              heightFactor: 14,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text(
                        "Get Started!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                onPressed: () {
                 
                  onboardingController.getState();
                  
                Navigator.push(context , MaterialPageRoute(builder: (context)=>SetUp()));
                },
              ),
            ),
          ],
        ),
      
    );
  }

  Widget indecator() {
    return PageViewIndicator(
      pageIndexNotifier: valueNotifier,
      length: onboardingController.modelList.length,
      normalBuilder: (animationController, index) => Circle(
        size: 6.0,
        color: MyColors.hashText,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 6.0,
          color: MyColors.primaryColor,
        ),
      ),
    );
  }
}
