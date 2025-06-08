import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.specializationsData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: ColorsManager.lightBlue,
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundColor: ColorsManager.white,
                      child: SvgPicture.asset(
                        'assets/svg/general_speciality.svg',
                        height: 42.h,
                        width: 42.w,
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svg/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'Specialization',
            textAlign: TextAlign.center,
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12BlueRegular.copyWith(color: ColorsManager.darkBlue),
          ),
        ],
      ),
    );
  }
}
