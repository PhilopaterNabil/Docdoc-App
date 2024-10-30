import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_advanced/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_advanced/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpSuccess() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: 0, 
      ),
    );
    response.when(
      success: (signUpResponse) => emit(SignUpState.success(signUpResponse)),
      failure: (error) =>
          emit(SignUpState.error(error: error.apiErrorModel.message ?? '')),
    );
  }
}
