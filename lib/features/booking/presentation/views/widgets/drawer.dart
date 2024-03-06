import 'package:flutter/material.dart';
import 'package:racnety/core/global/resources/icons_manger.dart';
import 'package:racnety/core/global/resources/values_manger.dart';
import 'package:racnety/core/themes/color_manager.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback? onTap;
  const MyDrawer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
          bottomLeft: Radius.circular(AppSize.s20),
        ),
        color: ColorManager.grey,
      ),
      height: 530.0,
      width: 250,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
          bottomLeft: Radius.circular(AppSize.s20),
        ),
        child: Drawer(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Image.asset(
                    'assets/images/splash_logo.png',
                    scale: AppSize.s1,
                  ),
                  Text(
                    "Raknety",
                    style: TextStyle(
                      fontSize: AppSize.s20,
                      color: ColorManager.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              SizedBox(
                height: AppSize.s350,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(
                        IconBroken.Profile,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HelpPage(),
                        //   ),
                        // );
                      },
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.car_repair_outlined,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'New Booking',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HelpPage(),
                        //   ),
                        // );
                      },
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.note_outlined,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'View Booking',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HelpPage(),
                        //   ),
                        // );
                      },
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_enabled_outlined,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'Content us',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ContactUsPage(),
                        //   ),
                        // );
                      },
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        IconBroken.Setting,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'Services',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ContactUsPage(),
                        //   ),
                        // );
                      },
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: ColorManager.black,
                      ),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: onTap,
                      splashColor: ColorManager.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
