import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/screen/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationsDataList});

  final List<SpecializationsData?>? specializationsDataList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecialityIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setupSpecialityClick(index, context),
            child: SpecialityListViewItem(
              specializationsData: widget.specializationsDataList?[index],
              itemIndex: index,
              selectedIndex: selectedSpecialityIndex,
            ),
          );
        },
      ),
    );
  }

  void setupSpecialityClick(int index, BuildContext context) {
    setState(() {
      selectedSpecialityIndex = index;
    });
    context
        .read<HomeCubit>()
        .getDoctorsList(specializationId: widget.specializationsDataList?[index]?.id);
  }
}
