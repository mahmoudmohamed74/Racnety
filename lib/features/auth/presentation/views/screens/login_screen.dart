import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_constants.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:parking_app/features/auth/presentation/views/screens/register_screen.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/horizontal_or_line_widget.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({Key? key}) : super(key: key);

  final AppPreferences _appPreferences = sl<AppPreferences>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) async {
              if (state.userModel?.tokenType != null) {
                await _appPreferences.setIsUserLoggedIn();
                await _appPreferences
                    .saveUserId(state.userModel!.userId!.toString());

                Navigator.pushReplacementNamed(
                  context,
                  Routes.homeView,
                );
              }
              if (state.error == '1') {
                SnackBarWidget(
                  text: Text(
                    "user login error",
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
                    const Image(
                      fit: BoxFit.fitHeight,
                      height: AppSize.s150,
                      image: AssetImage(
                        ImageAssets.appLogo,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      AppStrings.welcomeBack,
                      style: TextStyle(
                        fontSize: AppSize.s25,
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      AppStrings.loginAnnotation,
                      style: TextStyle(
                        fontSize: AppSize.s15,
                        color: ColorManager.grey,
                      ),
                    ),
                    FormFieldWidget(
                      hintText: AppStrings.userNameHint,
                      controller: _emailEditingController,
                      type: TextInputType.text,
                      validator: (String? s) {
                        if (s!.length < Constants.three) {
                          return AppStrings.userNameError;
                        }
                        return null;
                      },
                      prefix: IconBroken.Profile,
                      obscureText: false,
                    ),
                    FormFieldWidget(
                      obscureText: !state.isPasswordVisible,
                      hintText: AppStrings.passwordHint,
                      controller: _passwordEditingController,
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: AppPadding.p20,
                        ),
                        child: TextButton(
                          child: Text(
                            AppStrings.forgetPassword,
                            style: TextStyle(
                              fontSize: AppSize.s18,
                              color: ColorManager.darkPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pushReplacementNamed(
                            //   context,
                            //   Routes.forgotPasswordRoute,
                            // );
                          },
                        ),
                      ),
                    ),
                    ConditionalBuilder(
                      condition: !state.isLoading,
                      builder: (context) => TextButtonWidget(
                        icon: Container(
                          width: AppSize.s0,
                        ),
                        borderColor: ColorManager.primary,
                        backGroundColor: ColorManager.primary,
                        textColor: ColorManager.white,
                        width: AppSize.s330,
                        height: AppSize.s52,
                        text: AppStrings.logIn,
                        fontWeight: FontWeight.bold,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthCubit>()
                                .login(
                                  LoginRequest(
                                    userName: _emailEditingController.text,
                                    password: _passwordEditingController.text,
                                  ),
                                )
                                .whenComplete(() {
                              _emailEditingController.clear();
                              _passwordEditingController.clear();
                            });
                          }
                        },
                      ),
                      fallback: (context) => const LoadingWidget(),
                    ),
                    const HorizontalOrLineWidget(
                      label: AppStrings.or,
                      height: AppSize.s60,
                    ),
                    TextButtonWidget(
                      borderColor: ColorManager.grey,
                      backGroundColor: ColorManager.white,
                      textColor: ColorManager.black,
                      width: AppSize.s330,
                      height: AppSize.s52,
                      text: AppStrings.signUpWithGoogle,
                      icon: const SizedBox(
                        height: AppSize.s33,
                        child: Image(
                          image: AssetImage(
                            ImageAssets.googleLogoIcon,
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(AppStrings.doNotHaveAccount),
                        TextButton(
                          child: Text(
                            AppStrings.signUp,
                            style: TextStyle(
                              fontSize: AppSize.s18,
                              color: ColorManager.primary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserRegisterScreen(),
                              ),
                            );
                          },
                        ),
                      ],
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
