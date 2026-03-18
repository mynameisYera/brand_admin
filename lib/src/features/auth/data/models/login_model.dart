import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_models/base_entity.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel extends BaseEntity with _$LoginModel {
  const factory LoginModel({
    required String refresh,
    required String access
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
