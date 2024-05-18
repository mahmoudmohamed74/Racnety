import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/requests/forget_password_request.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.statusCode == 200 || state.statusCode == 201) {
                customSnackBar(
                  context: context,
                  message: "Your request has been sent successfully...",
                  isError: false,
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginView,
                );
              }

              if (state.error == '3') {
                SnackBarWidget(
                  text: Text(
                    "Something went wrong please try again later . . .",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s16,
                    ),
                  ),
                  backGroundColor: ColorManager.error,
                );
              }
            },
            builder: (context, state) {
              return Form(
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
                      headText: AppStrings.passwordHeadText,
                      obscureText: !state.isPasswordVisible,
                      hintText: AppStrings.passwordHint,
                      controller: _newPasswordEditingController,
                      type: TextInputType.text,
                      validator: (input) => input!.isValidPassword()
                          ? null
                          : AppStrings.passwordError,
                      prefix: IconBroken.Lock,
                      suffix: context.read<AuthCubit>().passwordIcon,
                      suffixPressed: () {
                        context.read<AuthCubit>().changePasswordVisibility();
                      },
                    ),
                    FormFieldWidget(
                      obscureText: !state.isPasswordVisible,
                      headText: AppStrings.confirmPasswordHeadText,
                      hintText: AppStrings.confirmPasswordHint,
                      controller: _confirmPasswordEditingController,
                      type: TextInputType.number,
                      validator: (String? s) {
                        if (_newPasswordEditingController.text !=
                            _confirmPasswordEditingController.text) {
                          return AppStrings.passwordConfirmationError;
                        }
                        return null;
                      },
                      prefix: IconBroken.Lock,
                      suffix: context.read<AuthCubit>().passwordIcon,
                      suffixPressed: () {
                        context.read<AuthCubit>().changePasswordVisibility();
                      },
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
                            context
                                .read<AuthCubit>()
                                .forgetPassword(
                                  ForgotPasswordRequest(
                                    email: _emailEditingController.text,
                                    newPassword:
                                        _confirmPasswordEditingController.text,
                                  ),
                                )
                                .whenComplete(() {
                              _emailEditingController.clear();
                              _newPasswordEditingController.clear();
                              _confirmPasswordEditingController.clear();
                            });
                          }
                        },
                      ),
                      fallback: (context) => const LoadingWidget(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
