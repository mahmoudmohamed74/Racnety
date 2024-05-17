import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _newPasswordEditingController =
      TextEditingController();

  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'Forgot Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSize.s50,
                ),
                Text(
                  AppStrings.createNewPass,
                  style: TextStyle(
                    fontSize: AppSize.s15,
                    color: ColorManager.grey,
                  ),
                ),
                FormFieldWidget(
                  hintText: AppStrings.emailHint,
                  controller: _emailEditingController,
                  type: TextInputType.emailAddress,
                  validator: (input) =>
                      input!.isValidEmail() ? null : AppStrings.emailError,
                  prefix: IconBroken.Profile,
                  obscureText: false,
                ),
                FormFieldWidget(
                  // obscureText: cubit.isPassword,
                  hintText: AppStrings.newPass,
                  controller: _newPasswordEditingController,
                  type: TextInputType.text,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  prefix: IconBroken.Lock,
                  prefixPressed: () {},
                  // suffix: cubit.suffix,
                  // suffixPressed: () {
                  //   setState(() {
                  //     cubit.changePasswordVisibility();
                  //   });
                  // },
                ),
                FormFieldWidget(
                  // obscureText: cubit.isPassword,
                  hintText: AppStrings.confirmNewPass,
                  controller: _confirmPasswordEditingController,
                  type: TextInputType.text,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  prefix: IconBroken.Lock,
                  prefixPressed: () {},
                  // suffix: cubit.suffix,
                  // suffixPressed: () {
                  //   setState(() {
                  //     cubit.changePasswordVisibility();
                  //   });
                  // },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => TextButtonWidget(
                    icon: Container(
                      width: AppSize.s0,
                    ),
                    borderColor: ColorManager.primary,
                    backGroundColor: ColorManager.primary,
                    textColor: ColorManager.white,
                    width: AppSize.s200,
                    height: AppSize.s52,
                    text: AppStrings.save,
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // await cubit.userLogin(
                        //   UserLoginUseCaseInput(
                        //     _emailEditingController.text,
                        //     _passwordEditingController.text,
                        //   ),
                        // );
                      }
                      // cubit.clear();
                    },
                  ),
                  fallback: (context) => const LoadingWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
