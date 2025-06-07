import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final result = await _homeRepo.getSpecializations();
    result.when(
        success: (specializationsResponseModel) =>
            emit(HomeState.specializationsSuccess(specializationsResponseModel)),
        failure: (errorHandler) {
          emit(HomeState.specializationsError(errorHandler));
        });
  }
}
