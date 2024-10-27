import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By creating an account, you agree to our ',
        style: TextStyles.font14GrayRegular,
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyles.font14DarkBlueMedium,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
