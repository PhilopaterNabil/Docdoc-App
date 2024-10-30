import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/screen/widget/dont_have_account_text.dart';
import 'package:flutter_advanced/features/login/screen/widget/login_bloc_listener.dart';
import 'package:flutter_advanced/features/login/screen/widget/login_form.dart';
import 'package:flutter_advanced/features/login/screen/widget/login_text_title_and_description.dart';
import 'package:flutter_advanced/features/login/screen/widget/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginTextTitleAndDescription(),
                verticalSpace(36),
                const LoginForm(),
                verticalSpace(40),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () => vaildateThenDoLogin(context),
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(16),
                const DontHaveAnAccount(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void vaildateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginSuccess();
    }
  }
}
