import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/service_widget.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  final TextEditingController _searchServices = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          ImageAssets.homeBackGrd,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<BookingCubit, BookingState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              if (state.isLoading) {
                return const SizedBox(
                  height: 500,
                  child: Align(
                    alignment: Alignment.center,
                    child: LoadingWidget(),
                  ),
                );
              }
              return Column(
                children: [
                  AppBarWidget(
                    isBack: true,
                    title: 'Services',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p10,
                      horizontal: 50,
                    ),
                    child: Card(
                      elevation: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppStrings.search,
                          hintStyle: TextStyle(
                            color: ColorManager.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                        ),
                        controller: _searchServices,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state.servicesList.isNotEmpty,
                    builder: (context) => SizedBox(
                      height: 550,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.servicesList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: AppSize.s5,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ServiceWidget(
                          serviceModel: state.servicesList[index],
                          index: index,
                        ),
                      ),
                    ),
                    fallback: (context) =>
                        const Text("No Services are available."),
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
