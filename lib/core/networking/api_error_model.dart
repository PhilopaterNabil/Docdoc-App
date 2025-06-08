import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a string containing all error messages.
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? 'Unknown error occurred';

    final errorMessages = errors!.entries.map((entry) {
      final value = entry.value;
      return '${entry.key}: ${value is List ? value.join(', ') : value}';
    }).join('\n');

    return errorMessages;
    // return errors!.values.map((e) => e.toString()).join(', ');
  }
}
