import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ELking Felo!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font11DarkGrayRegular,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: ColorsManager.moreLighterGray,
          child: Icon(
            Icons.notifications_none,
            size: 24.sp,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}