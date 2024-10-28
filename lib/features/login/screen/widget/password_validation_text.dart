import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidationText extends StatelessWidget {
  const PasswordValidationText({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          buildValidationRow('At least 1 lowercase letter', hasLowercase),
          verticalSpace(2),
          buildValidationRow('At least 1 uppercase letter', hasUppercase),
          verticalSpace(2),
          buildValidationRow('At least 1 special character', hasSpecialChar),
          verticalSpace(2),
          buildValidationRow('At least 1 number', hasNumber),
          verticalSpace(2),
          buildValidationRow('At least 8 characters long', hasMinLength),
        ],
      ),
    );
  }

  buildValidationRow(String text, bool isValid) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: isValid ? Colors.blue : Colors.grey,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font14DarkBlueRegular.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 3,
            color: isValid ? ColorsManager.gray : ColorsManager.darkBlue,
            // color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
