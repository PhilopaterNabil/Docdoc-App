import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/onboarding/screen/widget/doc_logo_and_name.dart';
import 'package:flutter_advanced/features/onboarding/screen/widget/doctor_image_and_text.dart';
import 'package:flutter_advanced/features/onboarding/screen/widget/get_started_button.dart';
import 'package:flutter_advanced/features/onboarding/screen/widget/onboarding_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                const OnboardingDescription(),
                SizedBox(height: 30.h),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
