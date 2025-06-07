import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';

abstract class HomeRepo {
  Future<ApiResult<SpecializationsResponseModel>> getSpecializations();
}