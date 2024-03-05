// // ignore_for_file: must_be_immutable, library_private_types_in_public_api

// import 'package:flutter/material.dart';


// class Calendar extends StatefulWidget {
//   Calendar({
//     required this.selectedDate,
//     super.key,
//   });

//   Function(String date, String day) selectedDate;

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   String selectedDate = DateTime.now()
//       .toString()
//       .substring(0, 10); // To track date (format: "2023-07-01")

//   List<String> listOfMonths = [
//     "Jan",
//     "Feb",
//     "Mar",
//     "Apr",
//     "May",
//     "Jun",
//     "Jul",
//     "Aug",
//     "Sep",
//     "Oct",
//     "Nov",
//     "Dec",
//   ];

//   List<String> listOfDays = [
//     "Mon",
//     "Tue",
//     "Wed",
//     "Thu",
//     "Fri",
//     "Sat",
//     "Sun",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: AppSize.s100,
//           child: ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.only(left: AppPadding.p12),
//             itemCount: 365,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               final currentDate = DateTime.now().add(Duration(days: index));
//               final isSelected =
//                   currentDate.toString().substring(0, 10) == selectedDate;
//               String day = index >= 7
//                   ? listOfDays[currentDate.weekday - 1]
//                   : listOfDays[index];
//               return Padding(
//                 padding: const EdgeInsets.only(right: AppPadding.p8),
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       selectedDate = currentDate.toString().substring(0, 10);
//                       widget.selectedDate(selectedDate, day);
//                     });
//                   },
//                   child: SizedBox(
//                     height: AppSize.s80,
//                     width: AppSize.s70,
//                     child: Card(
//                       elevation: AppSize.s3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(AppSize.s12),
//                       ),
//                       color: isSelected
//                           ? ColorManager.primary
//                           : ColorManager.white,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             listOfMonths[currentDate.month - 1],
//                             style: TextStyle(
//                               fontSize: AppSize.s16,
//                               color: isSelected
//                                   ? ColorManager.white
//                                   : ColorManager.black,
//                             ),
//                           ),
//                           const SizedBox(height: AppSize.s5),
//                           Text(
//                             currentDate.day.toString(),
//                             style: TextStyle(
//                               fontSize: AppSize.s22,
//                               fontWeight: FontWeight.w700,
//                               color: isSelected
//                                   ? ColorManager.white
//                                   : ColorManager.black,
//                             ),
//                           ),
//                           const SizedBox(height: AppSize.s5),
//                           Text(
//                             listOfDays[currentDate.weekday - 1],
//                             style: TextStyle(
//                               fontSize: AppSize.s16,
//                               color: isSelected
//                                   ? ColorManager.white
//                                   : ColorManager.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
