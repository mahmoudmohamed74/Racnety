import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/requests/register_request.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_constants.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/horizontal_or_line_widget.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.statusCode == 200 || state.statusCode == 201) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarWidget(
                    text: Text(
                      "Your request has been sent successfully...",
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s16,
                      ),
                    ),
                    backGroundColor: Colors.green,
                  ),
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginView,
                );
              }
              if (state.error == '2') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarWidget(
                    text: Text(
                      "user register error ",
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s16,
                      ),
                    ),
                    backGroundColor: ColorManager.error,
                  ),
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
                      AppStrings.signUpForFree,
                      style: TextStyle(
                        fontSize: AppSize.s15,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Text(
                      AppStrings.signUpAnnotation,
                      style: TextStyle(
                        fontSize: AppSize.s15,
                        color: ColorManager.grey,
                      ),
                    ),
                    FormFieldWidget(
                      headText: AppStrings.userNameHeadText,
                      hintText: AppStrings.userNameHint,
                      controller: _userNameEditingController,
                      type: TextInputType.name,
                      validator: (String? s) {
                        if (s!.length < Constants.three) {
                          return AppStrings.userNameError;
                        }
                        return null;
                      },
                      prefix: Icons.person_outline_rounded,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    FormFieldWidget(
                      headText: AppStrings.emailHeadText,
                      hintText: AppStrings.emailHint,
                      controller: _emailEditingController,
                      type: TextInputType.emailAddress,
                      validator: (input) =>
                          input!.isValidEmail() ? null : AppStrings.emailError,
                      prefix: Icons.mail_outline_rounded,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    FormFieldWidget(
                      headText: AppStrings.passwordHeadText,
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
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    FormFieldWidget(
                      headText: AppStrings.confirmPasswordHeadText,
                      hintText: AppStrings.confirmPasswordHint,
                      controller: _confirmPasswordEditingController,
                      type: TextInputType.number,
                      validator: (String? s) {
                        if (_passwordEditingController.text !=
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
                      height: AppSize.s12,
                    ),
                    FormFieldWidget(
                      headText: AppStrings.phoneNumberHeadText,
                      hintText: AppStrings.phoneNumberHint,
                      controller: _phoneEditingController,
                      type: TextInputType.text,
                      validator: (input) => input!.isValidPhone(input)
                          ? null
                          : AppStrings.phoneError,
                      prefix: Icons.phone_iphone_outlined,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    TextButtonWidget(
                      icon: Container(
                        width: AppSize.s0,
                      ),
                      borderColor: ColorManager.primary,
                      backGroundColor: ColorManager.primary,
                      textColor: ColorManager.white,
                      width: AppSize.s330,
                      height: AppSize.s52,
                      text: AppStrings.signUp,
                      fontWeight: FontWeight.bold,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<AuthCubit>()
                              .register(
                                RegisterRequest(
                                  id: 0,
                                  userName: _userNameEditingController.text,
                                  email: _emailEditingController.text,
                                  phoneNumber: _phoneEditingController.text,
                                  password: _passwordEditingController.text,
                                  fullName: '',
                                  address: '',
                                  longitude: '',
                                  latitude: '',
                                ),
                              )
                              .whenComplete(() {
                            _emailEditingController.clear();
                            _passwordEditingController.clear();
                            _confirmPasswordEditingController.clear();
                            _phoneEditingController.clear();
                            _userNameEditingController.clear();
                          });
                        }
                      },
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
                        const Text(AppStrings.haveAccount),
                        TextButton(
                          child: Text(
                            AppStrings.signIn,
                            style: TextStyle(
                              fontSize: AppSize.s18,
                              color: ColorManager.primary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserLoginScreen()));
                          },
                        )
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
