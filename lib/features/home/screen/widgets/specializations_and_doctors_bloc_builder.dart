import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctor_speciality_list_view.dart';
import 'package:flutter_advanced/features/home/screen/widgets/doctors_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

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

  Widget setupLoading() => const Center(child: CircularProgressIndicator());
  Widget setupError(errorHandler) => Center(
        child: Text(errorHandler.apiErrorModel.message ?? 'Error Occurred'),
      );
  Widget setupSuccess(SpecializationsResponseModel specializationsResponseModel) {
    var specializationsList = specializationsResponseModel.specializationDataList;

    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(specializationsDataList: specializationsList),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }
}
