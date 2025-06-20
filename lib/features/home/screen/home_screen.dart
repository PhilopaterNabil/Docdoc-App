import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_blue_container.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_list/doctors_bloc_builder.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_speciality_see_all.dart';
import 'package:flutter_advanced/features/home/screen/widgets/home_app_bar.dart';
import 'package:flutter_advanced/features/home/screen/widgets/specializations_list/specializations_bloc_builder.dart';
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
              const HomeAppBar(),
              const DoctorBlueContainer(),
              verticalSpace(24),
              const DoctorSpecialitySeeAll(),
              verticalSpace(16),
              const SpecializationsBlocBuilder(),
              verticalSpace(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
