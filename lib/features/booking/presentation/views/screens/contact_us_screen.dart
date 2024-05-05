import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/functions.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:parking_app/features/auth/presentation/views/widgets/horizontal_or_line_widget.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  final TextEditingController _message = TextEditingController();
  final TextEditingController _fullNameEditingController =
      TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'Contact Us',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: AppStrings.nameHint,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s20,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: AppStrings.nameHint,
                      hintStyle: TextStyle(
                        color: ColorManager.grey,
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: ColorManager.grey,
                        ),
                        onPressed: () {},
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                    ),
                    controller: _fullNameEditingController,
                    keyboardType: TextInputType.name,
                    validator: (input) =>
                        input!.isValidName() ? null : AppStrings.nameError,
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: AppStrings.emailAddressHint,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s20,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: AppStrings.emailAddressHint,
                      hintStyle: TextStyle(
                        color: ColorManager.grey,
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.email,
                          color: ColorManager.grey,
                        ),
                        onPressed: () {},
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                    ),
                    controller: _emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) =>
                        input!.isValidEmail() ? null : AppStrings.nameError,
                    obscureText: false,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: AppStrings.message,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s20,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AppStrings.message,
                        hintStyle: TextStyle(
                          color: ColorManager.grey,
                        ),
                        prefixIcon: Text(''),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          borderSide: BorderSide(
                            color: ColorManager.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          borderSide: BorderSide(
                            color: ColorManager.primary,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.error,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          borderSide: BorderSide(
                            width: AppSize.s1_5,
                            color: ColorManager.error,
                          ),
                        ),
                      ),
                      controller: _message,
                      maxLines: 5,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    Positioned(
                      left: 12,
                      top: 20,
                      child: Icon(
                        Icons.email_outlined,
                        color: ColorManager.grey,
                      ),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: AppSize.s20,
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
                text: AppStrings.sendMessage,
                fontWeight: FontWeight.bold,
                onTap: () async {},
              ),
              const HorizontalOrLineWidget(
                label: AppStrings.or,
                height: AppSize.s60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook,
                      size: AppSize.s50,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.s20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage(
                        ImageAssets.googleLogoIcon,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
