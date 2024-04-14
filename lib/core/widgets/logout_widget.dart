// // ignore_for_file: avoid_print

// class BottomDialog {
//   final AppPreferences _appPreferences = sl<AppPreferences>();

//   void showBottomDialog(BuildContext context) {
//     showGeneralDialog(
//       barrierLabel: "showGeneralDialog",
//       barrierDismissible: true,
//       barrierColor: Colors.black.withOpacity(0.6),
//       transitionDuration: const Duration(milliseconds: 400),
//       context: context,
//       pageBuilder: (context, _, __) {
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: _buildDialogContent(context),
//         );
//       },
//       transitionBuilder: (_, animation1, __, child) {
//         return SlideTransition(
//           position: Tween(
//             begin: const Offset(0, 1),
//             end: const Offset(0, 0),
//           ).animate(animation1),
//           child: child,
//         );
//       },
//     );
//   }

//   Widget _buildDialogContent(BuildContext context) {
//     return IntrinsicHeight(
//       child: Container(
//         width: double.maxFinite,
//         clipBehavior: Clip.antiAlias,
//         padding: const EdgeInsets.all(AppSize.s16),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(AppSize.s25),
//             topRight: Radius.circular(AppSize.s25),
//           ),
//         ),
//         child: Material(
//           child: Column(
//             children: [
//               _buildIcon(),
//               _buildLogoutText(),
//               const SizedBox(height: 16),
//               _buildButtons(context),
//               const SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildIcon() {
//     const icon = IconBroken.Logout;
//     return const SizedBox(
//       height: 88,
//       child: Icon(
//         icon,
//         size: 50,
//       ),
//     );
//   }

//   Widget _buildLogoutText() {
//     return const Text(
//       'Are you sure want to logout?',
//       style: TextStyle(
//         fontSize: AppSize.s16,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget _buildButtons(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: AppSize.s130,
//           height: AppSize.s40,
//           child: OutlinedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             style: ButtonStyle(
//               side: MaterialStateProperty.all(
//                 BorderSide(
//                   color: ColorManager.primary,
//                 ),
//               ),
//               backgroundColor: MaterialStateProperty.all(ColorManager.white),
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s16),
//                 ),
//               ),
//             ),
//             child: Text(
//               'Cancel',
//               style: TextStyle(
//                 color: ColorManager.primary,
//                 fontSize: AppSize.s16,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: AppSize.s30,
//         ),
//         SizedBox(
//           width: AppSize.s130,
//           height: AppSize.s40,
//           child: OutlinedButton(
//             onPressed: () {
//               _appPreferences.logout();
//               Constants.isLogout = true;
//               Phoenix.rebirth(context);
//               print("logeddddddddddddddddddddddd out");
//             },
//             style: ButtonStyle(
//               side: MaterialStateProperty.all(
//                 BorderSide(
//                   color: ColorManager.primary,
//                 ),
//               ),
//               backgroundColor: MaterialStateProperty.all(ColorManager.primary),
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s16),
//                 ),
//               ),
//             ),
//             child: Text(
//               'Yes, Logout',
//               style: TextStyle(
//                 color: ColorManager.white,
//                 fontSize: AppSize.s16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
