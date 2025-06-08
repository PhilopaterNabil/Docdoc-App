import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_list/doctors_shimeer_loading.dart';
import 'package:flutter_advanced/features/home/screen/widgets/specializations_list/speciality_list_view.dart';
import 'package:flutter_advanced/features/home/screen/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: setupLoading,
          specializationsSuccess: setupSuccess,
          specializationsError: setupError,
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupError(errorHandler) => Center(
        child: Text(errorHandler.apiErrorModel.message ?? 'Error Occurred'),
      );
  Widget setupSuccess(List<SpecializationsData?>? specializationDataList) {
    var specializationsList = specializationDataList;

    return SpecialityListView(specializationsDataList: specializationsList);
  }
}
