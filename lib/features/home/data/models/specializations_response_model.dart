import 'package:json_annotation/json_annotation.dart';

part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationsResponseModel {
  @JsonKey(name: 'data')
  final List<SpecializationsData?>? specializationDataList;
  final bool? status;
  @JsonKey(name: 'code')
  final int? statusCode;

  SpecializationsResponseModel({
    this.specializationDataList,
    this.status,
    this.statusCode,
  });

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationsData {
  final int? id;
  final String? name;
  @JsonKey(name: 'doctors')
  final List<Doctors?>? doctorsList;

  SpecializationsData({
    this.id,
    this.name,
    this.doctorsList,
  });

  factory SpecializationsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsDataFromJson(json);
}

@JsonSerializable()
class Doctors {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  @JsonKey(name: 'appoint_price')
  final int? price;
  final String degree;

  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.price,
    required this.degree,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
}