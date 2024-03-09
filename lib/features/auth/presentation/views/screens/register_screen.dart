import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_constants.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/horizontal_or_line_widget.dart';

class UserRegisterScreen extends StatelessWidget {
  UserRegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>(); // create validation

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
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
                    ImageAssets.splashLogo,
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
                  hintText: AppStrings.passwordHint,
                  controller: _passwordEditingController,
                  type: TextInputType.number,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  prefix: Icons.lock_outline_rounded,
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
                  prefix: Icons.lock_outline_rounded,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                FormFieldWidget(
                  headText: AppStrings.phoneNumberHeadText,
                  hintText: AppStrings.phoneNumberHint,
                  controller: _passwordEditingController,
                  type: TextInputType.text,
                  validator: (input) =>
                      input!.isValidPhone() ? null : AppStrings.phoneError,
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
                    if (_formKey.currentState!.validate()) {}
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
          ),
        ),
      ),
    );
  }
}
