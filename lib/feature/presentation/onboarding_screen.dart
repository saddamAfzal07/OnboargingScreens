import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:onboarding/feature/presentation/widget/vartical_space.dart';
import 'package:onboarding/home.dart';
import 'package:onboarding/model/onboarding_model.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _pagecontroller;
  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  int dotCount = 4;
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 88.h, bottom: 48.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _pagecontroller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 280.w,
                            height: 272.h,
                            child: SvgPicture.asset(
                              contents[i].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          VerticalSpace(space: 32.h),
                          DotStepper(
                            dotCount: dotCount,
                            activeStep: activeStep,
                            shape: Shape.stadium,
                            dotRadius: 8,
                            onDotTapped: (dotIndex) {
                              setState(() {
                                activeStep = dotIndex;
                              });
                            },
                            fixedDotDecoration: const FixedDotDecoration(
                              color: Color.fromRGBO(218, 218, 218, 1),
                            ),
                            indicatorDecoration: const IndicatorDecoration(
                              color: Colors.black87,
                            ),
                            spacing: 6,
                            indicator: Indicator.worm,
                          ),
                          VerticalSpace(space: 32.h),
                          Text(
                            contents[i].title,
                            style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          VerticalSpace(space: 32.h),
                          Text(contents[i].description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF6F6F6F),
                                ),
                              )),
                        ],
                      );
                    }),
              ),
              currentIndex == contents.length - 1
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          height: 48.h,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Let’s Get Started",
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                        fontSize: 14.h,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: SvgPicture.asset(
                                    "assets/images/arrow.svg",
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                              ])))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0XFFE5E5E5),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 48.h,
                            width: 81.h,
                            child: Text(
                              "Skip",
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0XFF1C1C1C),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex == contents.length - 1) {
                            } else if (activeStep < dotCount - 1) {
                              setState(() {
                                activeStep++;
                              });
                              _pagecontroller.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0XFF1C1C1C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 48.h,
                            width: 81.h,
                            child: Text("Next",
                                style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: const Color(0XFFFFFFFF),
                                  ),
                                )),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ));
  }
}
