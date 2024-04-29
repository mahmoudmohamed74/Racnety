// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/views/screens/register_screen.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/horizontal_or_line_widget.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  // final AppPreferences _appPreferences = sl<AppPreferences>();

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
          child: Form(
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
                  hintText: AppStrings.passwordHint,
                  controller: _passwordEditingController,
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
                  condition: true,
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
                                builder: (context) => UserRegisterScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //   BlocConsumer<AuthCubit, AuthState>(
    //   listener: (context, state) async {
    //     // if (state is AuthLogInSuccessState) {
    //     //   // if (state.userData.user!.confirmed == true) {
    //     //   if (state.userData.user!.type == "Doctor") {
    //     //     print("Doctor Login success");
    //     //     await _appPreferences.setIsDoctorLoggedIn();
    //     //     await resetModules();
    //     //     Navigator.pushNamed(
    //     //       context,
    //     //       Routes.layoutDoctorRoute,
    //     //     );
    //     //   } else if (state.userData.user!.type == "Patient") {
    //     //     print("Patient Login success");
    //     //     await _appPreferences.setIsPatientLoggedIn();
    //     //     await resetModules();
    //     //     Navigator.pushReplacementNamed(
    //     //       context,
    //     //       Routes.layoutPatientRoute,
    //     //     );
    //     //   }
    //     //   // } else {
    //     //   //   Navigator.pushNamed(
    //     //   //     context,
    //     //   //     Routes.userEmailConfirmationRoute,
    //     //   //   );
    //     //   // }
    //     // } else if (state is AuthLogInErrorState) {
    //     //   print("Doctor Login error");
    //     //
    //     //   ScaffoldMessenger.of(context).showSnackBar(
    //     //     SnackBarWidget(
    //     //       text: Text(
    //     //         state.error,
    //     //         style: TextStyle(
    //     //           color: ColorManager.white,
    //     //           fontSize: AppSize.s16,
    //     //         ),
    //     //       ),
    //     //       backGroundColor: ColorManager.error,
    //     //     ),
    //     //   );
    //     // }
    //   },
    //   builder: (context, state) {
    //     // final cubit = AuthCubit.get(context);
    //
    //   },
    // );
  }
}
