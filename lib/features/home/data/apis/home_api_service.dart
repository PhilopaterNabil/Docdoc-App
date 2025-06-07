import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constants.dart';
import 'package:flutter_advanced/features/home/data/apis/home_api_constants.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specialization)
  Future<SpecializationsResponseModel> getSpecializations();
}
