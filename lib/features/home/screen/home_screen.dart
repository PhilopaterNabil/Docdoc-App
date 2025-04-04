import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_blue_container.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_speciality_list_view.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_speciality_see_all.dart';
import 'package:flutter_advanced/features/home/screen/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              HomeAppBar(),
              DoctorBlueContainer(),
              verticalSpace(24),
              DoctorSpecialitySeeAll(),
              verticalSpace(16),
              DoctorSpecialityListView(),
              verticalSpace(8),
              DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => DoctorCard(),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              'https://images.unsplash.com/photo-1537368910025-700350fe46c7',
              width: 110.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. John Doe',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  'General | RSUD Gatot Subroto',
                  style: TextStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(12),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font11DarkGrayRegular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
