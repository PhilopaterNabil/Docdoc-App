import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            'See all',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
