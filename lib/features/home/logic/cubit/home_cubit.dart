import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_error_model.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;

  List<SpecializationsData?>? specializationDataList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final result = await _homeRepo.getSpecializations();
    result.when(success: (specializationsResponseModel) {
      specializationDataList = specializationsResponseModel.specializationDataList;
      // Default to first specialization
      getDoctorsList(specializationId: specializationDataList?.first?.id);
      emit(HomeState.specializationsSuccess(specializationDataList));
    }, failure: (apiErrorModel) {
      emit(HomeState.specializationsError(apiErrorModel));
    });
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctors?>? doctorsList =
        filterDoctorsListBySpecializationId(specializationId: specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError());
    }
  }

  /// Filters doctors by specialization ID from the specialization data list.
  filterDoctorsListBySpecializationId({specializationId}) {
    return specializationDataList!
        .firstWhere((specialization) => specialization!.id == specializationId)
        ?.doctorsList;
  }
}
